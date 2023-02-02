<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>loginEmp</title>
	</head>
	<body>
		<!-- 로그인전 -->
		<c:if test="${loginEmp == null}">
			<h1>사원로그인</h1>
			<form action="${pageContext.request.contextPath}/loginEmp" method="post">
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
		</c:if>
		<!-- 로그인 상태 -->
		<c:if test="${loginEmp != null}">
			${loginEmp.getEmpName()}님 환영합니다.<a href="${pageContext.request.contextPath}/employee/logout">로그아웃</a>
		</c:if>
	</body>
</html>