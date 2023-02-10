<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>questionList</title>
	</head>
	<body>
		<!-- 시험회차, 회차제목, 회차수정(모달), 문제번호, 문제내용 -->
		<h1>${test.testTitle }.(${test.testDate})</h1>
		<c:forEach var="q" items="${list}">
			<div>
				${q.questionIdx}. ${q.questionTitle}
				<a href="${pageContext.request.contextPath}/teacher/exampleList?questionNo=${q.questionNo}">문제관리</a>
				<a href="${pageContext.request.contextPath}/teacher/removeQuestion?questionNo=${q.questionNo}&testNo=${testNo}">문제삭제</a>
			</div>
		</c:forEach>
		
		<!-- 문제등록 -->
		<h3>문제등록</h3>
		<form action="${pageContext.request.contextPath}/teacher/addQuestion" method="post">
			<input type="hidden" name="testNo" value="${testNo}">
			<table border="1">
				<tr>
					<td>questionIdx</td>
					<td>
						<input type="number" name="questionIdx" value="${questionIdx}" readonly="readonly">
					</td>
				</tr>
				<tr>
					<td>questionTitle</td>
					<td>
						<input type="text" name="questionTitle">
					</td>
				</tr>
			</table>
			<div>
				<button type="submit">문제등록</button>
			</div>
		</form>
		<!-- 회차수정 -->
		<h3>회차수정</h3>
		<form action="${pageContext.request.contextPath}/teacher/modifyTest" method="post">
			<input type="hidden" name="testNo" value="${testNo}">
			<table>
				<tr>
					<td>testTitle</td>
					<td>
						<input type="text" name="testTitle" value="${test.testTitle}">
					</td>
				</tr>
			</table>
			<div>
				<button type="submit">회차수정</button>
			</div>
		</form>
	</body>
</html>