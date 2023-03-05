<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>addTacher</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
		<script>
			$(document).ready(function() {
				// 아이디 중복검사
				$('#ckBtn').click(function() {
					$.ajax({
						url:'${pageContext.request.contextPath}/teacherIdck'
						, type:'get'
						, data:{teacherId:$('#id').val()}
						, success:function(model) {
							if(model == 'YES') {
								// 사용가능한 아이디
								$('#teacherId').val($('#id').val())
								$('#teacherPw').focus();
							} else {
								alert($('#id').val() + '는 사용중인 아이디입니다.');
								$('#id').focus();
							}
						}
					});
				});
				
				$('#addBtn').click(function() {
					if($('#teacherPw').val() == '') {
						alert('비밀번호를 입력해주세요.');
						$('#teacherPw').focus();
					} else if($('#teacherName').val() == '') {
						alert('이름을 입력해주세요.');
						$('#teacherName').focus();
					} else {
						$('#addForm').submit();
					}
				});
			});
		</script>
	</head>
	<body>
		<!-- empMenu include -->
		<div>
			<c:import url="/WEB-INF/view/employee/inc/empMenu.jsp"></c:import>
		</div>
		<h1>선생님 등록</h1>
		<div>${msg}</div>
		<div>
			<input type="text" id="id">
			<button type="button" id="ckBtn">중복검사</button>
		</div>
		<form action="${pageContext.request.contextPath}/employee/addTeacher" method="post" id="addForm">
			<table border="1">
				<tr>
					<td>선생님 아이디</td>
					<td>
						<input type="text" name="teacherId" id="teacherId" readonly="readonly">
					</td>
				</tr>
				<tr>
					<td>선생님 비밀번호</td>
					<td>
						<input type="password" name="teacherPw" id="teacherPw">
					</td>
				</tr>
				<tr>
					<td>선생님 이름</td>
					<td>
						<input type="text" name="teacherName" id="teacherName">
					</td>
				</tr>
			</table>
			<div>
				<button type="button" id="addBtn">등록</button>
				<a href="${pageContext.request.contextPath}/employee/teacherList">등록취소</a>
			</div>
		</form>
	</body>
</html>