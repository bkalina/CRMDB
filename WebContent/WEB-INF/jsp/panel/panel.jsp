<%@ page language="java" contentType="text/html; charset=ISO-8859-2"
	pageEncoding="ISO-8859-2"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="pl">
<head>
<jsp:include page="../default/headTag.jsp" />
<title>CRMDB - Panel g³ówny</title>
</head>

<body>

	<div id="wrapper">

		<!-- SIDEBAR -->
		<jsp:include page="../default/sideBar.jsp" />

		<!-- CONTENT -->
		<!-- Nazwa strony -->
		<div id="page-wrapper" >
			<div class="row">
				<div class="col-lg-12">
					<h1>Panel g³ówny</h1>
				</div>
				<div class="col-lg-12">
					<div class="page-header"></div>
				</div>
			</div>

			<!-- Statystyki -->
			<div class="row">
				<div class="col-lg-3">
					<div class="panel panel-info">
						<div class="panel-heading">
							<div class="row">
								<div class="col-xs-6">
									<i class="fa fa-comments fa-5x"></i>
								</div>
								<div class="col-xs-6 text-right">
									<p class="announcement-heading">456</p>
									<p class="announcement-text">Numerów w bazie!</p>
								</div>
							</div>
						</div>
						<a href="${pageContext.request.contextPath}/telefony">
							<div class="panel-footer announcement-bottom">
								<div class="row">
									<div class="col-xs-6">Przejd¼ do numerów</div>
									<div class="col-xs-6 text-right">
										<i class="fa fa-arrow-circle-right"></i>
									</div>
								</div>
							</div>
						</a>
					</div>
				</div>

				<div class="col-lg-3">
					<div class="panel panel-info">
						<div class="panel-heading">
							<div class="row">
								<div class="col-xs-6">
									<i class="fa fa-comments fa-5x"></i>
								</div>
								<div class="col-xs-6 text-right">
									<p class="announcement-heading">320</p>
									<p class="announcement-text">Klientów w bazie!</p>
								</div>
							</div>
						</div>
						<a href="${pageContext.request.contextPath}/klienci">
							<div class="panel-footer announcement-bottom">
								<div class="row">
									<div class="col-xs-6">Przejd¼ do klientów</div>
									<div class="col-xs-6 text-right">
										<i class="fa fa-arrow-circle-right"></i>
									</div>
								</div>
							</div>
						</a>
					</div>
				</div>

				<div class="col-lg-3">
					<div class="panel panel-danger">
						<div class="panel-heading">
							<div class="row">
								<div class="col-xs-6">
									<i class="fa fa-tasks fa-5x"></i>
								</div>
								<div class="col-xs-6 text-right">
									<p class="announcement-heading">18</p>
									<p class="announcement-text">Aneksów do podpisania!</p>
								</div>
							</div>
						</div>
						<a href="${pageContext.request.contextPath}/telefony">
							<div class="panel-footer announcement-bottom">
								<div class="row">
									<div class="col-xs-6">Przejdz do numerów</div>
									<div class="col-xs-6 text-right">
										<i class="fa fa-arrow-circle-right"></i>
									</div>
								</div>
							</div>
						</a>
					</div>
				</div>

				<div class="col-lg-3">
					<div class="panel panel-success">
						<div class="panel-heading">
							<div class="row">
								<div class="col-xs-6">
									<i class="fa fa-comments fa-5x"></i>
								</div>
								<div class="col-xs-6 text-right">
									<p class="announcement-heading">56</p>
									<p class="announcement-text">Wydarzeñ w terminarzu!</p>
								</div>
							</div>
						</div>
						<a href="${pageContext.request.contextPath}/terminarz">
							<div class="panel-footer announcement-bottom">
								<div class="row">
									<div class="col-xs-6">Przejdz do terminarza</div>
									<div class="col-xs-6 text-right">
										<i class="fa fa-arrow-circle-right"></i>
									</div>
								</div>
							</div>
						</a>
					</div>
				</div>
			</div>
			<!-- /.row -->

			<!-- Terminarz podstawowy -->
			<div class="col-lg-4" style="width: 100%; margin: 0px; padding: 0px;">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h3 class="panel-title">
							<i class="fa fa-clock-o"></i> Najbli¿sze wydarzenia
						</h3>
					</div>

					<div class="panel-body">
						<div class="list-group">
							<a href="#" class="list-group-item"> <span class="badge">just
									now</span> <i class="fa fa-calendar"></i> Calendar updated
							</a> <a href="#" class="list-group-item"> <span class="badge">4
									minutes ago</span> <i class="fa fa-comment"></i> Commented on a post
							</a> <a href="#" class="list-group-item"> <span class="badge">23
									minutes ago</span> <i class="fa fa-truck"></i> Order 392 shipped
							</a> <a href="#" class="list-group-item"> <span class="badge">46
									minutes ago</span> <i class="fa fa-money"></i> Invoice 653 has been
								paid
							</a> <a href="#" class="list-group-item"> <span class="badge">1
									hour ago</span> <i class="fa fa-user"></i> A new user has been added
							</a> <a href="#" class="list-group-item"> <span class="badge">2
									hours ago</span> <i class="fa fa-check"></i> Completed task: "pick up
								dry cleaning"
							</a> <a href="#" class="list-group-item"> <span class="badge">yesterday</span>
								<i class="fa fa-globe"></i> Saved the world
							</a> <a href="#" class="list-group-item"> <span class="badge">two
									days ago</span> <i class="fa fa-check"></i> Completed task: "fix error
								on sales page"
							</a> <a href="#" class="list-group-item"> <span class="badge">two
									days ago</span> <i class="fa fa-check"></i> Completed task: "fix error
								on sales page"
							</a> <a href="#" class="list-group-item"> <span class="badge">two
									days ago</span> <i class="fa fa-check"></i> Completed task: "fix error
								on sales page"
							</a>
						</div>
						<div class="text-right">
							<a href="${pageContext.request.contextPath}/terminarz">Przejd¼
								do terminarza <i class="fa fa-arrow-circle-right"></i>
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- /.row -->
	</div>
	<!-- /#page-wrapper -->
	</div>
	<!-- /#wrapper -->

	<!-- JAVASCRIPT -->
	<jsp:include page="../default/javaScript.jsp" />

</body>
</html>
