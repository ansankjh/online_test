<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>addStudent</title>
	</head>
	<body>
		<h1>학생등록</h1>
		<div>${msg}</div>
		<form action="${pageContext.request.contextPath}/employee/addStudent" method="post">
			<table border="1">
				<tr>
					<td>학생아이디</td>
					<td>
						<input type="text" name="studentId">
					</td>
				</tr>
				<tr>
					<td>학생비밀번호</td>
					<td>
						<input type="password" name="studentPw">
					</td>
				</tr>
				<tr>
					<td>학생이름</td>
					<td>
						<input type="text" name="studentName">
					</td>
				</tr>
			</table>
			<div>
				<button type="submit">등록</button>
			</div>
		</form>
	</body>
</html>