<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>empList</title>
	</head>
	<body>
		<!-- empMenu include -->
		<div>
			<c:import url="/WEB-INF/view/employee/inc/empMenu.jsp"></c:import>
		</div>
		<h1>사원목록</h1>
		<a href="${pageContext.request.contextPath}/employee/addEmp">사원등록</a>
		<table border="1">
			<tr>
				<th>사원번호</th>
				<th>사원아이디</th>
				<th>사원이름</th>
				<th>삭제</th>
			</tr>
			<c:forEach var="e" items="${list}">
				<tr>
					<td>${e.empNo}</td>
					<td>${e.empId}</td>
					<td>${e.empName}</td>
					<td>
						<a href="${pageContext.request.contextPath}/employee/removeEmp?empNo=${e.empNo}">
							삭제
						</a>
					</td>
				</tr>
			</c:forEach>
		</table>
		<!-- 페이징 -->
		<div>
			<c:if test="${currentPage != 1}">
				<a href="${pageContext.request.contextPath}/employee/empList?currentPage=1">처음페이지</a>
			</c:if>
			<c:if test="${currentPage > 1}">
				<a href="${pageContext.request.contextPath}/employee/empList?currentPage=${currentPage-1}">이전</a>
			</c:if>
			${currentPage}
			<c:if test="${currentPage < lastPage}">
				<a href="${pageContext.request.contextPath}/employee/empList?currentPage=${currentPage+1}">다음</a>
			</c:if>
			<c:if test="${currentPage != lastPage}">
				<a href="${pageContext.request.contextPath}/employee/empList?currentPage=${lastPage}">마지막페이지</a>
			</c:if>
			
		</div>
	</body>
</html>