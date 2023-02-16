<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>myScore</title>
	</head>
	<body>
		<!-- 시험점수 표시 맞은개수*10 -->
		<h1>성적확인(내 점수 : ${s})</h1>
		<c:forEach var="q" items="${list}">
			<table>
				<tr>
					<td>
						${q.questionIdx}. ${q.questionTitle}
						<c:forEach var="p" items="${list3}">
							<c:if test="${q.questionNo == p.questionNo}">
								${p.answer}
								<c:forEach var="qa" items="${list4}">
									<c:if test="${q.questionNo == qa.questionNo && p.answer eq qa.exampleIdx}">
										&#11093;
									</c:if>
									<c:if test="${q.questionNo == qa.questionNo && p.answer ne qa.exampleIdx}">
										&#10060; 정답 : ${qa.exampleIdx}
									</c:if>
								</c:forEach>
							</c:if>
						</c:forEach>
					</td>
				</tr>
				<tr>
					<td>
						<c:forEach var="e" items="${list2}">
							<c:if test="${q.questionNo == e.questionNo}">
								<div>
									[${e.exampleIdx}]. ${e.exampleTitle} 
								</div>
							</c:if>
						</c:forEach>
					</td>
				</tr>
			</table>
		</c:forEach>
	</body>
</html>