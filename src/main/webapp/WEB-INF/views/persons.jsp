<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<%@include file="header.jsp"%>
<body>
	<!--  wrapper -->
	<div id="wrapper">
		<%@include file="nav.jsp"%>
		
<!-- navbar side -->
<nav class="navbar-default navbar-static-side" role="navigation">
	<!-- sidebar-collapse -->
	<div class="sidebar-collapse">
		<!-- side-menu -->
		<ul class="nav" id="side-menu">
			<li>
				<!-- user image section-->
				<div class="user-section">
					<div class="user-section-inner">
						<img src="resources/assets/img/user.jpg" alt="">
					</div>
					<div class="user-info">
						<div>
							Aravind <strong>N</strong>
						</div>
						<div class="user-text-online">
							<span class="user-circle-online btn btn-success btn-circle "></span>&nbsp;Online
						</div>
					</div>
				</div> <!--end user image section-->
			</li>
			<li class="sidebar-search">
				<!-- search section-->
				<div class="input-group custom-search-form">
					<input type="text" class="form-control" placeholder="Search...">
					<span class="input-group-btn">
						<button class="btn btn-default" type="button">
							<i class="fa fa-search"></i>
						</button>
					</span>
				</div> <!--end search section-->
			</li>
			<li><a href="/"><i
					class="fa fa-dashboard fa-fw"></i>Dashboard</a></li>

			<li class="selected"><a href="/persons"><i class="fa fa-dashboard fa-fw"></i>Persons
					Details</a></li>
			<li><a href="/books"><i class="fa fa-dashboard fa-fw"></i>Books
					Details</a></li>

		</ul>
		<!-- end side-menu -->
	</div>
	<!-- end sidebar-collapse -->
</nav>

<!-- end navbar side -->

		<!--  page-wrapper -->
		<div id="page-wrapper">

			<div class="row">
				<!-- Page Header -->
				<div class="col-lg-12">
					<h1 class="page-header">Person Details</h1>
				</div>
				<!--End Page Header -->
			</div>

			<div class="row">
				<!-- Welcome -->
				<div class="col-lg-12">
				<div id="person-table"></div>
			    <div id="dialog" title="Book Details"></div>
			</div>
				<!--end  Welcome -->
			</div>
		</div>
		<!-- end page-wrapper -->
	</div>
	<!-- end wrapper -->
	<%@include file="footer.jsp"%>
</body>
</html>
