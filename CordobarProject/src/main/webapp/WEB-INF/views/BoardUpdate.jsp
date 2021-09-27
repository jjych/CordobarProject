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
        
        <!-- BoardWrite Section-->
        <section class="masthead text-white text-center">
            <div class="container">
            	<h2 class="page-section-heading text-center text-uppercase text-secondary mb-0">글수정</h2>
				<br>
				<form method="post" action="writeAction">
					<input type="hidden" id = "mName" name="mName" value="${member.mName }">
					<div class="" style="text-align:center;">
						<table class="table" style="text-align: center; border: 1px solid #dddddd; background-color: #eeeeee;">
							<thead>
								<tr>
									<td colspan="5" style="background-color: #eeeeee; text-align: center;">게시글 수정</td>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td colspan="5">
										<input type="text" class="form-control" placeholder="적혀있던 글 제목" id="bTitle" name="bTitle" maxlength="50" />
									</td>
								</tr>
								<tr>
									<td colspan="5">
										<textarea class="form-control" placeholder="적혀있던 글 내용" id="bNote" name="bNote" maxlength="2048px;" style="height: 350px; resize: none;"></textarea>
									</td>
								</tr>
								<tr>
									<td colspan="5" style="text-align:left;">
										<input type="file" name="file" id="imageFileOpenInput" accept="image/*">
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div style="text-align:right;">
					    <a href="BoardView" class="btn btn-primary">목록가기</a>
						<input type="submit" class="btn btn-info" value="수정완료" />
					</div>
				</form>
			</div>
        </section>
        
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
        <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
    </body>
</html>