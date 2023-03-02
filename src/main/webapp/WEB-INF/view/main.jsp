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
	</head>
	<body>
		<a href="${pageContext.request.contextPath}/loginEmp">사원</a>
		<a href="${pageContext.request.contextPath}/loginTeacher">강사</a>
		<a href="${pageContext.request.contextPath}/loginStudent">학생</a>
		<a href="${pageContext.request.contextPath}/loginEmp" class="btn btn-primary btn-icon-split" style="width:200px; height:100px;">
			사원로그인
		</a>
	</body>
</html>