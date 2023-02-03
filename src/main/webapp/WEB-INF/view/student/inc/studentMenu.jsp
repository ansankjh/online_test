<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div>
	<!--
		지나간 시험(table : test) 리스트+점수 - 점수확인버튼 -> 제출한 답안지 정답/오답 확인(table : paper)
		오늘날짜 시험 리스트는 응시버튼 -> 시험지 출력(table : question(문제) X(join표시) example(보기) - 답안지 제출(table : paper) 
	-->
	<a href="${pageContext.request.contextPath}/student/studentTestList">사원관리</a> 
	
	<!-- 로그아웃 -->
	<c:if test="${loginStudent != null}">
		<a href="${pageContext.request.contextPath}/student/modifyStudentPw">비밀번호수정</a>
		<a href="${pageContext.request.contextPath}/student/studentLogout">로그아웃</a>
	</c:if>
</div>