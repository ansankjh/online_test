<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>exampleList</title>
		
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
		<style>
			h4 {
				text-align : center;
			}
		</style>
		
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
		<script>
			$(document).ready(function() {
				// 보기 추가 빈칸 체크
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
					<div class="container-fluid" align="center">
						<div>
							<h1>문제</h1>
							<!-- 보기목록 -->
							${q.questionIdx}. ${q.questionTitle}
							<!-- 문제수정 -->
							<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modifyQuestion">문제수정</button>
							<form action="${pageContext.request.contextPath}/teacher/modifyQuestion" method="post">
								<input type="hidden" name="questionNo" value="${q.questionNo}">
								<div class="modal" id="modifyQuestion">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header">
												<h4 class="modal-title">문제수정</h4>
												<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
											</div>
											<div class="modal-body">
												문제번호 : <input type="number" name="questionIdx" value="${q.questionIdx}" readonly="readonly"><br>
												문제내용 : <input type="text" name="questionTitle" value="${q.questionTitle}"><br>
											</div>
											<div>
												<button type="submit">문제수정</button>
											</div>
										</div>
									</div>
								</div>
							</form>
						</div>
						<br>
						<h2>보기</h2>
						<c:forEach var="e" items="${list}">
							<div>
								${e.exampleIdx}. ${e.exampleTitle} [${e.exampleOx}]
								<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modifyExample${e.exampleIdx}">보기수정</button>
								<a class="btn btn-primary" href="${pageContext.request.contextPath}/teacher/removeExample?exampleNo=${e.exampleNo}&questionNo=${e.questionNo}">
									보기삭제
								</a>
								<form action="${pageContext.request.contextPath}/teacher/modifyExample" method="post">
									<input type="hidden" name="questionNo" value="${e.questionNo}">
									<input type="hidden" name="exampleNo" value="${e.exampleNo}"> 
									<div class="modal" id="modifyExample${e.exampleIdx}">
										<div class="modal-dialog">
											<div class="modal-content">
												<div class="modal-header">
													<h4 class="modal-title">보기수정</h4>
													<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
												</div>
												<div class="modal-body">
													보기번호 : <input type="number" name="exampleIdx" value="${e.exampleIdx}" readonly="readonly"><br>
													보기내용 : <input type="text" name="exampleTitle" value="${e.exampleTitle}"><br>
													정답체크 :
													<select name="exampleOx">
														<c:if test="${e.exampleOx eq '정답'}">
															<option value="정답" selected="selected">정답</option>
															<option value="오답">오답</option>
														</c:if>
														<c:if test="${e.exampleOx eq '오답'}">
															<option value="정답">정답</option>
															<option value="오답" selected="selected">오답</option>
														</c:if>
													</select> 
												</div>
												<div>
													<button type="submit">보기수정</button>
												</div>
											</div>
										</div>
									</div>
								</form>
							</div>
							<br>
						</c:forEach>
						<!-- 보기등록 -->
						<c:if test="${idx != 5}">
							<form action="${pageContext.request.contextPath}/teacher/addExample" method="post" id="addForm">
								<input type="hidden" name="questionNo" value="${questionNo}">
								<input type="hidden" name="testNo" value="${testNo}">
								<div class="col-lg-6">
									<div class="p-5">
										<div class="form-group">
											<div class="form-group row">
					                            <div class="col-sm-6 mb-3 mb-sm-0">
					                                <input type="number" class="form-control form-control-user"
					                                	name="exampleIdx" value="${idx}" readonly="readonly">
											    </div>
											</div>
											<input type="text" class="form-control form-control-user"
											    name="exampleTitle" id='example'
											    placeholder="보기를 입력해주세요.">
											<br>
											<div class="form-group row">
												<div class="col-sm-6 mb-3 mb-sm-0">
													<select name="exampleOx" class="form-control form-control-user">
														<option value="정답">정답</option>
														<option value="오답">오답</option>
													</select>
												</div>
											</div>
											<br>
											<button class="btn btn-primary" type="button" id="addBtn">보기등록</button>
										</div>
									</div>
								</div>
							</form>
						</c:if>
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