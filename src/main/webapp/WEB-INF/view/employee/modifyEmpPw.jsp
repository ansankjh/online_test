<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>modifyEmpPw</title>
	</head>
	<body>
		<!-- empMenu include -->
		<div>
			<c:import url="/WEB-INF/view/employee/inc/empMenu.jsp"></c:import>
		</div>
		<h1>${loginEmp.empName}사원 비밀번호 수정</h1>
		<form action="${pageContext.request.contextPath}/employee/modifyEmpPw" method="post">
			<table border="1">
				<tr>
					<td>아이디</td>
					<td>
						<input type="text" name="empId" readonly="readonly" value="${loginEmp.empId}">
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
				<a href="${pageContext.request.contextPath}/employee/empList">취소</a>
			</div>
		</form>
	</body>
</html>