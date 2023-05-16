<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>modifyStudentPw</title>
		
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	    <meta name="description" content="">
	    <meta name="author" content="">
	
	    <!-- Custom fonts for this template-->
	    <link href="/online-test/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
	    <link
	        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	        rel="stylesheet">
	
	    <!-- Custom styles for this template-->
	    <link href="/online-test/css/sb-admin-2.min.css" rel="stylesheet">
	    
	    <!-- Custom styles for this page -->
		<link href="/online-test/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
		
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
		<script>
			$(document).ready(function() {
				$('#modifyBtn').click(function() {
					// 기존 비밀번호 빈칸 체크
					if($('#oldPw').val() == '') {
						alert('기존 비밀번호를 입력해주세요.');
						$('#oldPw').focus();
					// 기존 비밀번호 입력되어있고 변경할 비밀번호가 미입력일때
					} else if($('#oldPw').val != '' && $('#newPw').val() == '') {
						alert('변경할 비밀번호를 입력해주세요.');
						$('#newPw').focus();
					} else {
						$('#modifyForm').submit();
					}
					
				});
			});
		</script>
	</head>
	<body class="bg-gradient-primary">
		<div class="container">
			<!-- Outer Row -->
			<div class="row justify-content-center">
				<div class="col-xl-10 col-lg-12 col-md-9">
					<div class="card o-hidden border-0 shadow-lg my-5">
						<div class="card-body p-0">
						    <!-- Nested Row within Card Body -->
							<div class="row">
								<div class="col-lg-6 d-none d-lg-block bg-password-image"></div>
								<div class="col-lg-6">
								    <div class="p-5">
										<div class="text-center">
										    <h1 class="h4 text-gray-900 mb-2">${loginStudent.studentName} 비밀번호 수정</h1>
										</div>
										<div>${msg}</div>
										<form class="user" action="${pageContext.request.contextPath}/student/modifyStudentPw" method="post" id="modifyForm">
											<!-- 아이디 -->
											<div class="form-group">
												<input type="text" class="form-control form-control-user" name="studentId"
													 readonly="readonly" value="${loginStudent.studentId}">
											</div>
											<!-- 기존 비밀번호 -->
											<div class="form-group">
												<input type="password" class="form-control form-control-user" name="oldPw" id="oldPw"
														placeholder="기존 비밀번호를 입력해주세요.">
											</div>
											<!-- 변경할 비밀번호 -->
											<div class="form-group">
												<input type="password" class="form-control form-control-user" name="newPw" id="newPw"
														placeholder="변경할 비밀번호를 입력해주세요.">
											</div>
											<!-- 사원등록버튼 -->
											<button class="btn-primary btn-user btn-block" type="button" id="modifyBtn">비밀번호 수정</button>
											<a href="${pageContext.request.contextPath}/student/home" class="btn btn-primary btn-user btn-block">
											    뒤로
											</a>
										</form>
								    </div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<script>
		    // 새로고침시 get 파라미터 제거
			$(document).keydown(function(e){
				key = (e)?e.keyCode:event.keyCode;
				//alert(key);
				if(key == 116 || (event.ctrlKey && event.keyCode == 82)) {
					history.replaceState({}, null, location.pathname);
				}
			})
		</script>
	</body>
</html>