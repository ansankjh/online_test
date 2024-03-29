<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>loginTeacher</title>
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
	    	// 로그인 버튼 클릭시 유효성 검사
	    	$()
	    })
	    </script>
	</head>
	<body>
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
	                                        <h1 class="h4 text-gray-900 mb-4">강사로그인</h1>
	                                    </div>
	                                    <form action="${pageContext.request.contextPath}/loginTeacher" method="post">
	                                        <div class="form-group">
	                                            <input type="text" name="teacherId" value="t1" class="form-control form-control-user"
	                                                id="teacherId" aria-describedby="emailHelp">
	                                        </div>
	                                        <div class="form-group">
	                                            <input type="password" name="teacherPw" value="123" class="form-control form-control-user"
	                                                id="teacherPw">
	                                        </div>
	                                        <div>
												<button type="submit" class="btn btn-primary btn-user btn-block">로그인</button>
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