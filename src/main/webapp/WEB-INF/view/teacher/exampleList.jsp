<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>exampleList</title>
	</head>
	<body>
		<!-- 보기목록 -->
		<h1>${q.questionTitle}</h1>
		<c:forEach var="e" items="${list}">
			<div>
				${e.exampleIdx}. ${e.exampleTitle} [${e.exampleOx}]
				<!-- 보기수정을 모달로 할지 말지 결정못함 --> -->
				<a href="${pageContext.request.contextPath}/teacher/modifyExample?questionNo=${e.questionNo}">보기수정</a>
			</div>
		</c:forEach>
		<br>
		<div>
			<!-- 보기등록 -->
			<form action="${pageContext.request.contextPath}/teacher/addExample" method="post">
				<table border="1">
					<tr>
						<td>questionNo</td>
						<td>
							<input type="number" name="questionNo" value="${questionNo}" readonly="readonly">
						</td>
					</tr>
					<tr>
						<td>exampleIdx</td>
						<td>
							<input type="number" name="exampleIdx" value="${idx}" readonly="readonly">
						</td>
					</tr>
					<tr>
						<td>exampleTitle</td>
						<td>
							<input type="text" name="exampleTitle">
						</td>
					</tr>
					<tr>
						<td>exampleOx</td>
						<td>
							<input type="checkbox" name="exampleOx" value="정답">정답
							<input type="checkbox" name="exampleOx" value="오답">오답
						</td>
					</tr>
				</table>
				<c:if test="${idx != 4}">
					<div>
						<button type="submit">보기등록</button>
					</div>
				</c:if>
			</form>
		</div>
		<!-- 문제수정 -->
	</body>
</html>