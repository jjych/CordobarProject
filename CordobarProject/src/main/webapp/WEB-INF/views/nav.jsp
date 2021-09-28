<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


	  <c:if test = "${member != null }">
	  	<c:if test = "${msg3 == false }">
	  		<script>
	  			alert('로그인 성공!!')
	  		</script>
	  	</c:if>
		<nav class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top" id="mainNav">
            <div class="container">
                <a class="navbar-brand" href="#page-top">코르도바 게시판 프로젝트</a>
                <button class="navbar-toggler text-uppercase font-weight-bold bg-primary text-white rounded" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    Menu
                    <i class="fas fa-bars"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ms-auto">
                    	<li class="nav-item mx-0 mx-lg-1"><p class="py-3 px-0 px-lg-3" style="color:white; position:relative; top:3px;">${member.getmName() } 님</p></li>
                        <li>
                        	<form method="post" action="logout">
								<input type="submit" class="btn py-3 px-0 px-lg-3" id="logoutbtn" value="로그아웃" style="color:white;">
							</form>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
      </c:if>	
		
      <c:if test = "${member == null }">
        <c:if test = "${msg2 == false }">
        	<script>
        		alert('로그아웃 되었습니다.')
        	</script>
        </c:if>
        <c:if test = "${msg == false }">
        	<script>
        		alert('아이디 비밀번호를 다시 확인해주세요.')
        	</script>
        </c:if>
		<nav class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top" id="mainNav">
            <div class="container">
                <a class="navbar-brand" href="#page-top">코르도바 게시판 프로젝트</a>
                <button class="navbar-toggler text-uppercase font-weight-bold bg-primary text-white rounded" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    Menu
                    <i class="fas fa-bars"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="main">로그인</a></li>
                    </ul>
                </div>
            </div>
        </nav>
      </c:if>