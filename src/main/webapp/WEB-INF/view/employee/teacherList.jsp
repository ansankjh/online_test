<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>teacherList</title>
	</head>
	<body>
		<c:import url="/WEB-INF/view/employee/inc/empMenu.jsp"></c:import>
		<h1>선생님 목록</h1>
		<a href="${pageContext.request.contextPath}/employee/addTeacher">선생님 등록</a>
		<table border="1">
			<tr>
				<th>선생님번호</th>
				<th>선생님아이디</th>
				<th>선생님이름</th>
				<th>삭제</th>
			</tr>
			<c:forEach var="t" items="${list}">
				<tr>
					<td>${t.teacherNo}</td>
					<td>${t.teacherId}</td>
					<td>${t.teacherName}</td>
					<td>
						<a href="${pageContext.request.contextPath}/employee/removeTeacher?teacherNo=${t.teacherNo}">선생님삭제</a>
					</td>
				</tr>
			</c:forEach>
		</table>
		<!-- 페이징 -->
		<div>
			<c:if test="${currentPage != 1}">
				<a href="${pageContext.request.contextPath}/employee/teacherList?currentPage=1">처음</a>	
			</c:if>
			<c:if test="${currentPage > 1}">
				<a href="${pageContext.request.contextPath}/employee/teacherList?currentPage=${currentPage-1}">이전</a>
			</c:if>
			${currentPage}
			<c:if test="${currentPage < lastPage}">
				<a href="${pageContext.request.contextPath}/employee/teacherList?currentPage=${currentPage+1}">다음</a>
			</c:if>
			<c:if test="${currentPage != lastPage}">
				<a href="${pageContext.request.contextPath}/employee/teacherList?currentPage=${lastPage}">마지막</a>
			</c:if>
		</div>
	</body>
</html>