<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<header class="d-flex justify-content-center align-items-between">
		<img src="/static/images/logo.png" width="300px">
		
		<c:if test="${not empty nickname }">
		<div class="mr-3">${nickname } <a href="/user/logout">로그아웃</a></div>
		</c:if>
	</header>
	
</body>
</html>