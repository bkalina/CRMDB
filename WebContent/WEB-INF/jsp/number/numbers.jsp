<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="datatables"
	uri="http://github.com/dandelion/datatables"%>
<!DOCTYPE html>
<html lang="pl">
<head>
<meta charset="utf-8">
<jsp:include page="../default/headTag.jsp" />
<title>CRMDB - Telefony</title>
<body>

	<div id="wrapper">

		<!-- SIDEBAR -->
		<jsp:include page="../default/sideBar.jsp" />

		<!-- CONTENT -->
		<!-- Nazwa strony -->
		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h1>Telefony</h1>
				</div>
				<div class="page-header" style="padding-left: 15px;">
					<a href="${pageContext.request.contextPath}/dodajNumer"><button
							type="button" class="btn btn-success">
							<i class="fa fa-plus"></i> Dodaj numer
						</button></a>
				</div>
			</div>
			<div class="table-responsive">
				<datatables:table cdn="true" id="numery" data="${numbersList}"
					cssClass="table table-hover table-striped table-responsive"
					row="nr">
					<datatables:column title="Operator" property="operator"
						sortable="true" />
					<datatables:column title="Koniec" property="koniecUmowy"
						sortInit="asc" />
					<datatables:column title="Numer telefonu" property="numer" />

					<datatables:column title="Usługa">
						<font style="font-size: small;"><c:out
								value="${nr.typUslugi}" /></font>
					</datatables:column>
					<datatables:column title="Długość" property="dlugoscUmowy" />
					<datatables:column title="Firma">
						<b><c:out value="${nr.nazwaFirmy}" /></b>
						<br>
						<font style="font-size: small;"><c:out
								value="${nr.daneKlienta}" /></font>
					</datatables:column>
					<datatables:column style="text-align:center" title=" "
						sortable="false">
						<form method="post"
							action="${pageContext.request.contextPath}/edytujNumer">
							<input type="hidden" name="numberId" value="${nr.id}">
							<button type="submit" class="btn btn-link" title="Edytuj"
								style="width: 30px; height: 28px; padding: 0px;">
								<i class="fa fa-pencil-square-o fa-2x"></i>
							</button>
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
