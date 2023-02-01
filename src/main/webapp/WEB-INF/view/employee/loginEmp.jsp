<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>loginEmp</title>
	</head>
	<body>
		<h1>사원로그인</h1>
		<form action="${pageContext.request.contextPath}/employee/loginEmp" method="post">
			<table border="1">
				<tr>
					<td>사원아이디</td>
					<td>
						<input type="text" name="empId">
					</td>
				</tr>
				<tr>
					<td>사원비밀번호</td>
					<td>
						<input type="password" name="empPw">
					</td>
				</tr>
			</table>
			<div>
				<button type="submit">로그인</button>
			</div>
		</form>
	</body>
</html>