<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>paper</title>
	</head>
	<body>
		<h1>${testTitle}</h1>
		<form action="${pageContext.request.contextPath}/student/addPaper" method="post">
			<c:forEach var="p" items="${list}">
				<div>
				</div>
			</c:forEach>
		</form>
	</body>
</html>