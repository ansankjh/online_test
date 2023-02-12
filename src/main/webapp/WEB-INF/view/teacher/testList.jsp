<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>testListByTeacher</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
		<script>
			$(document).ready(function() {
				$('#rowPerPage').change(function() {
					$('#pageForm').submit();
					alert('change');
				});
			});
		</script>
	</head>
	<body>
		${loginTeacher.teacherName}선생님 로그인중
		<a href="${pageContext.request.contextPath}/teacher/teacherLogout">로그아웃</a>
		<h1>시험회차</h1>
		${msg}
		<form action="${pageContext.request.contextPath}/teacher/testList" method="get" id="pageForm">
		<!-- 시험제목 검색 -->
		<label for="searchWord">
			<input type="text" name="searchWord" value="${searchWord}">
			<button type="submit">검색</button>
		</label>
		<!-- rowPerPage -->
		<select name="rowPerPage" id="rowPerPage">
			<c:if test="${rowPerPage == 10}">
				<option value="10" selected="selected">10</option>
				<option value="20">20</option>
				<option value="30">30</option>
			</c:if>
			<c:if test="${rowPerPage == 20}">
				<option value="10">10</option>
				<option value="20" selected="selected">20</option>
				<option value="30">30</option>
			</c:if>
			<c:if test="${rowPerPage == 30}">
				<option value="10">10</option>
				<option value="20">20</option>
				<option value="30" selected="selected">30</option>
			</c:if>
		</select>
		</form>
		<!-- 시험회차, 출제자, 출제일 -->
		<table border="1">
			<tr>
				<th>시험회차</th>
				<th>출제자</th>
				<th>testDate</th>
				<th>삭제</th>
			</tr>
			<c:forEach var="t" items="${list}">
				<tr>
					<td>
						<a href="${pageContext.request.contextPath}/teacher/questionList?testNo=${t.testNo}&testTitle=${t.testTitle}">${t.testTitle}</a>
					</td>
					<td>${t.teacherName}</td>
					<td>
						${t.testDate}
					</td>
					<td>
						<a href="${pageContext.request.contextPath}/teacher/removeTest?testNo=${t.testNo}">삭제</a>
					</td>
				</tr>
			</c:forEach>
		</table>
		<!-- 페이징 -->
		<c:if test="${currentPage > 1}">
			<a href="${pageContext.request.contextPath}/teacher/testList?currentPage=${currentPage-1}">이전</a>
		</c:if>
		${currentPage}
		<c:if test="${currentPage < lastPage}">
			<a href="${pageContext.request.contextPath}/teacher/testList?currentPage=${currentPage+1}">다음</a>
		</c:if>
		<!-- 시험회차 추가 -->
		<h3>회차추가</h3>
		<form action="${pageContext.request.contextPath}/teacher/addTest" method="post">
			<input type="hidden" name="teacherNo" value="${loginTeacher.teacherNo}">
			<table border="1">
				<tr>
					<td>
						<input type="text" name="testTitle">
					</td>
					<td>
						${today}
					</td>
					<td>
						<button type="submit">등록</button>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>