<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>login</title>
	</head>
	<body>
		<h1>로그인</h1>
		<!-- 사원 -->
		<h4>사원</h4>
		<form action="${pageContext.request.contextPath}/loginEmp" method="post">
			<table border="1">
				<tr>
					<td>사원아이디</td>
					<td>
						<input type="text" name="empId" value="employee">
					</td>
				</tr>
				<tr>
					<td>사원비밀번호</td>
					<td>
						<input type="password" name="empPw" value="123">
					</td>
				</tr>
			</table>
			<div>
				<button type="submit">로그인</button>
			</div>
		</form>
		<!-- 강사 -->
		<h4>강사</h4>
		<form action="${pageContext.request.contextPath}/loginTeacher" method="post">
			<table border="1">
				<tr>
					<td>아이디</td>
					<td>
						<input type="text" name="teacherId" value="teacher">
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
		<!-- 학생 -->
		<h4>학생</h4>
		<form action="${pageContext.request.contextPath}/loginStudent" method="post">
			<table border="1">
				<tr>
					<td>학생아이디</td>
					<td>
						<input type="text" name="studentId" value="student">
					</td>
				</tr>
				<tr>
					<td>학생비밀번호</td>
					<td>
						<input type="password" name="studentPw" value="123">
					</td>
				</tr>
			</table>
			<div>
				<button type="submit">학생로그인</button>
			</div>
		</form>
	</body>
</html>