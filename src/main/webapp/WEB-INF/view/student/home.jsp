<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>home</title>
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
	</head>
	<body>
		<!-- Page Wrapper -->
		<div id="wrapper">
			<!-- sidebar -->
			<c:import url="/WEB-INF/view/inc/sidebar.jsp"></c:import>
			
			<!-- Content Wrapper -->
			<div id="content-wrapper" class="d-flex flex-column">
			
				<!-- Main Content -->
				<div id="content">
					<!-- header -->
					<c:import url="/WEB-INF/view/inc/header.jsp"></c:import>
				
					<!-- Begin Page Content -->
					<div class="container-fluid">
						<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
							<tr>
								<th>시험목록</th>
							</tr>
							<!-- 시험문제가 등록 완료된 시험만  -->
							<c:forEach var="t" items="${list}">
								<tr>
									<td>
										<a href="${pageContext.request.contextPath}/student/paper?testNo=${t.testNo}&testTitle=${t.testTitle}">
											${t.testTitle}
										</a>
									</td>
								</tr>
							</c:forEach>
						</table>
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
	
	    <!-- Page level plugins -->
		<script src="/online-test/vendor/datatables/jquery.dataTables.min.js"></script>
		<script src="/online-test/vendor/datatables/dataTables.bootstrap4.min.js"></script>
	
	    <!-- Page level custom scripts -->
	    <script src="/online-test/js/demo/datatables-demo.js"></script>
	</body>
</html>