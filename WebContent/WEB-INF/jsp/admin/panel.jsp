<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="datatables"
	uri="http://github.com/dandelion/datatables"%>
<!DOCTYPE html>
<html lang="pl">
<head>
<jsp:include page="../default/headTag.jsp" />
<title>CRMDB ADMIN - Panel administracyjny</title>
</head>

<body>

	<div id="wrapper">

		<!-- SIDEBAR -->
		<nav class="navbar navbar-inverse navbar-fixed-top">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-ex1-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand"
					href="${pageContext.request.contextPath}/admin/adminPanel">CRMDB
					ADMIN</a>
			</div>

			<!-- SIDEBAR MENU -->
			<div class="collapse navbar-collapse navbar-ex1-collapse">
				<ul class="nav navbar-nav side-nav">
					<li><a
						href="${pageContext.request.contextPath}/admin/adminPanel"><i
							class="fa fa-dashboard"></i> Admin panel</a></li>
				</ul>
				<!-- / SIDEBAR MENU -->

				<!-- USER DROP DOWN -->
				<ul class="nav navbar-nav navbar-right navbar-user">
					<li class="dropdown user-dropdown"><a href="#"
						class="dropdown-toggle" data-toggle="dropdown"><i
							class="fa fa-user"></i> Administrator <b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a
								href="${pageContext.request.contextPath}/j_spring_security_logout"><i
									class="fa fa-power-off"></i> Wyloguj</a></li>
						</ul></li>
				</ul>
				<!-- / USER DROP DOWN -->
			</div>
			<!-- /.navbar-collapse -->
		</nav>

		<!-- CONTENT -->
		<!-- Nazwa strony -->
		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h1>Admin panel</h1>
				</div>
				<div class="col-lg-12">
					<div class="page-header" style="padding-left: 15px;">
						<a href="${pageContext.request.contextPath}/admin/dodajPracownika"><button
								type="button" class="btn btn-success">
								<i class="fa fa-plus"></i> Dodaj pracownika
							</button></a>
					</div>
				</div>

				<div class="table-responsive">
					<datatables:table cdn="true" id="pracownicy" data="${list}"
						cssClass="table table-hover table-striped" row="p">
						<!-- theme="jqueryui" themeOption="redmond" -->
						<datatables:column title="Id" property="id" />
						<datatables:column title="Imie" property="imie" />
						<datatables:column title="Nazwisko" property="nazwisko" />
						<datatables:column title="Email" property="email" />
						<datatables:column title="Telefon" property="telefon" />
						<datatables:column title="Ranga" property="ranga" />
						<datatables:column title="Przełożony" property="przelozonyId" />
					</datatables:table>
				</div>
			</div>
		</div>
		<!-- /#page-wrapper -->
	</div>
	<!-- /#wrapper -->

	<!-- JAVASCRIPT -->
	<jsp:include page="../default/javaScript.jsp" />
</body>
</html>
