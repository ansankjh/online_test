<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Sidebar -->
<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

    <!-- Sidebar - Brand -->
    <a class="sidebar-brand d-flex align-items-center justify-content-center" href="${pageContext.request.contextPath}/main">
        <div class="sidebar-brand-icon rotate-n-15">
            <i class="fas fa-laugh-wink"></i>
        </div>
        <div class="sidebar-brand-text mx-3">online-test</div>
    </a>

    <!-- Divider -->
    <hr class="sidebar-divider my-0">

    <!-- 사원 페이지 -->
    <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
            aria-expanded="true" aria-controls="collapseTwo">
            <span>사원</span>
        </a>
        <!-- 직원로그인이면 -->
        <c:if test="${loginEmp != null}">
			<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
				<div class="bg-white py-2 collapse-inner rounded">
					<a class="collapse-item" href="${pageContext.request.contextPath}/employee/empList">사원관리</a>
					<a class="collapse-item" href="${pageContext.request.contextPath}/employee/teacherList">강사관리</a>
					<a class="collapse-item" href="${pageContext.request.contextPath}/employee/studentList">학생관리</a>
				</div>
			</div>
        </c:if>
        <!--  직원로그인이 아니면 -->
        <c:if test="${loginEmp == null}">
        	<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
        		<div class="bg-white py-2 collapse-inner rounded">
	        		<a class="collapse-item" href="${pageContext.request.contextPath}/loginEmp">직원 외 접근불가</a>
	        	</div>
        	</div>
        </c:if>
       
    </li>
   
   	<!-- 강사 페이지 -->
   	<!-- 강사 -->
   	<c:if test="${loginTeacher != null}">
   		<li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities"
            aria-expanded="true" aria-controls="collapseUtilities">
            <span>강사</span>
        </a>
        <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities"
            data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
                <a class="collapse-item" href="${pageContext.request.contextPath}/teacher/testList">시험관리</a>
            </div>
        </div>	
    </li>
   	</c:if>
   	<!-- 강사가 아니면 -->
   	<c:if test="${loginTeacher == null}">
   		<li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities"
            aria-expanded="true" aria-controls="collapseUtilities">
            <span>강사</span>
        </a>
        <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities"
            data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
                <a class="collapse-item" href="${pageContext.request.contextPath}/loginTeacher">강사로 로그인해주세요.</a>
            </div>
        </div>	
   	</c:if>
    
    
    <!-- 학생 페이지 -->
    <!-- 학생만 접근가능 -->
    <c:if test="${loginStudent != null}">
    	<li class="nav-item">
			<a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages"
				aria-expanded="true" aria-controls="collapsePages">
				<span>학생</span>
			</a>
			<!-- 학생 로그인이면 -->
			<c:if test="${loginStudent != null}"></c:if>
			<!-- 학생 로그인이 아니면 -->
			<c:if test="${loginStudent == null}"></c:if>
			<div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
				<div class="bg-white py-2 collapse-inner rounded">
					<a class="collapse-item" href="${pageContext.request.contextPath}/student/home">시험목록</a>
					<a class="collapse-item" href="register.html">성적확인</a>
				</div>
			</div>
		</li>
    </c:if>
    
	<!-- 학생이 아니면 -->
    <c:if test="${loginStudent == null}">
	    <li class="nav-item">
			<a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages"
				aria-expanded="true" aria-controls="collapsePages">
				<span>학생</span>
			</a>
			<!-- 학생 로그인이면 -->
			<c:if test="${loginStudent != null}"></c:if>
			<!-- 학생 로그인이 아니면 -->
			<c:if test="${loginStudent == null}"></c:if>
			<div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
				<div class="bg-white py-2 collapse-inner rounded">
					<a class="collapse-item" href="${pageContext.request.contextPath}/loginStudent">학생으로 로그인해주세요.</a>
				</div>
			</div>
		</li>
    </c:if>
	

    <!-- Sidebar Toggler (Sidebar) -->
    <div class="text-center d-none d-md-inline">
        <button class="rounded-circle border-0" id="sidebarToggle"></button>
    </div>


</ul>
<!-- End of Sidebar -->