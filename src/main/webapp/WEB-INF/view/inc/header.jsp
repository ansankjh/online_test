<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Topbar -->
<nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

	<!-- Sidebar Toggle (Topbar) -->
	<button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
	<i class="fa fa-bars"></i>
	</button>


	<!-- Topbar Navbar -->
	<ul class="navbar-nav ml-auto">
	
    <!-- Nav Item - Search Dropdown (Visible Only XS) -->
	<li class="nav-item dropdown no-arrow d-sm-none">
		<a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button" 
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
			<i class="fas fa-search fa-fw"></i>	
		</a>
	    <!-- Dropdown - Messages -->
	    <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in" aria-labelledby="searchDropdown">
			<form class="form-inline mr-auto w-100 navbar-search">
				<div class="input-group">
					<input type="text" class="form-control bg-light border-0 small"
					    placeholder="Search for..." aria-label="Search"
					    aria-describedby="basic-addon2">
					<div class="input-group-append">
						<button class="btn btn-primary" type="button">
							<i class="fas fa-search fa-sm"></i>
						</button>
					</div>
				</div>
			</form>
	    </div>
	</li>
	
	<!-- Nav Item - User Information -->
	<li class="nav-item dropdown no-arrow">
	    <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
	        data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	        <!-- 사원 로그인 -->
	        <c:if test="${loginEmp != null}">
	        	<span class="mr-2 d-none d-lg-inline text-gray-600 small">
	        		사원 : ${loginEmp.empName}
	        	</span>
	        </c:if>
	        <!-- 강사 로그인 -->
	        <c:if test="${loginTeacher != null}">
	        	<span class="mr-2 d-none d-lg-inline text-gray-600 small">
	        		강사 : ${loginTeacher.teacherName }
	        	</span>
	        </c:if>
	        <!-- 학생 로그인 -->
	        <c:if test="${loginStudent != null}">
	        	<span class="mr-2 d-none d-lg-inline text-gray-600 small">
	        		학생 : ${loginStudent.studentName}
        		</span>
	        </c:if>
	        
	        <img class="img-profile rounded-circle"
	            src="${pageContext.request.contextPath}/img/undraw_profile.svg">
	    </a>
	    <!-- Dropdown - User Information -->
	        <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
	            aria-labelledby="userDropdown">
	            <!-- 사원 비밀번호 변경 -->
	            <c:if test="${loginEmp != null}">
					<a class="dropdown-item" href="${pageContext.request.contextPath}/employee/modifyEmpPw">
						<i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
						사원 비밀번호 변경
					</a>
	            </c:if>
	            <!-- 강사 비밀번호 변경 -->
	            <c:if test="${loginTeacher != null}">
	            	<a class="dropdown-item" href="${pageContext.request.contextPath}/teacher/modifyTeacherPw">
						<i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
						강사 비밀번호 변경
					</a>
	            </c:if>
	            <!-- 학생 비밀번호 변경 -->
	            <c:if test="${loginStudent != null}">
	            	<a class="dropdown-item" href="${pageContext.request.contextPath}/student/modifyStudentPw">
						<i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
						학생 비밀번호 변경
					</a>
	            </c:if>
	           
	            <div class="dropdown-divider"></div>
	            <!-- 사원 로그아웃 -->
	            <c:if test="${loginEmp != null}">
		            <a class="dropdown-item" href="${pageContext.request.contextPath}/employee/logout">
		                <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
		                Emp Logout
		            </a>
	            </c:if>
	            <!-- 강사 로그아웃 -->
	            <c:if test="${loginTeacher != null}">
	            	 <a class="dropdown-item" href="${pageContext.request.contextPath}/teacher/teacherLogout">
		                <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
		                Teacher Logout
		            </a>
	            </c:if>
	            <!-- 학생 로그아웃 -->
	            <c:if test="${loginStudent != null}">
	            	<a class="dropdown-item" href="${pageContext.request.contextPath}/student/studentLogout">
		                <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
		                Student Logout
		            </a>
	            </c:if>
	        </div>
	    </li>
	
	</ul>

</nav>
<!-- End of Topbar -->