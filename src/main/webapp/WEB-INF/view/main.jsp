<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>main</title>
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
	    <link href="css/sb-admin-2.min.css" rel="stylesheet">
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
					
						<!-- Page Heading -->
						<div class="d-sm-flex align-items-center justify-content-between mb-4">
							<h1 class="h3 mb-0 text-gray-800">online-test</h1>
						</div>
						
						<!-- 등록된 강사, 등록된 학생, 등록된 시험 -->
						<div class="row">
						    <!-- Earnings (Monthly) Card Example -->
							<div class="col-xl-3 col-md-6 mb-4">
							    <div class="card border-left-primary shadow h-100 py-2">
							        <div class="card-body">
							            <div class="row no-gutters align-items-center">
							                <div class="col mr-2">
							                    <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
							                        강사</div>
							                    <div class="h5 mb-0 font-weight-bold text-gray-800">
							                    	${teacherCount}
							                    </div>
							                </div>
							            </div>
							        </div>
							    </div>
							</div>
							
							<!-- Earnings (Monthly) Card Example -->
							<div class="col-xl-3 col-md-6 mb-4">
							    <div class="card border-left-success shadow h-100 py-2">
							        <div class="card-body">
							            <div class="row no-gutters align-items-center">
							                <div class="col mr-2">
							                    <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
							                        학생</div>
							                    <div class="h5 mb-0 font-weight-bold text-gray-800">
							                    	${studentCount}
							                    </div>
							                </div>
							            </div>
							        </div>
							    </div>
							</div>
							
							<!-- Earnings (Monthly) Card Example -->
							<div class="col-xl-3 col-md-6 mb-4">
							    <div class="card border-left-info shadow h-100 py-2">
							        <div class="card-body">
							            <div class="row no-gutters align-items-center">
							                <div class="col mr-2">
							                    <div class="text-xs font-weight-bold text-info text-uppercase mb-1">등록된 시험
							                    </div>
							                    <div class="row no-gutters align-items-center">
							                        <div class="col-auto">
							                            <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">
							                            	${testCount}
							                            </div>
							                        </div>
							                    </div>
							                </div>
							            </div>
							        </div>
							    </div>
							</div>
						</div>
						<!-- 등록된 강사, 등록된 학생, 등록된 시험 끝 -->
						
						<div class="row">
							
							<div class="col-lg-6">
								<div class="card mb-4 py-3 border-left-primary">
									<div class="card-body">
									    <c:forEach var="t" items="${testList}">
									    	${t.testTitle}<br> 
									    	출제일 : ${t.testDate}<br>
									    	출제자 : ${t.teacherName}<br>
									    	<hr>
									    </c:forEach>
									</div>
								</div>
							</div>
						</div>
						
					</div>
					<!-- /.container-fluid -->
				
				</div>
				<!-- End of Main Content -->
			
				<!-- Footer -->
				<footer class="sticky-footer bg-white">
				    <div class="container my-auto">
				        <div class="copyright text-center my-auto">
				            <span>Copyright &copy; 2023 online-test</span>
				        </div>
				    </div>
				</footer>
				<!-- End of Footer -->
			
			</div>
			<!-- End of Content Wrapper -->
		
		</div>
		<!-- End of Page Wrapper -->
		
		
		<!-- Bootstrap core JavaScript-->
	    <script src="vendor/jquery/jquery.min.js"></script>
	    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	
	    <!-- Core plugin JavaScript-->
	    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>
	
	    <!-- Custom scripts for all pages-->
	    <script src="js/sb-admin-2.min.js"></script>
	
	    <!-- Page level plugins -->
	    <script src="vendor/chart.js/Chart.min.js"></script>
	
	    <!-- Page level custom scripts -->
	    <script src="js/demo/chart-area-demo.js"></script>
	    <script src="js/demo/chart-pie-demo.js"></script>
	</body>
</html>