<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>questionList</title>
		<!-- 모달css -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	</head>
	<body>
		<!-- 시험회차, 회차제목, 회차수정(모달), 문제번호, 문제내용 -->
		${test.testTitle }.(${test.testDate})
		<!-- 회차수정 -->
		<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modifyTest">회차수정</button>
		<form action="${pageContext.request.contextPath}/teacher/modifyTest" method="post">
			<input type="hidden" name="testNo" value="${testNo}">
			<div class="modal" id="modifyTest">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h4 class="modal-title">회차수정</h4>
							<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
						</div>
						<div class="modal-body">
							회차제목 : <input type="text" name="testTitle" value="${test.testTitle}">
						</div>
						<div>
							<button type="submit">회차수정</button>
						</div>
					</div>
				</div>
			</div>
		</form>
		<c:forEach var="q" items="${list}">
			<div>
				${q.questionIdx}. ${q.questionTitle}
				<a href="${pageContext.request.contextPath}/teacher/exampleList?questionNo=${q.questionNo}">문제관리</a>
				<a href="${pageContext.request.contextPath}/teacher/removeQuestion?questionNo=${q.questionNo}&testNo=${testNo}">문제삭제</a>
				[배점 : 10]
			</div>
		</c:forEach>
		<c:if test="${questionIdx != 11}">
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
		</c:if>
	</body>
</html>