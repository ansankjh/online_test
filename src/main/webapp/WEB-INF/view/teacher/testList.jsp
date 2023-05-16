<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>testList</title>
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
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
		<script>
			$(document).ready(function() {
				// 페이지 목록 개수 선택
				$('#rowPerPage').change(function() {
					$('#pageForm').submit();
					alert('change');
				});
				
				// 시험지 추가 빈칸 체크
				$('#exAddBtn').click(function() {
					if($('#ex').val() == '') {
						alert('시험제목을 입력해주세요.');
					} else {
						$('#exAddForm').submit();
					}
				});
				
			});
		</script>
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
						<h1>시험지</h1>
						${msg}
						<form action="${pageContext.request.contextPath}/teacher/testList" method="get" id="pageForm">
						<!-- 시험제목 검색 -->
						<label for="searchWord">
							<input type="text" name="searchWord" value="${searchWord}" placeholder="제목으로 검색해주세요.">
							<button type="submit">검색</button>
						</label>
						<!-- rowPerPage -->
						<select name="rowPerPage" id="rowPerPage">
							<c:if test="${rowPerPage == 10}">
								<option value="10" selected="selected">10</option>
								<option value="20">20</option>
								<option value="30">30</option>
							</c:if>
							<c:if test="${rowPerPage == 20}">
								<option value="10">10</option>
								<option value="20" selected="selected">20</option>
								<option value="30">30</option>
							</c:if>
							<c:if test="${rowPerPage == 30}">
								<option value="10">10</option>
								<option value="20">20</option>
								<option value="30" selected="selected">30</option>
							</c:if>
						</select>
						</form>
						<!-- 시험회차, 출제자, 출제일 -->
						<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
							<tr>
								<th>시험회차</th>
								<th>출제자</th>
								<th>등록일</th>
							</tr>
							<c:forEach var="t" items="${list}">
								<tr>
									<td>
										<a href="${pageContext.request.contextPath}/teacher/questionList?testNo=${t.testNo}&testTitle=${t.testTitle}">${t.testTitle}</a>
									</td>
									<td>${t.teacherName}</td>
									<td>
										${t.testDate}
									</td>
								</tr>
							</c:forEach>
						</table>
						<!-- 페이징 -->
						<c:if test="${currentPage > 1}">
							<a href="${pageContext.request.contextPath}/teacher/testList?currentPage=${currentPage-1}">이전</a>
						</c:if>
						<div align="center">${currentPage}</div>
						<c:if test="${currentPage < lastPage}">
							<a href="${pageContext.request.contextPath}/teacher/testList?currentPage=${currentPage+1}">다음</a>
						</c:if>
						<div>
							<!-- 시험 추가 -->
							<h3>시험지 등록</h3>
							<form action="${pageContext.request.contextPath}/teacher/addTest" method="post" id="exAddForm">
								<input type="hidden" name="teacherNo" value="${loginTeacher.teacherNo}">
								<table border="1">
									<tr>
										<td>
											<input type="text" name="testTitle" placeholder="제목을 입력해주세요." id="ex">
										</td>
										<td>
											${today}
										</td>
										<td>
											<button type="button" id="exAddBtn">등록</button>
										</td>
									</tr>
								</table>
							</form>
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
	
	    <!-- Page level plugins -->
		<script src="/online-test/vendor/datatables/jquery.dataTables.min.js"></script>
		<script src="/online-test/vendor/datatables/dataTables.bootstrap4.min.js"></script>
	
	    <!-- Page level custom scripts -->
	    <script src="/online-test/js/demo/datatables-demo.js"></script>
	</body>
</html>