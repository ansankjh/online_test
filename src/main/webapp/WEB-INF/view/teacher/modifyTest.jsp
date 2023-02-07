<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>modifyTest</title>
	</head>
	<body>
		<h1>시험회차 수정</h1>
		<form action="${pageContext.request.contextPath}/teacher/modifyTest" method="post">
			<input type="hidden" name="testNo" value="${test.testNo}">
			<table border="1">
				<tr>
					<td>testTitle</td>
					<td>
						<input type="text" name="testTitle" value="${test.testTitle}">
					</td>
				</tr>
				<tr>
					<td>teacherName</td>
					<td>
						${test.teacherName}
					</td>
				</tr>
			</table>
			<div>
				<button type="submit">수정</button>
			</div>
		</form>
	</body>
</html>