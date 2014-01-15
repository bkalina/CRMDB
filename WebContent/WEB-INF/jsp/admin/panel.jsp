<%@ page language="java" contentType="text/html; charset=ISO-8859-2"
	pageEncoding="ISO-8859-2"%>
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
		<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-ex1-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand"
					href="${pageContext.request.contextPath}/panel">CRMDB ADMIN</a>
			</div>

			<!-- SIDEBAR MENU -->
			<div class="collapse navbar-collapse navbar-ex1-collapse">
				<ul class="nav navbar-nav side-nav">
					<li><a href="${pageContext.request.contextPath}/panel"><i
							class="fa fa-dashboard"></i> Panel</a></li>
				</ul>
				<!-- / SIDEBAR MENU -->

				<!-- USER DROP DOWN -->
				<ul class="nav navbar-nav navbar-right navbar-user">
					<li class="dropdown user-dropdown"><a href="#"
						class="dropdown-toggle" data-toggle="dropdown"><i
							class="fa fa-user"></i> Administrator <b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="${pageContext.request.contextPath}/wyloguj"><i
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
					<h1>Panel g³ówny</h1>
				</div>
				<div class="col-lg-12">
					<div class="page-header" style="padding-left: 15px;">
						<a href="${pageContext.request.contextPath}/dodajKlienta"><button
								type="button" class="btn btn-success">
								<i class="fa fa-plus"></i> Dodaj pracownika
							</button></a>
					</div>
				</div>

				<div class="table-responsive">
					<datatables:table cdn="true" id="klienci" data="${clientsList}"
						cssClass="table table-hover table-striped" row="cl">
						<!-- theme="jqueryui" themeOption="redmond" -->
						<datatables:column title="Nazwa klienta">
							<b><c:out value="${cl.nazwaFirmy}"></c:out></b>
							<br>
							<font size="-2"> <c:out
									value="${cl.ulica} ${cl.nrBudynku}"></c:out> <c:if
									test="${not empty cl.nrLokalu}">/${cl.nrLokalu}</c:if> <c:out
									value=", ${cl.kodPocztowy} ${cl.miasto}, NIP: ${cl.nip}"></c:out>
							</font>
						</datatables:column>
						<datatables:column title="Miasto" property="miasto" />
						<datatables:column title="Osoba kontaktowa">
							<b><c:out value="${cl.imie} ${cl.nazwisko}"></c:out></b>
							<br>
							<font size="-2"><c:out value="Tel. ${cl.telKontaktowy}"></c:out></font>
						</datatables:column>
						<datatables:column style="text-align:center" title=" "
							sortable="false">
							<form method="post"
								action="${pageContext.request.contextPath}/edytujKlienta">
								<input type="hidden" name="klientId" value="${cl.id}">
								<button type="submit" class="btn btn-link"
									style="width: 30px; height: 28px; padding: 0px;">
									<i class="fa fa-pencil-square-o fa-2x"></i>
								</button>
							</form>
						</datatables:column>

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
