<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>addEmp</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
		<script>
			$(document).ready(function() {
				$('#ckBtn').click(function(){
					$.ajax({
						url:'${pageContext.request.contextPath}/employeeIdck'
						, type:'get'
						, data : {empId:$('#id').val()}
						, success:function(model){ // model : 'YES' / 'NO'
							if(model=='YES') {
								// 사용가능한 아이디
								$('#empId').val($('#id').val());
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
					if($('#empPw').val() == '') {
						alert('비밀번호를 입력해주세요.');
						$('#empPw').focus();
					} else if($('#empName').val() == '') {
						alert('이름을 입력해주세요.');
						$('#empName').focus();
					} else {
						$('#addForm').submit();
					}
				});
			});
	</script>
	</head>
	<body>
		<h1>사원등록</h1>
		<div>${errorMsg}</div>
		<div>
			<input type="text" id="id">
			<button type="button" id="ckBtn">중복검사</button>
		</div>
		<form action="${pageContext.request.contextPath}/employee/addEmp" method="post" id="addForm">
			<table border="1">
				<tr>
					<td>사원아이디</td>
					<td>
						<input type="text" name="empId" id="empId" readonly="readonly">
					</td>
				</tr>
				<tr>
					<td>사원비밀번호</td>
					<td>
						<input type="password" name="empPw" id="empPw">
					</td>
				</tr>
				<tr>
					<td>사원이름</td>
					<td>
						<input type="text" name="empName" id="empName">
					</td>
				</tr>
			</table>
			<div>
				<button type="button" id="addBtn">사원등록</button>
			</div>
		</form>
	</body>
</html>