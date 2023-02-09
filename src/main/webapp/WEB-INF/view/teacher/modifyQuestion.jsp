<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>modifyQuestion</title>
	</head>
	<body>
		<h1>문제수정</h1>
		<form action="${pageContext.request.contextPath}/teacher/modifyQuestion" method="post">
			<input type="hidden" name="questionNo" value="${q.quesitonNo}">
			<input type="hidden" name="testNo" value="${q.testNo}">
			<!-- question -->
			<table border="1">
				<tr>
					<td>문제번호</td>
					<td>
						<input type="number" name="questionIdx" value="${q.questionIdx}">
					</td>
				</tr>
				<tr>
					<td>문제</td>
					<td>
						<textarea cols="30" rows="10" name="questionTitle">${q.questionTitle}</textarea>
					</td>
				</tr>
			</table>
			<!-- example -->
			<table border="1">
				<c:forEach var="e" items="${e}">
					<input type="hidden" name="" value="${e.exampleNo}">
					<tr>
						<td>보기번호</td>
						<td>
							<input type="number" name="exampleList.exampleIdx" value="${e.exampleIdx}">
						</td>
					</tr>
					<tr>
						<td>보기</td>
						<td>
							<textarea cols="30" rows="3" name="exampleList.exampleTitle">${e.exampleTitle}</textarea>
						</td>
					</tr>
					<tr>
						<td>정답체크</td>
						<td>
							<c:if test="${e.exampleOx eq '정답'}">
								<input type="checkbox" name="exampleList.exampleOx" value="정답" checked="checked">정답
								<input type="checkbox" name="exampleList.exampleOx" value="오답">오답
							</c:if>
							<c:if test="${e.exampleOx eq '오답'}">
								<input type="checkbox" name="exampleList.exampleOx" value="정답">정답
								<input type="checkbox" name="exampleList.exampleOx" value="오답" checked="checked">오답
							</c:if>
						</td>
					</tr>
				</c:forEach>
			</table>
			<div>
				<button type="submit">수정</button>
			</div>
		</form>
	</body>
</html>