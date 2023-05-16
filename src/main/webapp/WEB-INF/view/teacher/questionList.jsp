<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>questionList</title>
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
 		 
		<!-- 모달css -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
		
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
		<script>
			$(document).ready(function() {
				// 문제 추가 빈칸 체크
				$('#addBtn').click(function() {
					if($('#title').val() == '') {
						alert('시험제목을 입력해주세요.');	
					} else {
						$('#addForm').submit();
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
						<div align="center">
							<!-- 시험회차, 회차제목, 회차수정(모달), 문제번호, 문제내용 -->
							${test.testTitle }.(${test.testDate})
							
							<!-- 회차수정 -->
							<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modifyTest">시험제목 수정</button>
							<form action="${pageContext.request.contextPath}/teacher/modifyTest" method="post">
								<input type="hidden" name="testNo" value="${testNo}">
								<div class="modal" id="modifyTest">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header">
												<h4 class="modal-title">시험제목 수정</h4>
												<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
												
											</div>
											<div class="modal-body">
												시험제목 : <input type="text" name="testTitle" value="${test.testTitle}">
											</div>
											<div>
												<button type="submit">시험제목 수정</button>
											</div>
										</div>
									</div>
								</div>
							</form>
							<!-- 시험문제 유무에 따른 시험삭제 버튼 유무 -->
							<c:if test="${idx == 0}">
								<a type="button" class="btn btn-danger" id="removeBtn" 
									href="${pageContext.request.contextPath}/teacher/removeTest?testNo=${testNo}">시험지삭제</a>
							</c:if>
							<div>
								<c:if test="${questionIdx != 11}">
									<br>
									<!-- 문제등록 -->
									<form action="${pageContext.request.contextPath}/teacher/addQuestion" method="post" id="addForm">
										<input type="hidden" name="testNo" value="${testNo}">
										<div class="col-lg-6">
											<div class="p-5">
												<div class="form-group">
													 <div class="form-group row">
					                                    <div class="col-sm-6 mb-3 mb-sm-0">
					                                        <input type="number" class="form-control form-control-user"
					                                        	name="questionIdx" value="${questionIdx}" readonly="readonly">
					                                    </div>
					                                </div>
													<input type="text" class="form-control form-control-user"
													    name="questionTitle" id='title'
													    placeholder="문제 제목을 입력해주세요.">
													<br>
													<button class="btn btn-primary" type="button" id="addBtn">문제등록</button>
													<a class="btn btn-primary" href="${pageContext.request.contextPath}/teacher/testList">뒤로</a>
												</div>
											</div>
										</div>
									</form>
								</c:if>
							</div>
							<br>
							<c:forEach var="q" items="${list}">
								<div>
									${q.questionIdx}. ${q.questionTitle}									
									[배점 : 10]
									<a class="btn btn-primary" href="${pageContext.request.contextPath}/teacher/exampleList?questionNo=${q.questionNo}">문제관리</a>
									<a class="btn btn-danger" href="${pageContext.request.contextPath}/teacher/removeQuestion?questionNo=${q.questionNo}&testNo=${testNo}">문제삭제</a>
								</div>
								<br>
							</c:forEach>
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