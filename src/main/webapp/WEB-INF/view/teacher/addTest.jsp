<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>addTest</title>
	</head>
	<body>
		<h1>회차등록</h1>
		<form action="${pageContext.request.contextPath}/teacher/addTest" method="post">
			<input type="hidden" name="teacherNo" value="${loginTeacher.teacherNo}">
			<table border="1">
				<tr>
					<td>testTitle</td>
					<td>
						<input type="text" name="testTitle">
					</td>
				</tr>
				<tr>
					<td>teacherName</td>
					<td>
						${loginTeacher.teacherName}
					</td>
				</tr>
			</table>
			<div>
				<button type="submit">등록</button>
			</div>
		</form>
	</body>
</html>