<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>paper</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
		<script>
			$(document).ready(function() {
				$('.answer').change(function() {
					if($('.answer').val() == 1) {
						alert('1번을 고르셨습니다.');
					} else if($('.answer').val() == 2) {
						alert('2번을 고르셨습니다.');
					} else if($('.answer').val() == 3) {
						alert('3번을 고르셨습니다.');
					} else if($('.answer').val() == 4) {
						alert('4번을 고르셨습니다.');
					}
					$(this.form).submit();
				});
				
				$('#exit').click(function() {
					if($('#cnt').val() < 10) {
						alert('답안지 작성을 완료해주세요.');
						$(location).attr("href", "${pageContext.request.contextPath}/student/paper?testNo="+testNo);
					} else if ($('#cnt').val() == 10) {
						alert('수고하셨습니다!');
						$('#exitForm').submit();
					}
				});
			});
		</script>
	</head>
	<body>
		<h1>제 ${t.testNo}회 ${t.testTitle}</h1>
		<h3>응시자 ${loginStudent.studentName}님</h3>
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
							<c:forEach var="p" items="${s}">
								<c:if test="${q.questionNo eq p.questionNo}">
									${p.answer}
								</c:if>
							</c:forEach> 
							<!--  studentNo, questionNo, answer 굳이 한번에 넘겨야할 이유가 없음  -->
							<form action="${pageContext.request.contextPath}/student/addPaper" method="post" id="paperForm">
								<input type="hidden" name="studentNo" value="${loginStudent.studentNo}">
								<input type="hidden" name="questionNo" value="${q.questionNo}">
								<input type="hidden" name="testNo" value="${testNo}">
								<select name="answer" class="answer">
									<option value="0">선택</option>
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
								</select>
							</form>
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
		<!-- 고른 정답이 10개가 아니라면 시험종료불가 -->
		<form action="${pageContext.request.contextPath}/student/score" method="post" id="exitForm">
			<input type="hidden" name="testNo" value="${t.testNo}">
			<input type="hidden" name="cnt" value="${cnt}" id="cnt">
			<button type="button" id="exit">시험종료</button>
		</form>
	</body>
</html>