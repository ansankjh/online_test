<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>loginTeacher</title>
	</head>
	<body>
		<h1>강사 로그인</h1>
		<form action="${pageContext.request.contextPath}/loginTeacher" method="post">
			<table border="1">
				<tr>
					<td>아이디</td>
					<td>
						<input type="text" name="teacherId" value="t1">
					</td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td>
						<input type="password" name="teacherPw" value="123">
					</td>
				</tr>
			</table>
			<div>
				<button type="submit">로그인</button>
			</div>
		</form>
		<a href="${pageContext.request.contextPath}/index">뒤로</a>
	</body>
</html>