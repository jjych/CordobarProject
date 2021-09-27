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
        <nav class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top" id="mainNav">
            <div class="container">
                <a class="navbar-brand" href="#page-top">코르도바 게시판 프로젝트</a>
                <button class="navbar-toggler text-uppercase font-weight-bold bg-primary text-white rounded" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    Menu
                    <i class="fas fa-bars"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="main">로그아웃</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        
        <!-- BoardView Section-->
        <section class="masthead text-white text-center">
            <div class="container">
            <!-- BoardView Section Heading-->
                <h2 class="page-section-heading text-center text-uppercase text-secondary mb-0">게시판</h2>
                <br>
                <!-- Icon Divider-->
                <form method="POST" action="productSearch" id ="search" name="search" style="float:right;">
					<div class="list-group" style="display:flex; flex-direction:row;">
						<input type="text" class="form-control" placeholder="검색창" id="keyword" name="keyword" style="width: 230px; height: 50px;">
						<input type="date" class="form-control" id="date" name="date" style="width: 180px; height: 50px;">
						<button type="submit" class="btn btn-default" style="width:50px; height:30px;"> 
						<i class="fa fa-search" style="width: 50px; height: 30px; color: black;"></i></button>
					</div>
				</form>
				<br>
				<br>
				<br>
			<table class="table" style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="6" style="background-color: #eeeeee; text-align: center;">글 보기</th>
						</tr>
					</thead>
					<tbody>
						<tr style="background-color: #eeeeee;">
							<td style="width: 10%;">No</td>
							<td style="width: 40%;">제목</td>
							<td style="width: 20%;">작성자</td>
							<td style="width: 30%;">작성일</td>
						</tr>
						<%-- <c:forEach items="${boardList}" var="board"> --%>
						<form action="CustomerWriteAnswer" method="post">
						 <input type="hidden" id="bNum" name="bNum" value="${board.getbNum() }">
							<tr>
							<%-- <td>${board.getbNum() }</td>
							<td>
								<input type="submit" class="btn" value="${board.getbTitle() }" style="height:30px; position:relative; top:-8px; color: #004d99;" >				
							</td>
							<td>${board.getmName() }</td>
							<td>${board.getbDate() }</td> --%>
								<td>2</td>
								<td>테스트입니다.</td>
								<td>관리자</td>
								<td>2021.09.27</td>
							</tr>
							<tr>
								<td>1</td>
								<td>테스트입니다.</td>
								<td>관리자</td>
								<td>2021.09.27</td>
							</tr>
						</form>
						<%-- </c:forEach> --%>
					</tbody>
				</table>
				
				<!-- 글쓰기 버튼 -->
				<div style="text-align:right;">
						<a href="BoardWrite" class="btn btn-info">글쓰기</a>
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
