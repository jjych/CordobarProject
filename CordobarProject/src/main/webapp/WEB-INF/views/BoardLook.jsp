<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>코르도바 게시판 프로젝트</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="resources/assets/favicon.ico" />
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v5.15.3/js/all.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="resources/css/styles.css" rel="stylesheet" />
    </head>
    
    <body id="page-top">
        <!-- Navigation-->
        <%@ include file="/WEB-INF/views/nav.jsp" %>
        
        <!-- BoardLook Section-->
        <section class="masthead text-white text-center">
            <div class="container">
            	<h2 class="page-section-heading text-center text-uppercase text-secondary mb-0">게시글</h2>
				<br>
            <table class="table table-striped" style="text-align: center; border:1px solid #dddddd">
                  <!-- 글제목,작성자,작성일 라벨 -->
                 <thead>
                     <tr>
                         <th colspan="6" style="background-color: #eeeeee;">글보기</th>
                     </tr>
                 </thead>
                 
                 <!-- 글내용 -->
                 <tbody>
                     <tr>
                     	 <th colspan="4" style="background-color: #eeeeee;">글 제목</th>
                         <td colspan="2">${board.getbTitle() }</td>
                     </tr>
                     <tr>
                     	 <th colspan="4" style="background-color: #eeeeee;">작성자</th>
                         <td colspan="2">${board.getmName() }</td>
                     </tr>
                     <tr>
                     	 <th colspan="4" style="background-color: #eeeeee;">작성일</th>
                         <td colspan="2">${board.getbDate() }</td>
                     </tr>
                     <tr>
                     	<th colspan="4" style="background-color: #eeeeee;">
                     		글 내용
                     	</th>
                        <td colspan="2" style="text-align: center; width:1180px; max-height:800px;">
                        	${board.getbNote()}
                        </td>
                     </tr>
                     
                     <!-- 사진이미지 보이게하기 -->
                     <tr>
                     <c:choose>
                     	<c:when test = "${board.getbImg() eq null }">
                     		<td colspan="6" style="max-height: 300px; background-color: #eeeeee; text-align: center;">
                         	 첨부파일없음.
                         </td>
                     	</c:when>
                     	<c:when test = "${board.getbImg() ne null }">
                     		<td colspan="6" style="height: 300px; background-color: #eeeeee; text-align: center;">
                         	<img class="img-fluid" src="resources/assets/img${board.getbUrl() }"
											style="width: 300px; height: 300px;" />
                         </td>
                     	</c:when>
                     </c:choose>
                     </tr>
                 </tbody>
            </table>
            
            <!-- 이동버튼 -->
            <div class ="contanier" style="float:right;">
            	<c:choose>
					<c:when test="${board.getmName() eq sessionScope.member.getmName()}">
						<form action="boardDelete" method="POST" style="display:inline;" name = "form">
           					<input type="hidden" id="bNum" name="bNum" value="${board.getbNum()}">
       						<input type="button" class="btn btn-primary" value="삭제" onclick="Delete()">
       						<script>
									function Delete() {
										if (confirm("정말 삭제 하시겠습니까??") == true) { //확인
											document.form.submit();
										} else { //취소
											return false;
										}
									}
							</script>
       					</form>
						<a href="BoardUpdate" class="btn btn-primary">수정</a>
              			<a href="BoardView" class="btn btn-primary">목록</a>
    				</c:when>
    				<c:when test="${board.getmName() ne sessionScope.member.getmName()}">
        			 	<a href="BoardView" class="btn btn-primary">목록</a>
    				</c:when>
				</c:choose>
            </div>
			</div>
        </section>
        
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
        <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
    </body>
</html>
