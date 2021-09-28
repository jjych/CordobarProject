package com.spring.ex;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.ex.dto.MemberDto;
import com.spring.ex.service.ServiceProject;

@Controller
public class HomeController {
	
	// 로그인시 필요
	@Autowired
	private ServiceProject ServiceProject;
	
	// 로그인 페이지 (첫시작화면)
	@RequestMapping(value = "main", method = RequestMethod.GET)
	public String main() {
		
		return "main";
	}
	
	// 로그인시 보이는화면
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
	public String BoardView() {
		
		return "BoardView";
		
	}
	
	// 게시글 글쓰기
	@RequestMapping(value = "BoardWrite", method = RequestMethod.GET)
	public String BoardWrite() {
		
		return "BoardWrite";
	}
	
	// 게시글 보기
	@RequestMapping(value = "BoardLook", method = RequestMethod.GET)
	public String BoardLook() {
		
		return "BoardLook";
	}
	
	// 게시글 수정하기
	@RequestMapping(value = "BoardUpdate", method = RequestMethod.GET)
	public String BoardUpdate() {
		
		return "BoardUpdate";
	}
	
}
