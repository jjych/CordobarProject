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
        
        <!-- BoardWrite Section-->
        <section class="masthead text-white text-center">
            <div class="container">
            	<h2 class="page-section-heading text-center text-uppercase text-secondary mb-0">글쓰기</h2>
				<br>
				<form method="post" action="writeAction" enctype="multipart/form-data">
					<input type="hidden" id = "mName" name="mName" value="${member.mName }">
					<div class="" style="text-align:center;">
						<table class="table" style="text-align: center; border: 1px solid #dddddd; background-color: #eeeeee;">
							<thead>
								<tr>
									<td colspan="5" style="background-color: #eeeeee; text-align: center;">게시판 글쓰기 양식 </td>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>제목</td>
									<td colspan="4">
										<input type="text" class="form-control" placeholder="글 제목" id="bTitle" name="bTitle" maxlength="50" />
									</td>
								</tr>
								<tr>
									<td>내용</td>
									<td colspan="4">
										<textarea class="form-control" placeholder="글 내용" id="bNote" name="bNote" maxlength="2048px;" style="height: 350px; resize: none;"></textarea>
									</td>
								</tr>
								<tr>
									<td>첨부파일</td>
									<td colspan="4" style="text-align:left;">
										<input type="file" id="bImg" name="file" accept="image/*">
										<script>
											$("#bImg").change(function(){
												if(this.files && this.files[0]) {
											var reader = new FileReader;
											reader.onload = function(data) {
												$(".select_img img").attr("src", data.target.result).width(500);        
											}
											reader.readAsDataURL(this.files[0]);
											}
											});
										</script>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div style="text-align:right;">
					    <a href="BoardView" class="btn btn-primary">뒤로가기</a>
						<input type="submit" class="btn btn-info" value="글쓰기" />
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
