<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div>
	<!-- 사원리스트 -->
	<a href="${pageContext.request.contextPath}/employee/empList">사원관리</a> 
	<!-- 등록시 ID체크(employee + student + teacher) -->
	<!-- 강사리스트 강사 등록,삭제 -->
	<a href="${pageContext.request.contextPath}/teacher/teacherList">강사관리</a>
	<!-- 강사목록, 강사삭제 -->
	
	<!-- 학생리스트 학생 등록,삭제 학생은 시험만 칠수 있고 시험성적 확인x --> 
	<a href="${pageContext.request.contextPath}/student/studentList">학생관리</a> 
	<!-- 학생목록, 학생삭제 -->
	
	<!-- 로그아웃 -->
	<c:if test="${loginEmp != null}">
		<a href="${pageContext.request.contextPath}/employee/logout">로그아웃</a>
		<a href="${pageContext.request.contextPath}/employee/modifyEmpPw">비밀번호수정</a>
	</c:if>
	<c:if test="${loginEmp == null}">
		<a href="${pageContext.request.contextPath}/employee/loginEmp">로그인</a>
	</c:if>
	
</div>