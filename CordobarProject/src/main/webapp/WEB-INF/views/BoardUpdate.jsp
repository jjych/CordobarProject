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
        
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        
        <!-- input file 타입에 css 주기 -->
        <style>
        	.box-file-input label{
  				display:inline-block;
 				background:#23a3a7;
  				color:#fff;
  				padding:0px 15px;
 				line-height:35px;
  				cursor:pointer;
			}

			.box-file-input label:after{
  				content:"파일등록";
			}

			.box-file-input .file-input{
  				display:none;
			}

			.box-file-input .filename{
  				display:inline-block;
  				padding-left:10px;
			}
        </style>
    </head>
    
    <body id="page-top">
        <!-- Navigation-->
        <%@ include file="/WEB-INF/views/nav.jsp" %>
        
        <!-- BoardWrite Section-->
        <section class="masthead text-white text-center">
            <div class="container">
            	<h2 class="page-section-heading text-center text-uppercase text-secondary mb-0">글수정</h2>
				<br>
				<form method="post" action="boardUpdate" enctype="multipart/form-data">
					<input type="hidden" id = "bNum" name="bNum" value="${board.getbNum() }">
					<input type="hidden" id = "mName" name="mName" value = "${member.mName }">
					<div class="" style="text-align:center;">
						<table class="table" style="text-align: center; border: 1px solid #dddddd; background-color: #eeeeee;">
							<thead>
								<tr>
									<td colspan="6" style="background-color: #eeeeee; text-align: center;">게시글 수정</td>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td colspan="1">
										제목
									</td>
									<td colspan="5">
										<input type="text" class="form-control" value="${board.getbTitle() }" id="bTitle" name="bTitle" maxlength="50" />
									</td>
								</tr>
								<tr>
									<td colspan="1">
										내용
									</td>
									<td colspan="5">
										<textarea class="form-control" id="bNote" name="bNote" maxlength="2048px;" style="height: 350px; resize: none;">${board.getbNote() }</textarea>
									</td>
								</tr>
								<!-- 웹으로 접속했을 경우 mobile이 null일 경우 -->
								<c:choose>
									<c:when test ="${mobile eq null }">
										<tr>
											<td colspan="1">첨부파일</td>
											
											<td colspan="5">
									    	<!-- id는 jQuery 사용할때 , name은 controller에 값 호출할때 사용 그래서 둘이 이름이 같으면 안되는것.-->
									    		<div class="box-file-input">
									    			<label><input type="file" id ="bImg" name="baa" class="file-input" accept="image/*"></label>
									    			<span class="filename">${board.getbUrl() }</span>
									    		</div>
												<script>
													$("#bImg").change(function(){
														if(this.files && this.files[0]) {
														var reader = new FileReader;
														reader.onload = function(data) {
															$(".select_img img").attr("src", data.target.result).width(300);        
														}
														reader.readAsDataURL(this.files[0]);
														}
													});
												</script>
												<!-- input file타입 꾸미기 -->
												<script>
												$(document).on("change", ".file-input", function(){
													   
												    $filename = $(this).val();

												    if($filename == "")
												      $filename = "${board.getbUrl() }";

												    $(".filename").text($filename);

												  })
												</script>
											</td>
										</tr>
										<tr>	
											<td colspan = "6" style="text-align:center;">
												<div class="select_img"><img src="" style="max-width:300px; max-height:300px;" /></div>
											</td>
										</tr>
									</c:when>
									<c:when test ="${mobile ne null }">
										<tr>
										<td>첨부파일</td>
								 			<td colspan="6" style="text-align:left;">
												<input type ="button" onclick="test();" value ="사진찍기"> <br><br>
    											<input type = "button" onclick="test2();" value = "갤러리보기"> <br>
    											<div class="select_img"><img id ="myImage" src="" style="width:500px; max-height:600px;"/></div>
    											<script>
												$(document).on("change", ".file-input", function(){
													   
												    $filename = $(this).val();

												    if($filename == "")
												      $filename = "${board.getbUrl() }";

												    $(".filename").text($filename);

												  })
												</script>
											</td>
										</tr>
										<input type="hidden" id="loadImage" name ="loadImage" value="">
									</c:when>
								</c:choose>
								
							</tbody>
						</table>
					</div>
					<div style="text-align:right;">
					    <a href="BoardView" class="btn btn-primary">목록가기</a>
						<input type="submit" class="btn btn-info" value="수정완료" />
					</div>
				</form>
				
				<script>
    			var agent = navigator.userAgent.toLowerCase();
    				if(agent.indexOf('mobile') != -1){
    					var s = document.createElement("script");
    					s.type = "text/javascript";
    					s.src = '<c:url value = "resources/js/cordova.js"/>';
    					$("head").append(s);
    				}
    			</script>
    			
    			<script>

				// device 돌리기
    			$(document).ready(function() {
    				document.addEventListener("deviceready",onDeviceReady,false);

       				function onDeviceReady() {
        			}
    			});

				// 사진찍기 버튼 누를경우
   				function test(){
    				navigator.camera.getPicture(onSuccess, onFail, { 
    					quality: 50,
        				destinationType: Camera.DestinationType.DATA_URL,
        				sourceType : Camera.PictureSourceType.CAMERA,
        				encodingType : Camera.EncodingType.JPEG
    				});
    			}
    
				// 갤러리 버튼 누를경우
    			function test2(){
    				navigator.camera.getPicture(onSuccess, onFail, { 
    					quality: 50,
        				destinationType: Camera.DestinationType.DATA_URL,
        				sourceType : Camera.PictureSourceType.PHOTOLIBRARY,
        				encodingType : Camera.EncodingType.JPEG
    			});
   				}

				// 버튼이 성공적으로 되었을경우 이미지 데이터값을 담아라
    			function onSuccess(imageData) {
        			var image = document.getElementById('myImage');
        			image.src = "data:image/jpeg;base64," + imageData;
        			$('#loadImage').val(imageData);
    			}

				// 버튼이 성공적이지 못했을경우 에러메세지
    			function onFail(message) {
        			alert('Failed because: ' + message);
    			}
    			</script>
			</div>
        </section>
        
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
        <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
    </body>
</html>
