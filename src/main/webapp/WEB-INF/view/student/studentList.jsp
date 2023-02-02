<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>studentList</title>
	</head>
	<body>
		<c:import url="/WEB-INF/view/student/inc/studentMenu.jsp"></c:import>
		<h1>학생목록</h1>
		<a href="${pageContext.request.contextPath}/student/addStudent">학생등록</a>
		<table border="1">
			<tr>
				<th>학생번호</th>
				<th>학생아이디</th>
				<th>학생이름</th>
				<th>삭제</th>
			</tr>
			<c:forEach var="s" items="${list}">
				<tr>
					<td>${s.studentNo}</td>
					<td>${s.studentId}</td>
					<td>${s.studentName}</td>
					<td>
						<a href="${pageContext.request.contextPath}/student/removeStudent?studentNo=${s.studentNo}">삭제</a>
					</td>
				</tr>
			</c:forEach>
		</table>
		<!-- 페이징 -->
		<div>
			<c:if test="${currentPage != 1}">
				<a href="${pageContext.request.contextPath}/student/studentList?currentPage=1">처음</a>
			</c:if>
			<c:if test="${currentPage > 1}">
				<a href="${pageContext.request.contextPath}/student/studentList?currentPage=${currentPage-1}">이전</a>
			</c:if>
			${currentPage}
			<c:if test="${currentPage < lastPage}">
				<a href="${pageContext.request.contextPath}/student/studentList?currentPage=${currentPage+1}">다음</a>
			</c:if>
			<c:if test="${currentPage != lastPage}">
				<a href="${pageContext.request.contextPath}/student/studentList?currentPage=${lastPage}">마지막</a>
			</c:if>
		</div>
	</body>
</html>