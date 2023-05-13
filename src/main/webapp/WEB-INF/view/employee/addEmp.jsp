<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>addEmp</title>
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
				$('#id').blur(function(){
					if($('#id').val() == '') {
						// 아이디 공백 체크
						alert('아이디를 입력해주세요.');
					} else {
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
								}
							}
						});
					}
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
						// 사원, 강사, 학생 아이디 중복은 controller에서 체크
						$('#addForm').submit();
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
										    <h1 class="h4 text-gray-900 mb-2">직원등록</h1>
										</div>
										<div>${errorMsg}</div>
										<form class="user" action="${pageContext.request.contextPath}/employee/addEmp" method="post" id="addForm">
											<!-- 아이디 중복확인 -->
											<div class="form-group">
												<input type="text" class="form-control form-control-user" id="id"
														placeholder="아이디 중복확인">
											</div>
											<!-- 아이디 -->
											<div class="form-group">
												<input type="text" class="form-control form-control-user" name="empId" id="empId"
														placeholder="중복검사 후 아이디 자동 입력" readonly="readonly">
											</div>
											<!-- 사원 비밀번호 -->
											<div class="form-group">
												<input type="password" class="form-control form-control-user" name="empPw" id="empPw"
														placeholder="비밀번호">
											</div>
											<!--  사원이름 -->
											<div class="form-group">
												<input type="text" class="form-control form-control-user" name="empName" id="empName"
														placeholder="사원이름">
											</div>
											<!-- 사원등록버튼 -->
											<button class="btn-primary btn-user btn-block" type="button" id="addBtn">사원등록</button>
											<a href="${pageContext.request.contextPath}/employee/empList" class="btn btn-primary btn-user btn-block">
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
		
		
		<!-- Bootstrap core JavaScript-->
	    <script src="/online-test/vendor/jquery/jquery.min.js"></script>
	    <script src="/online-test/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	
	    <!-- Core plugin JavaScript-->
	    <script src="/online-test/vendor/jquery-easing/jquery.easing.min.js"></script>
	
	    <!-- Custom scripts for all pages-->
	    <script src="/online-test/js/sb-admin-2.min.js"></script>
	    
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