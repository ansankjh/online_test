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
		<form action="${pageContext.request.contextPath}/employee/empList" method="get">
			<input type="text" name="searchWord" value="${searchWord}">
			<button type="submit">검색</button>
		</form>
		<!-- 페이징 -->
		<div>
			<!-- 첫페이지 -->
			<c:if test="${currentPage != 1}">
				<a href="${pageContext.request.contextPath}/employee/empList?currentPage=1&searchWord=${searchWord}&startPage=${1}&endPage=${10}">처음페이지</a>
			</c:if>
			<!-- 이전 페이지 -->
			<c:if test="${currentPage > 1 && startPage != 1}">
				<a href="${pageContext.request.contextPath}/employee/empList?currentPage=${currentPage-10}&searchWord=${searchWord}&startPage=${startPage-10}&endPage=${endPage-10}">이전</a>
			</c:if>
			<!-- 페이지숫자 -->
			<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
				<a href="${pageContext.request.contextPath}/employee/empList?currentPage=${i}&startPage=${startPage}&endPage=${endPage}">${i}</a>
			</c:forEach>
			<!-- 다음페이지, 마지막페이지 -->
			<c:if test="${currentPage+10 < lastPage}">
				<a href="${pageContext.request.contextPath}/employee/empList?currentPage=${currentPage+10}&searchWord=${searchWord}&startPage=${startPage+10}&endPage=${endPage+10}">다음</a>
				<a href="${pageContext.request.contextPath}/employee/empList?currentPage=${lastPage}&searchWord=${searchWord}&endPage=${lastPage}">마지막페이지</a>
			</c:if>
		</div>
	</body>
</html>