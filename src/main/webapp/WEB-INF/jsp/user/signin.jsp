<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="/static/css/style.css" type="text/css">
</head>
<body>

	<div class="container">
		<section class="content d-flex justify-content-center my-5">
			<div id="carouselExampleSlidesOnly" class="carousel slide col-6" data-ride="carousel">
				<div class="carousel-inner">
			    	<div class="carousel-item active">
			      		<img class="d-block w-100 h-100 rounded-circle" height="400px" src="/static/images/signin-pic1.jpg" alt="First slide">
			    	</div>
			   		 <div class="carousel-item">
			      		<img class="d-block w-100 h-100 rounded-circle" height="400px" src="/static/images/signin-pic2.jpg" alt="Second slide">
			    	</div>
			    	<div class="carousel-item">
			      		<img class="d-block w-100 h-100 rounded-circle" height="400px" src="/static/images/signin-pic3.jpg" alt="Third slide">
			    	</div>
			  		<div class="carousel-item">
			      		<img class="d-block w-100 h-100 rounded-circle" height="400px" src="/static/images/signin-pic4.jpg" alt="Fourth slide">
			    	</div>
			  	</div>
			</div>
			<div class="col-6">
				<div class="login-box d-flex justify-content-center align-items-start bg-white  border rounded">		
					<div class="w-100 p-5">
						<div>
							<img class="w-100" src="/static/images/logo.png">
						</div>		
						<br>
						<form id="loginForm">
							<input type="text" id="emailInput" class="form-control mt-3" placeholder="Email">
							<input type="password" id="passwordInput" class="form-control mt-3" placeholder="Password">
							<button id="loginBtn" type="submit" class="btn btn-primary btn-block mt-3" style="background-color: rgb(137, 6, 255);">Log in</button>
							<hr/>
						</form>
						
						<div class="text-center text-secondary">Forgot Password?</div>
					</div>
					
				</div>
				<div class="mt-4 p-3 d-flex justify-content-center align-items-start bg-white  border rounded">
					Don't have an account? <a href="/user/signup" class="ml-2" style="color: rgb(137, 6, 255);">Sign Up</a>
				</div>
			</div>
		</section>
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
		
	</div>





	
	
	
	
	
	
	<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	
	
	<script>
		$(document).ready(function() {
/* 			
			$("#loginBtn").on("click", function() { */
			$("#loginForm").on("submit", function(e) {
				
				// form 태그가 가진 페이지 이동 기능을 막자
				e.preventDefault();
				
				let email = $("#emailInput").val();
				let password = $("#passwordInput").val();
				
				if (email == "") {
					alert("이메일을 입력하세요");
					return "";
				}
				
				if (password == "") {
					alert("비밀번호를 입력하세요")
					return "";
				}
				
				$.ajax({
					type:"post"
					, url:"/user/signin"
					, data:{"email":email, "password":password}
					, success:function(data) {
						if (data.result == "success") {
							location.href = "/post/timeline";
						} else {
							alert("아이디와 비밀번호를 확인해주세요");
						}
					}
					, error:function() {
						alert("로그인 에러");
					}
				});
			});
		});
	</script>
	
</body>
</html>