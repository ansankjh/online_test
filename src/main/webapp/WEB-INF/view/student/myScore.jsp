<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>myScore</title>
	</head>
	<body>
		<h1>성적확인</h1>
		<!-- 시험지 출력해서 맞은거 틀린거 표시 -->
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
							${q.questionIdx}. ${q.questionTitle} &nbsp; 
							<c:forEach var="s" items="${list2}">
								<c:if test="${q.questionNo eq s.questionNo}">
									${s.answer}
								</c:if>
							</c:forEach> 
						</td>
					</tr>
					<!-- 구분선 -->
					<tr>
						<td><hr></td>
					</tr>
				</c:if>
				<!-- 보기-->
				<tr>
					<td>
						[${q.exampleIdx}]. ${q.exampleTitle}
					</td>
				</tr>
			</table>
		</c:forEach>
		<!-- 시험점수 표시 맞은개수*10 -->
		${s}
	</body>
</html>