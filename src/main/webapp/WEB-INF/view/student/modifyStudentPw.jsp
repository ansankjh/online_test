<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>modifyStudentPw</title>
	</head>
	<body>
		<h1>${loginStudent.studentName} 비밀번호 수정</h1>
		<form action="${pageContext.request.contextPath}/student/modifyStudentPw" method="post">
			<table border="1">
				<tr>
					<td>아이디</td>
					<td>
						<input type="text" name="studentId" readonly="readonly" value="${loginStudent.studentId}">
					</td>
				</tr>
				<tr>
					<td>기존 비밀번호</td>
					<td>
						<input type="password" name="oldPw">
					</td>
				</tr>
				<tr>
					<td>변경할 비밀번호</td>
					<td>
						<input type="password" name="newPw">
					</td>
				</tr>
			</table>
			<div>
				<button type="submit">수정</button>
			</div>
		</form>
	</body>
</html>