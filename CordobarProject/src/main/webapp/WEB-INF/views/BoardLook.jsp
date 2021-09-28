<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
                         <th colspan="4" style="background-color: #eeeeee;">글 제목</th>
                         <th style="background-color: #eeeeee;">작성자</th>
                         <th style="background-color: #eeeeee;">작성일</th>
                     </tr>
                 </thead>
                 
                 <!-- 글내용 -->
                 <tbody>
                     <tr>
                         <td colspan="4">테스트입니다.</td>
                         <td>관리자</td>
                         <td>2021.09.27</td>
                     </tr>
                     <tr>
                         <td colspan="6" style="height: 300px; text-align: left;">
                         	임시로 써놓은 글입니다.
                         </td>
                     </tr>
                     
                     <!-- 사진이미지 보이게하기 -->
                     <tr>
                         <td colspan="6" style="height: 300px; background-color: #eeeeee; text-align: left;">
                         	사진이 들어갈곳입니다.
                         </td>
                     </tr>
                 </tbody>
            </table>
            
            <!-- 이동버튼 -->
            <div class ="contanier" style="float:right;">
            <form action="boardDelete2" method="POST">
           		<%-- <input type="hidden" id="bNum" name="bNum" value="${board.getbNum()}">
            	<c:choose>
					<c:when test="${board.getmName() eq sessionScope.member.getmName()}">
       					<input type="submit" class="btn btn-primary" value="삭제" style="position:relative; left:1010px;">
              	 		<a href="CustomerWriteView" class="btn btn-primary" style="position:relative; left:1020px;">목록</a>
    				</c:when>
    				<c:when test="${board.getmName() ne sessionScope.member.getmName()}">
        			 	<a href="CustomerWriteView" class="btn btn-primary" style="position:relative; left:1080px;">목록</a>
    				</c:when>
				</c:choose> --%>
				<input type="submit" class="btn btn-primary" value="삭제">
				<a href="CustomerWriteView" class="btn btn-primary">수정</a>
              	<a href="BoardView" class="btn btn-primary">목록</a>
            </form>
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
