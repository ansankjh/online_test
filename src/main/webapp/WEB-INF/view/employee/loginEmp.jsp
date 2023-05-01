<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
	    <title>loginEmp</title>
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	    <meta name="description" content="">
	    <meta name="author" content="">
	    <!-- Custom fonts for this template-->
	    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
	    <link
	        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	        rel="stylesheet">
	    <!-- Custom styles for this template-->
	    <link href="css/sb-admin-2.css" rel="stylesheet">
	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
	    <script>
	    	$(document).ready(function() {
	    		$('#login').click(function() {
	    			// 아이디 공백체크
		    		if($('#empId').val() == '') {
		    			$('#empIdMsg').text('아이디를 입력해주세요.');
		    			$('#empId').focus();
		    		// 비밀번호 공백 체크
		    		} else if($('#empId').val() != '' && $('#empPw').val() == '') {
		    			$('#empPwMsg').text('비밀번호를 입력해주세요.');
						$('#empPw').focus();
		    		} else if($('#empId').val() != '' && $('#empPw').val() != '') {
		    			$('#loginForm').submit();
		    		}
	    		})
	    	})
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
	                        	<div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
	                            <div class="col-lg-6">
	                                <div class="p-5">
	                                    <div class="text-center">
	                                        <h1 class="h4 text-gray-900 mb-4">사원로그인</h1>
	                                    </div>
	                                    ${msg}
	                                    <form action="${pageContext.request.contextPath}/loginEmp" method="post" id="loginForm">
	                                        <div class="form-group">
	                                            <input type="text" name="empId" value="employee" class="form-control form-control-user"
	                                                id="empId" aria-describedby="emailHelp">
												<span id="empIdMsg"></span>
	                                        </div>
	                                        <div class="form-group">
	                                            <input type="password" name="empPw" value="123" class="form-control form-control-user"
	                                                id="empPw">
												<span id="empPwMsg"></span>
	                                        </div>
	                                        <div>
												<button type="button" class="btn btn-primary btn-user btn-block" id="login">로그인</button>
												<a href="${pageContext.request.contextPath}/index" class="btn btn-primary btn-user btn-block">
													뒤로
												</a>
											</div>
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
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin-2.min.js"></script>
	</body>
</html>