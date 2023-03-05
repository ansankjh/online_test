<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		 <meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	    <meta name="description" content="">
	    <meta name="author" content="">
	
	    <title>main</title>
	
	    <!-- Custom fonts for this template-->
	    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
	    <link
	        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	        rel="stylesheet">
	
	    <!-- Custom styles for this template-->
	    <link href="css/sb-admin-2.min.css" rel="stylesheet">
	    <style>
	    	.po {
	    		position : relative;
	    		top : 100px;
	    	}
	    </style>
	</head>
	<body>
		
		<div align="center" class="po">
			<h1>online-test</h1>
			<!-- 사원로그인 -->
			<div class="col-xl-3 col-md-6 mb-4">
				<div class="card border-left-primary shadow h-100 py-2">
					<div class="card-body">
						<div class="row no-gutters align-items-center">
							<div class="col mr-2">
								<div class="h5 mb-0 font-weight-bold text-gray-800">
									<a href="${pageContext.request.contextPath}/loginEmp">사원로그인</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 강사로그인 -->
			<div class="col-xl-3 col-md-6 mb-4">
				<div class="card border-left-primary shadow h-100 py-2">
					<div class="card-body">
						<div class="row no-gutters align-items-center">
							<div class="col mr-2">
								<div class="h5 mb-0 font-weight-bold text-gray-800">
									<a href="${pageContext.request.contextPath}/loginTeacher">강사로그인</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 학생로그인 -->
			<div class="col-xl-3 col-md-6 mb-4">
				<div class="card border-left-primary shadow h-100 py-2">
					<div class="card-body">
						<div class="row no-gutters align-items-center">
							<div class="col mr-2">
								<div class="h5 mb-0 font-weight-bold text-gray-800">
									<a href="${pageContext.request.contextPath}/loginStudent">학생로그인</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>