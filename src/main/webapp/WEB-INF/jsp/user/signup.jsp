<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign up</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="/static/css/join.css" type="text/css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
</head>
<body>

	<div id="wrap" class="container">
		<section class="content d-flex justify-content-center my-5">
			<div>
				<div class="login-box d-flex justify-content-center align-items-start bg-white border rounded">
					<div class="w-100 p-4">
						<img src="/static/images/logo.png" width="400px" class="mb-3">
						<br>
						<div class="text-center">
							<b class="text-secondary">Share your Snap</b>
						</div> <br>
						
						<div class="d-flex mt-3">
							<input type="text" id="emailInput" class="form-control" placeholder="Email">
							<button type="button" class="btn btn-sm ml-2 text-white" id="isDuplicateBtn" style="background-color: rgb(137, 6, 255);">중복확인</button>
						</div>
						<div class="small text-success d-none" id="availableText">사용가능한 아이디 입니다</div>
						<div class="small text-danger d-none" id="duplicateText">중복된 아이디 입니다</div>
					
						<input type="password" id="passwordInput" class="form-control mt-3" placeholder="Password">
						<input type="password" id="passwordConfirmInput" class="form-control mt-3" placeholder="Confirm password">
						
						<input type="text" id="nameInput" class="form-control mt-3" placeholder="Full Name">
						<input type="text" id="userNameInput" class="form-control mt-3" placeholder="Username">
						<input type="text" id="phoneNumberInput" class="form-control mt-3" placeholder="Phone Number">
						<input type="text" id="genderInput" class="form-control mt-3" placeholder="Gender">
						<input type="text" id="birthInput" class="form-control mt-3" placeholder="Birth"> <br>
						<textarea id="introduceInput" class="form-control" cols="40px" rows="5" placeholder="Introduce"></textarea>
						
						<button type="button" id="signUpBtn" class="btn btn-info btn-block mt-3" style="background-color: rgb(137, 6, 255);">Sign Up</button>
				
					</div>
					
				</div>
				<div class="mt-4 p-3 d-flex justify-content-center align-items-start bg-white  border rounded">
					<div class="mr-2">
					Already have an account?
					</div>
					<a href="/user/signin">Login</a>
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
			
			// 중복확인 체크 여부
			var isCheckDuplicate = false;
			var isDuplicate = true;
			
			$("#emailInput").on("input", function() {
				
				isCheckDuplicate = false;
				isDuplicate = true;
				
				$("#availableText").addClass("d-none");
				$("#duplicateText").addClass("d-none");				
			});
			
			
			$("#isDuplicateBtn").on("click", function() {
				
				let email = $("#emailInput").val();
				
				if(email == "") {
					alert("이메일을 입력하세요");
					return ;
				}
				
				$.ajax({
					type:"get"
					, url:"/user/duplicate-id"
					, data:{"email":email}
					, success:function(data) {
						
						isCheckDuplicate = true;
						
						if(data.isDuplicate) {
							// 중복되었다.
							$("#duplicateText").removeClass("d-none");
							$("#availableText").addClass("d-none");
							
							isDuplicate = true;
						} else {
							// 중복되지 않았다.
							$("#availableText").removeClass("d-none");
							$("#duplicateText").addClass("d-none");
							
							isDuplicate = false;
						}
					}
					
					, error:function() {
							alert("중복 확인 에러");
					}
				});
			})
			
		
			$("#signUpBtn").on("click", function() {
				let email = $("#emailInput").val();
				let password = $("#passwordInput").val();
				let passwordConfirm = $("#passwordConfirmInput").val();
				let name = $("#nameInput").val();
				let userName = $("#userNameInput").val();
				let phoneNumber = $("#phoneNumberInput").val();
				let gender = $("#genderInput").val();
				let birth = $("#birthInput").val();
				let introduce = $("#introduceInput").val();
				
				
				if (email == "") {
					alert("아이디를 입력하세요");
					return ;
				}
				
				// 중복 체크가 안된 경우
				if(!isCheckDuplicate) {
					alert("이메일 중복체크를 해주세요");
					retrun ;
				}
				
				// 중복된 id인 경우
				if(isDuplicate) {
					alert("이메일이 중복되었습니다");
					return ;
				}
				
				if (password == "") {
					alert("비밀번호를 입력하세요");
					return ;
				}
				
				if (password != passwordConfirm) {
					alert("비밀번호가 일치하지 않습니다");
					return ;
				}
				
				if (userName == "") {
					alert("닉네임을 입력하세요");
					return ;
				}
				
				if (phoneNumber == "") {
					alert("전화번호를 입력하세요");
					return ;
				}
				
				if (gender == "") {
					alert("성별을 입력하세요");
					return ;
				}
				
				if (birth == "") {
					alert("생년월일을 입력하세요");
					return ;
				}
				
				$.ajax({
					type:"post"
					, url:"/user/signup"
					, data:{"email":email, "password":password, "name":name, "userName":userName, "phoneNumber":phoneNumber, "gender":gender, "birth":birth, "introduce":introduce}
					, success:function(data) {
						if (data.result == "success") {
							location.href = "/user/signin";
						} else {
							alert("회원가입 실패");
						}
					}
					, error:function() {
						alert("회원가입 에러");
					}
				});
				
				
				

			});
		});
	</script>

	
	
	
	
	
	
	
	
</body>
</html>