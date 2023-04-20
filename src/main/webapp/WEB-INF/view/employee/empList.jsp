<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>empList</title>
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
					
						<!-- Page Heading -->
						<h1>사원목록[${currentPage}]</h1>
						<a href="${pageContext.request.contextPath}/employee/addEmp">사원등록</a>
						<!-- 검색 -->
						<form action="${pageContext.request.contextPath}/employee/empList" method="get">
							<input type="text" name="searchWord" value="${searchWord}">
							<button type="submit">검색</button>
						</form>
						<!-- 사원 테이블 -->
						<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
							<tr>
								<th>사원번호</th>
								<th>사원아이디</th>
								<th>사원이름</th>
								<th>삭제</th>
							</tr>
							<c:forEach var="e" items="${list}">
								<tr>
									<td>${e.empNo}</td>
									<td>${e.empId}</td>
									<td>${e.empName}</td>
									<td>
										<a href="${pageContext.request.contextPath}/employee/removeEmp?empNo=${e.empNo}">
											삭제
										</a>
									</td>
								</tr>
							</c:forEach>
						</table>
						<!-- 페이징 -->
						<div>
							<c:if test="${currentPage != 1}">
								<a href="${pageContext.request.contextPath}/employee/empList?currentPage=1&searchWord=${searchWord}">처음</a>
							</c:if>
							<c:if test="${currentPage > 1}">
								<a href="${pageContext.request.contextPath}/employee/empList?currentPage=${currentPage-1}&searchWord=${searchWord}">이전</a>
							</c:if>
							<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
								<a href="${pageContext.request.contextPath}/employee/empList?currentPage=${i}&searchWord=${searchWord}">${i}</a>
							</c:forEach>
							<c:if test="${currentPage < lastPage}">
								<a href="${pageContext.request.contextPath}/employee/empList?currentPage=${currentPage+1}&searchWord=${searchWord}">다음</a>
							</c:if>
							<c:if test="${currentPage != lastPage}">
								<a href="${pageContext.request.contextPath}/employee/empList?currentPage=${lastPage}&searchWord=${searchWord}">마지막</a>
							</c:if>
						</div>
					
					   <!-- Content Row -->
					
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