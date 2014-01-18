<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="datatables"
	uri="http://github.com/dandelion/datatables"%>
<!DOCTYPE html>
<html lang="pl">
<head>
<jsp:include page="../default/headTag.jsp" />
<title>CRMDB - Panel główny</title>
</head>

<body>

	<div id="wrapper">

		<!-- SIDEBAR -->
		<jsp:include page="../default/sideBar.jsp" />

		<!-- CONTENT -->
		<!-- Nazwa strony -->
		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h1>Panel główny</h1>
				</div>
				<div class="col-lg-12">
					<div class="page-header"></div>
				</div>
			</div>

			<!-- Statystyki -->
			<div class="row">
				<div class="col-lg-3">
					<a href="${pageContext.request.contextPath}/telefony">
						<div class="panel panel-info">
							<div class="panel-heading">
								<div class="row">
									<div class="col-xs-6">
										<i class="fa fa-phone-square fa-5x"></i>
									</div>
									<div class="col-xs-6 text-right">
										<p class="announcement-heading">${count.nrCount}</p>
										<p class="announcement-text">Numerów w bazie!</p>
									</div>
								</div>
							</div>
							<div class="panel-footer announcement-bottom">
								<div class="row">
									<div class="col-xs-6">Przejdź do numerów</div>
									<div class="col-xs-6 text-right">
										<i class="fa fa-arrow-circle-right"></i>
									</div>
								</div>
							</div>
						</div>
					</a>
				</div>

				<div class="col-lg-3">
					<a href="${pageContext.request.contextPath}/klienci">
						<div class="panel panel-warning">
							<div class="panel-heading">
								<div class="row">
									<div class="col-xs-6">
										<i class="fa fa-male fa-5x"></i>
									</div>
									<div class="col-xs-6 text-right">
										<p class="announcement-heading">${count.klientCount}</p>
										<p class="announcement-text">Klientów w bazie!</p>
									</div>
								</div>
							</div>
							<div class="panel-footer announcement-bottom">
								<div class="row">
									<div class="col-xs-6">Przejdź do klientów</div>
									<div class="col-xs-6 text-right">
										<i class="fa fa-arrow-circle-right"></i>
									</div>
								</div>
							</div>
						</div>
					</a>
				</div>

				<div class="col-lg-3">
					<a href="${pageContext.request.contextPath}/telefony">
						<div class="panel panel-danger">
							<div class="panel-heading">
								<div class="row">
									<div class="col-xs-6">
										<i class="fa fa-briefcase fa-5x"></i>
									</div>
									<div class="col-xs-6 text-right">
										<p class="announcement-heading">${count.aneksCount}</p>
										<p class="announcement-text">Aneksów do podpisania!</p>
									</div>
								</div>
							</div>
							<div class="panel-footer announcement-bottom">
								<div class="row">
									<div class="col-xs-6">Przejdz do numerów</div>
									<div class="col-xs-6 text-right">
										<i class="fa fa-arrow-circle-right"></i>
									</div>
								</div>
							</div>
						</div>
					</a>
				</div>

				<div class="col-lg-3">
					<a href="${pageContext.request.contextPath}/terminarz">
						<div class="panel panel-success">
							<div class="panel-heading">
								<div class="row">
									<div class="col-xs-6">
										<i class="fa fa-calendar fa-5x"></i>
									</div>
									<div class="col-xs-6 text-right">
										<p class="announcement-heading">${count.terminCount}</p>
										<p class="announcement-text">Wydarzeń w terminarzu!</p>
									</div>
								</div>
							</div>
							<div class="panel-footer announcement-bottom">
								<div class="row">
									<div class="col-xs-6">Przejdz do terminarza</div>
									<div class="col-xs-6 text-right">
										<i class="fa fa-arrow-circle-right"></i>
									</div>
								</div>
							</div>
						</div>
					</a>
				</div>
			</div>
			<!-- /.row -->

			<!-- Terminarz podstawowy -->
			<div class="col-lg-4" style="width: 100%; margin: 0px; padding: 0px;">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h3 class="panel-title">
							<i class="fa fa-clock-o"></i> Najbliższe wydarzenia
						</h3>
					</div>

					<div class="panel-body">
						<div class="list-group">
							<c:forEach var="s" items="${schedule}">
								<span class="list-group-item"> <span class="badge"><c:out
											value="${s.dataZdarzenia}"></c:out></span> <i class="fa fa-calendar"></i>
									<c:out value="${s.opis}"></c:out></span>
							</c:forEach>
						</div>
						<div class="text-right">
							<a href="${pageContext.request.contextPath}/terminarz">Przejdź
								do terminarza <i class="fa fa-arrow-circle-right"></i>
							</a>
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
