<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>paper</title>
	</head>
	<body>
		<h1>제 ${t.testNo}회 ${t.testTitle}</h1>
		<h3>응시자 ${loginStudent.studentName}님</h3>
		<c:forEach var="q" items="${list}">
			<table>
				<c:set var="qIdx" value="${q.questionIdx}"/>
				<c:if test="${qIdx != idx}">
					<tr>
						<td><hr></td>
					</tr>
					<c:set var="idx" target="idx" value="${q.questionIdx}"/>
					<!-- 문제 -->
					<tr>
						<td>
							${q.questionIdx}. ${q.questionTitle}
						</td>
					</tr>
					<!-- 구분선 -->
					<tr>
						<td><hr></td>
					</tr>
				</c:if>
				<!-- 보기 -->
				<tr>
					<td>
						[${q.exampleIdx}]. ${q.exampleTitle}
					</td>
				</tr>
			</table>
		</c:forEach>
	</body>
</html>