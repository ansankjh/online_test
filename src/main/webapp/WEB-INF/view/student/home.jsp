<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>home</title>
	</head>
	<body>
		<c:import url="/WEB-INF/view/student/inc/studentMenu.jsp"></c:import>
		<c:forEach var="t" items="${list}">
			<a href="${pageContext.request.contextPath}/student/paper?testNo=${t.testNo}&testTitle=${t.testTitle}">
				[응시가능]${t.testTitle}
			</a>
		</c:forEach>
	</body>
</html>