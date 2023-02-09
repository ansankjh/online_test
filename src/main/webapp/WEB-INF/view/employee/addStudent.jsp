<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>addStudent</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
		<script>
			$(document).ready(function() {
				$('#ckBtn').click(function(){
					$.ajax({
						url:'${pageContext.request.contextPath}/studentIdck'
						, type:'get'
						, data : {studentId:$('#id').val()}
						, success:function(model){ // model : 'YES' / 'NO'
							if(model=='YES') {
								// 사용가능한 아이디
								$('#studentId').val($('#id').val());
								$('#empPw').focus();
							} else {
								// 사용중인 아이디
								alert($('#id').val()+'는 사용중인 아이디입니다.');
								$('#id').focus();
							}
						}
					});
				});
				
				$('#addBtn').click(function() {
					// 폼 유효성 검사
					if($('#studentPw').val() == '') {
						alert('비밀번호를 입력해주세요.');
						$('#studentPw').focus();
					} else if($('#studentName').val() == '') {
						alert('이름을 입력해주세요');
						$('#studentName').focus();
					} else {
						$('#addForm').submit();
					}
				});
			});
		</script>
	</head>
	<body>
		<h1>학생등록</h1>
		<div>${msg}</div>
		<div>
			<input type="text" id="id">
			<button type="button" id="ckBtn">중복검사</button>
		</div>
		<form action="${pageContext.request.contextPath}/employee/addStudent" method="post" id="addForm">
			<table border="1">
				<tr>
					<td>학생아이디</td>
					<td>
						<input type="text" name="studentId" id="studentId" readonly="readonly">
					</td>
				</tr>
				<tr>
					<td>학생비밀번호</td>
					<td>
						<input type="password" name="studentPw" id="studentPw">
					</td>
				</tr>
				<tr>
					<td>학생이름</td>
					<td>
						<input type="text" name="studentName" id="studentName">
					</td>
				</tr>
			</table>
			<div>
				<button type="button" id="addBtn">등록</button>
			</div>
		</form>
	</body>
</html>