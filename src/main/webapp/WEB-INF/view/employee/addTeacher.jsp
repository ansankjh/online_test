<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>addTacher</title>
	</head>
	<body>
		<h1>선생님 등록</h1>
		<div>${msg}</div>
		<form action="${pageContext.request.contextPath}/employee/addTeacher" method="post">
			<table border="1">
				<tr>
					<td>선생님 아이디</td>
					<td>
						<input type="text" name="teacherId">
					</td>
				</tr>
				<tr>
					<td>선생님 비밀번호</td>
					<td>
						<input type="password" name="teacherPw">
					</td>
				</tr>
				<tr>
					<td>선생님 이름</td>
					<td>
						<input type="text" name="teacherName">
					</td>
				</tr>
			</table>
			<div>
				<button type="submit">등록</button>
			</div>
		</form>
	</body>
</html>