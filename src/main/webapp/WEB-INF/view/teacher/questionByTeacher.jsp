<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>questionByTeacher</title>
	</head>
	<body>
		<h1>시험문제</h1>
		<c:if test="${questionCnt != 10}">
			<a href="${pageContext.request.contextPath}/teacher/addQuestion?testNo=${testNo}">문제추가</a>
		</c:if>
		
		<div>
			<br>
			<c:forEach var="q" items="${list}">
				<div>
					${q.questionIdx}. ${q.questionTitle}
					<a href="${pageContext.request.contextPath}/teacher/modifyQuestion?question=${q.questionNo}">문제수정</a>
					<a href="${pageContext.request.contextPath}/teacher/removeQuestion?question=${q.questionNo}">문제삭제</a>
				</div>
				<div>
					<c:forEach var="e" items="${eList}">
						<c:if test="${q.questionNo == e.questionNo}">
							<div>
								[${e.exampleIdx}]. ${e.exampleTitle}
								<a href="${pageContext.request.contextPath}/teacher/modifyExample?exampleNo=${e.exampleNo}">수정</a>
								<a href="${pageContext.request.contextPath}/teacher/removeExample?exampleNo=${e.exampleNo}">삭제</a>
							</div>
						</c:if>
					</c:forEach>
					<br>
				</div>
			</c:forEach>
		</div>
	</body>
</html>