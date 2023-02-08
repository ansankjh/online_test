<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>addQuestion</title>
	</head>
	<body>
		<h1>문제추가</h1>
		<form action="${pageContext.request.contextPath}/teacher/addQuestion" method="post">
			<!-- question -->
			<table border="1">
				<tr>
					<td>회차번호</td>
					<td>
						<input type="text" name="testNo" value="${testNo}" readonly="readonly">
					</td>
				</tr>
				<tr>
					<td>문제번호</td>
					<td>
						<input type="text" name="questionIdx">
					</td>
				</tr>
				<tr>
					<td>문제</td>
					<td>
						<textarea cols="50" rows="10" name="questionTitle"></textarea>
					</td>
				</tr>
			</table>
			<!-- example -->
			<table border="1">
				<c:forEach var="i" begin="0" end="3" step="1">
					<tr>
						<td>보기번호</td>
						<td>
							<input type="number" name="exampleList[${i}].exampleIdx" value="${i+1}" readonly="readonly">
						</td>
					</tr>
					<tr>
						<td>보기</td>
						<td>
							<input type="text" name="exampleList[${i}].exampleTitle">
						</td>
					</tr>
					<tr>
						<td>정답체크</td>
						<td>
							<input type="checkbox" name="exampleList[${i}].examplieOx" value="정답">정답
							<input type="checkbox" name="exampleList[${i}].examplieOx" value="오답">오답
						</td>
					</tr>	
				</c:forEach>
			</table>
			<div>
				<button type="submit">등록</button>
			</div>
		</form>
	</body>
</html>