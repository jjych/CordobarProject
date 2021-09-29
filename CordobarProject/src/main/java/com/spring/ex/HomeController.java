package com.spring.ex;

import java.io.File;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.ex.dto.BoardDto;
import com.spring.ex.dto.MemberDto;
import com.spring.ex.dto.PagingVO;
import com.spring.ex.service.ProjectService;
import com.spring.ex.service.ServiceProject;
import com.spring.ex.utils.UploadFileUtils;

@Controller
public class HomeController {
	
	// 게시판용
	@Inject
	ProjectService service;
	
	@Inject
	public HomeController(ProjectService service) {
		this.service = service;
	}
	
	// 로그인시 필요
	@Autowired
	private ServiceProject ServiceProject;
	
	// 메인페이지 (첫시작화면)
	@RequestMapping(value = "main", method = RequestMethod.GET)
	public String main(){
		
		return "main";
	}
	
	// 로그인
	@RequestMapping(value = "/LoginSuccess", method = RequestMethod.POST)
	public String Login(MemberDto ldto, HttpServletRequest req, RedirectAttributes rttr) throws Exception {

		String path = "";
		HttpSession session = req.getSession();

		MemberDto login = ServiceProject.login(ldto);
		if (login == null) {
		    session.setAttribute("member", null);
		    rttr.addFlashAttribute("msg", false);
		    path = "redirect:/main";
		} else {
		    session.setAttribute("member", login);
		    rttr.addFlashAttribute("msg3", false);
		    path = "redirect:/BoardView";
		}

		return path;
	}
	
	//로그아웃
	@RequestMapping(value = "/logout", method = RequestMethod.POST)
	public String logout(HttpSession session, RedirectAttributes rttr) throws Exception {
		session.invalidate();
		rttr.addFlashAttribute("msg2",false);
		return "redirect:/main";
	}
	
	// 게시글 볼수있는페이지 (로그인후 두번째 화면)
	@RequestMapping(value = "BoardView", method = RequestMethod.GET)
	public String BoardView(Model model, HttpServletRequest request) throws Exception {
		
		int totalCount = service.boardTotalCount();
		int page = request.getParameter("page") == null ? 1 : Integer.parseInt(request.getParameter("page"));
		
		
		PagingVO paging = new PagingVO();
		paging.setPageNo(page);
		paging.setPageSize(10);
		paging.setTotalCount(totalCount);
		
		page = (page - 1) * 10;
		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("Page", page);
		map.put("PageSize", paging.getPageSize());
		
		List<BoardDto> list = service.BoardList(map);
		
		model.addAttribute("boardList",list);
		model.addAttribute("Paging", paging);
		
		return "BoardView";
		
	}
	
	// 게시글 글쓰기 페이지
	@RequestMapping(value = "BoardWrite", method = RequestMethod.GET)
	public String BoardWrite() {
		
		return "BoardWrite";
	}
	
	// 글쓰기
	@RequestMapping(value ="writeAction", method = RequestMethod.POST)
	public String writeAction(BoardDto bwrite, MultipartFile file, HttpServletRequest request, RedirectAttributes redirectAttributes) throws Exception {
		
		//파일 업로드
		String imgUploadPath = request.getSession().getServletContext().getRealPath("/resources/assets/img");
		
		String fileName = null;
		
		if(file != null) {
			fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes());
		}
		else {
			fileName = File.separator + "images" + File.separator + "none.png";
		}
		
		bwrite.setbUrl(File.separator + File.separator + fileName);
		bwrite.setbImg(File.separator + File.separator + "s" + File.separator + "s_" + fileName);
		
		ServiceProject.writeAction(bwrite);
		
		return "redirect:/BoardView";
	}
	
	// 게시글 보기 GET
	@RequestMapping("BoardLook")
	public String BoardLook(){
		
		return "BoardLook";
				
	}
	
	// 게시글 보기 POST
	@RequestMapping(value = "BoardLook", method = RequestMethod.POST)
	public String BoardLook(BoardDto bdto, HttpServletRequest req, RedirectAttributes rttr) throws Exception {
		
		String path="";
		HttpSession session2 = req.getSession();
		BoardDto board = ServiceProject.board2(bdto);
		if(board == null) {
			session2.setAttribute("board", null);
			rttr.addFlashAttribute("msg", false);
			path = "redirect:/main";
		} else {
			session2.setAttribute("board", board);
			path = "redirect:/BoardLook";
		}
		
		return path;
	}
	
	// 게시글 수정하기 페이지
	@RequestMapping(value = "BoardUpdate", method = RequestMethod.GET)
	public String BoardUpdate() {
		
		return "BoardUpdate";
	}
	
	// 게시글 수정 하기
	@RequestMapping(value="boardUpdate", method=RequestMethod.POST)
	public String boardUpdate(BoardDto budto,MultipartFile file, HttpServletRequest request, RedirectAttributes redirectAttributes) throws Exception {
		
		//파일 재 업로드
		String imgUploadPath = request.getSession().getServletContext().getRealPath("/resources/assets/img");
				
		String fileName = null;
				
		if(file != null) {
			fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes());
		}
		else {
			fileName = File.separator + "images" + File.separator + "none.png";
		}
		
		budto.setbUrl(File.separator + File.separator + fileName);
		budto.setbImg(File.separator + File.separator + "s" + File.separator + "s_" + fileName);
		
		ServiceProject.BoardUpdate(budto);
		return "redirect:/BoardView";
		
	}
	
	// 게시글 삭제하기(글쓴 장본인이면 가능)
	@RequestMapping(value = "/boardDelete", method = RequestMethod.POST)
	public String boardDelete(BoardDto bddto) throws Exception {
		
		service.boardDelete(bddto);
		
		return "redirect:/BoardView";
			
	}
	
	// 검색 결과 페이지
	@RequestMapping(value = "/boardSearch", method = RequestMethod.GET)
	public String Search(){
		
		return "Search";
	}
	
	// 게시글 검색기능
	@RequestMapping(value = "/boardSearch", method = RequestMethod.POST)
	public String boardSearch(Model model, BoardDto dto, HttpServletRequest request) throws Exception {
			
		String keyword = request.getParameter("keyword");
		
		List<BoardDto> list = service.boardSearch(keyword);
		
		model.addAttribute("boardList",list);
		
		return "Search";
	}
	
}
