<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>addEmp</title>
	</head>
	<body>
		 <h1>사원등록</h1>
		 <div>${errorMsg}</div>
		 <form action="${pageContext.request.contextPath}/employee/addEmp" method="post">
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
		 		<tr>
		 			<td>사원이름</td>
		 			<td>
		 				<input type="text" name="empName">
		 			</td>
		 		</tr>
		 	</table>
		 	<div>
		 		<button type="submit">사원등록</button>
		 	</div>
		 </form>
	</body>
</html>