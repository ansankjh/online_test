<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>exampleList</title>
		
		<!-- 모달css -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
		<style>
			h4 {
				text-align : center;
			}
		</style>
	</head>
	<body>
		<div>
			<!-- 보기목록 -->
			${q.questionIdx}. ${q.questionTitle}
			<!-- 문제수정 -->
			<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modifyQuestion">문제수정</button>
			<form action="${pageContext.request.contextPath}/teacher/modifyQuestion" method="post">
				<input type="hidden" name="questionNo" value="${q.questionNo}">
				<div class="modal" id="modifyQuestion">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h4 class="modal-title">문제수정</h4>
								<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
							</div>
							<div class="modal-body">
								문제번호 : <input type="number" name="questionIdx" value="${q.questionIdx}" readonly="readonly"><br>
								문제내용 : <input type="text" name="questionTitle" value="${q.questionTitle}"><br>
							</div>
							<div>
								<button type="submit">문제수정</button>
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
		<br>
		<c:forEach var="e" items="${list}">
			<div>
				${e.exampleIdx}. ${e.exampleTitle} [${e.exampleOx}]
				<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modifyExample${e.exampleIdx}">보기수정</button>
				<a class="btn btn-primary" href="${pageContext.request.contextPath}/teacher/removeExample?exampleNo=${e.exampleNo}&questionNo=${e.questionNo}">
					보기삭제
				</a>
				<form action="${pageContext.request.contextPath}/teacher/modifyExample" method="post">
					<input type="hidden" name="questionNo" value="${e.questionNo}">
					<input type="hidden" name="exampleNo" value="${e.exampleNo}"> 
					<div class="modal" id="modifyExample${e.exampleIdx}">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h4 class="modal-title">보기수정</h4>
									<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
								</div>
								<div class="modal-body">
									보기번호 : <input type="number" name="exampleIdx" value="${e.exampleIdx}" readonly="readonly"><br>
									보기내용 : <input type="text" name="exampleTitle" value="${e.exampleTitle}"><br>
									정답체크 :
									<select name="exampleOx">
										<c:if test="${e.exampleOx eq '정답'}">
											<option value="정답" selected="selected">정답</option>
											<option value="오답">오답</option>
										</c:if>
										<c:if test="${e.exampleOx eq '오답'}">
											<option value="정답">정답</option>
											<option value="오답" selected="selected">오답</option>
										</c:if>
									</select> 
								</div>
								<div>
									<button type="submit">보기수정</button>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
			<br>
		</c:forEach>
		<br>
		<div>
			<c:if test="${idx != 5}">
				<!-- 보기등록 -->
				<form action="${pageContext.request.contextPath}/teacher/addExample" method="post">
					<input type="hidden" name="questionNo" value="${questionNo}">
					<table border="1">
						<tr>
							<td>exampleIdx</td>
							<td>
								<input type="number" name="exampleIdx" value="${idx}" readonly="readonly">
							</td>
						</tr>
						<tr>
							<td>exampleTitle</td>
							<td>
								<input type="text" name="exampleTitle">
							</td>
						</tr>
						<tr>
							<td>exampleOx</td>
							<td>
								<select name="exampleOx">
									<option value="정답">정답</option>
									<option value="오답">오답</option>
								</select>
							</td>
						</tr>
					</table>
					<div>
						<button type="submit">보기등록</button>
					</div>
				</form>
			</c:if>
		</div>
	</body>
</html>