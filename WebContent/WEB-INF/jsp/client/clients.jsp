<%@ page language="java" contentType="text/html; charset=ISO-8859-2"
	pageEncoding="ISO-8859-2"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="datatables"
	uri="http://github.com/dandelion/datatables"%>
<!DOCTYPE html>
<html lang="pl">
<head>
<jsp:include page="../default/headTag.jsp" />
<title>CRMDB - Klienci</title>
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
					<h1>Klienci</h1>
				</div>
				<div class="page-header" style="padding-left: 15px;">
				<c:if test="${ranga == 'doradca'}">
				<a href="${pageContext.request.contextPath}/dodajKlienta"><button type="button" class="btn btn-success"><i class="fa fa-plus"></i> Dodaj klienta</button></a>
				</c:if>
				</div>
			</div>

			<div class="table-responsive">
				<datatables:table cdn="true" id="klienci" data="${clientsList}"
					cssClass="table table-hover table-striped" row="cl"	>
					<!-- theme="jqueryui" themeOption="redmond" -->
					<datatables:column title="Nazwa klienta">
						<b><c:out value="${cl.nazwaFirmy}"></c:out></b><br>
						<font size="-2">
							<c:out value="${cl.ulica} ${cl.nrBudynku}"></c:out><c:if test="${not empty cl.nrLokalu}">/${cl.nrLokalu}</c:if><c:out value=", ${cl.kodPocztowy} ${cl.miasto}, NIP: ${cl.nip}"></c:out>
						</font>
					</datatables:column>
					<datatables:column title="Miasto" property="miasto" />
					<datatables:column title="Osoba kontaktowa">
						<b><c:out value="${cl.imie} ${cl.nazwisko}"></c:out></b><br>
						<font size="-2"><c:out value="Tel. ${cl.telKontaktowy}"></c:out></font>
					</datatables:column>
					<datatables:column style="text-align:center" title=" " sortable="false">
						<form method="post" action="${pageContext.request.contextPath}/edytujKlienta">
							<input type="hidden" name="klientId" value="${cl.id}">
							<button type="submit" class="btn btn-link"  style="width:30px; height:28px; padding:0px;"><i class="fa fa-pencil-square-o fa-2x"></i></button>
						</form>
					</datatables:column>

				</datatables:table>
			</div>

		</div>
		<!-- /#page-wrapper -->
	</div>
	<!-- /#wrapper -->

	<!-- JAVASCRIPT -->
	<jsp:include page="../default/javaScript.jsp" />

</body>
</html>
