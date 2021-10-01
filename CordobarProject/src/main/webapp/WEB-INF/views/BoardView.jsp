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
        
        <!-- BoardView Section-->
        <section class="masthead text-white text-center">
            <div class="container">
            <!-- BoardView Section Heading-->
                <h2 class="page-section-heading text-center text-uppercase text-secondary mb-0">게시판</h2>
                <br>
                <!-- Icon Divider-->
                <form method="POST" action="boardSearch" id ="search" name="search" style="float:right;">
					<div class="list-group" style="display:flex; flex-direction:row;">
						<input type="text" class="form-control" placeholder="검색창" id="keyword" name="keyword" style="width: 230px; height: 50px;">
						<!-- <input type="date" class="form-control" id="keyword" name="keyword" style="width: 180px; height: 50px;"> -->
						<button type="submit" class="btn btn-default" style="width:50px; height:30px;"> 
						<i class="fa fa-search" style="width: 50px; height: 30px; color: black;"></i></button>
					</div>
				</form>
				<br>
				<br>
				<br>
			<table class="table table-hover" style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="6" style="background-color: #eeeeee; text-align: center; border-bottom: 1px solid black;">글 보기</th>
						</tr>
						<tr style="background-color: #eeeeee;">
							<td style="width: 10%;">No</td>
							<td style="width: 40%;">제목</td>
							<td style="width: 20%;">작성자</td>
							<td style="width: 30%;">작성일</td>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${boardList}" var="board" varStatus="status">
						 <input type="hidden" id="bNum" name="bNum" value="${board.getbNum() }">
							<tr onclick="location.href='BoardLook?bNum=${board.getbNum()}'">
								<td><c:out value="${(Paging.totalCount - status.index)-((Paging.pageNo-1)*10)}"/></td>
								<td>${board.getbTitle() }</td>
								<td>${board.getmName() }</td>
								<td>${board.getbDate() }</td>
							</tr>
						</c:forEach>
					</tbody>
			</table>
				
			<!-- 글쓰기 버튼 -->
			<div style="text-align:right;">
					<a href="BoardWrite" class="btn btn-info">글쓰기</a>
			</div>
				
			<!-- 게시글 페이징 처리(기준 10개) -->
			<nav aria-label="Page navigation">
				<ul class="pagination justify-content-center">

				<!-- 첫 페이지면 Disabled 아니라면 Enabled -->
				<c:choose>
					<c:when test="${Paging.pageNo eq Paging.firstPageNo }">
						<li class="page-item disabled"><a class="page-link"
							href="BoardView?page=${Paging.prevPageNo}">이전</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link"
							href="BoardView?page=${Paging.prevPageNo}">이전</a></li>
					</c:otherwise>
				</c:choose>
				<!-- 페이지 갯수만큼 버튼 생성 -->
				<c:forEach var="i" begin="${Paging.startPageNo }"
					end="${Paging.endPageNo }" step="1">
					<c:choose>
						<c:when test="${i eq Paging.pageNo }">
							<li class="page-item disabled"><a class="page-link"
								href="BoardView?page=${i}"><c:out value="${i}" /></a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link"
								href="BoardView?page=${i}"><c:out value="${i}" /></a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				
				<!-- 마지막 페이지면 Disabled 아니라면 Enabled -->
				<c:choose>
					<c:when test="${Paging.pageNo eq Paging.finalPageNo }">
						<li class="page-item disabled"><a class="page-link"
							href="BoardView?page=${Paging.nextPageNo}">다음</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link"
							href="BoardView?page=${Paging.nextPageNo}">다음</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
			</nav>
			</div>
        </section>
        
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
        <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
    </body>
</html>
