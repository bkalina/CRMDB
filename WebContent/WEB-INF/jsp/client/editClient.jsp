<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="datatables"
	uri="http://github.com/dandelion/datatables"%>
<!DOCTYPE html>
<html lang="pl">
<head>
<jsp:include page="../default/headTag.jsp" />
<title>CRMDB - Edycja klienta</title>
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
					<h1>Edycja klienta</h1>
				</div>
				<div class="page-header" style="padding-left: 15px;"></div>
			</div>
			<div class="panel-body"
				style="border: 1px solid #428bca; border-radius: 4px; padding-right: 22px;">
				<c:if test="${ranga == 'doradca'}">
					<form id="usun" action="${pageContext.request.contextPath}/usunKlientaDO"
						method="post">
						<input type="hidden" name="klientId" value="${klientId}" />
						<button type="button" onclick="confrimDelete()" class="btn btn-danger" title="Usuń"
							style="float: right; width: 21px; height: 21px; margin-top: -14px; margin-right: -21px; padding: 0px;">
							<i class="fa fa-times-circle"></i>
						</button>
					</form>
				</c:if>
				<sf:form class="form-horizontal" accept-charset="UTF-8"
					method="post"
					action="${pageContext.request.contextPath}/edytujKlientaDO"
					commandName="clientModel">

					<sf:input type="hidden" name="id" value="${klientId}" path="id" />
					<div class="form-group">
						<label for="nazwaFirmy" class="col-sm-1 control-label"
							style="width: 15%;">Nazwa firmy</label>
						<div class="col-sm-10" style="width: 85%;">
							<sf:input type="text" class="form-control" path="nazwaFirmy"
								name="nazwaFirmy" value="${client.nazwaFirmy}" />
							<sf:errors path="nazwaFirmy" cssClass="error" />
						</div>
					</div>

					<div class="form-group">
						<label for="imie" class="col-sm-1 control-label"
							style="width: 15%;">Imię</label>
						<div class="col-sm-4" style="width: 35%;">
							<sf:input type="text" class="form-control" path="imie"
								name="imie" value="${client.imie}" />
							<sf:errors path="imie" cssClass="error" />
						</div>
						<label for="nazwisko" class="col-sm-2 control-label"
							style="width: 15%;">Nazwisko</label>
						<div class="col-sm-4" style="width: 35%;">
							<sf:input type="text" class="form-control" path="nazwisko"
								name="nazwisko" value="${client.nazwisko}" />
							<sf:errors path="nazwisko" cssClass="error" />
						</div>
					</div>

					<div class="form-group">
						<label for="ulica" class="col-sm-1 control-label"
							style="width: 15%;">Ulica</label>
						<div class="col-sm-4" style="width: 35%;">
							<sf:input type="text" class="form-control" path="ulica"
								name="ulica" value="${client.ulica}" />
							<sf:errors path="ulica" cssClass="error" />
						</div>
						<label for="nrBudynku" class="col-sm-2 control-label"
							style="width: 15%;">Nr budynku</label>
						<div class="col-sm-1" style="width: 12%;">
							<sf:input type="text" class="form-control" path="nrBudynku"
								name="nrBudynku" value="${client.nrBudynku}" />
							<sf:errors path="nrBudynku" cssClass="error" />
						</div>
						<label for="nrLokalu" class="col-sm-2 control-label"
							style="width: 11%;">Nr lokalu</label>
						<div class="col-sm-1" style="width: 12%;">
							<sf:input type="text" class="form-control" path="nrLokalu"
								name="nrLokalu" value="${client.nrLokalu}" />
							<sf:errors path="nrLokalu" cssClass="error" />
						</div>
					</div>

					<div class="form-group">
						<label for="kodPocztowy" class="col-sm-1 control-label"
							style="width: 15%;">Kod pocztowy</label>
						<div class="col-sm-4" style="width: 35%;">
							<sf:input type="text" class="form-control" path="kodPocztowy"
								name="kodPocztowy" value="${client.kodPocztowy}" />
							<sf:errors path="kodPocztowy" cssClass="error" />
						</div>
						<label for="miasto" class="col-sm-2 control-label"
							style="width: 15%;">Miasto</label>
						<div class="col-sm-4" style="width: 35%;">
							<sf:input type="text" class="form-control" path="miasto"
								name="miasto" value="${client.miasto}" />
							<sf:errors path="miasto" cssClass="error" />
						</div>
					</div>

					<div class="form-group">
						<label for="nip" class="col-sm-1 control-label"
							style="width: 15%;">NIP</label>
						<div class="col-sm-4" style="width: 35%;">
							<sf:input type="hidden" name="nip" value="${client.nip}"
								path="nip" />
							<input type="text" class="form-control" value="${client.nip}"
								disabled />
							<sf:errors path="nip" cssClass="error" />
						</div>
						<label for="regon" class="col-sm-2 control-label"
							style="width: 15%;">Regon</label>
						<div class="col-sm-4" style="width: 35%;">
							<sf:input type="text" class="form-control" path="regon"
								name="regon" value="${client.regon}" />
							<sf:errors path="regon" cssClass="error" />
						</div>
					</div>

					<div class="form-group">
						<label for="telKontaktowy" class="col-sm-1 control-label"
							style="width: 15%;">Tel. kontaktowy</label>
						<div class="col-sm-4" style="width: 35%;">
							<sf:input type="text" class="form-control" path="telKontaktowy"
								name="telKontaktowy" value="${client.telKontaktowy}" />
							<sf:errors path="telKontaktowy" cssClass="error" />
						</div>
						<label for="email" class="col-sm-2 control-label"
							style="width: 15%;">Email</label>
						<div class="col-sm-4" style="width: 35%;">
							<sf:input type="text" class="form-control" path="email"
								name="email" value="${client.email}" />
							<sf:errors path="email" cssClass="error" />
						</div>
						<sf:input type="hidden" name="pracownikId"
							value="${client.pracownikId}" path="pracownikId" />
					</div>
					<div>
						<button type="submit" class="btn btn-success">
							<i class="fa fa-floppy-o"></i> Zapisz
						</button>
						<a href="${pageContext.request.contextPath}/klienci">
							<button type="button" class="btn btn-danger"
								style="float: right;">
								<i class="fa fa-times-circle"></i> Anuluj
							</button>
						</a>
					</div>
				</sf:form>
				<br>
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
					</datatables:table>
				</div>
			</div>
		</div>
		<!-- /#page-wrapper -->
	</div>
	<!-- /#wrapper -->

	<!-- JAVASCRIPT -->
	<jsp:include page="../default/javaScript.jsp" />
		<script>
	<!-- Potwierdzenie usuniecia -->
	function confrimDelete() {
	    if (confirm("Czy na pewno usunąć?") == true) {
	    	document.getElementById("usun").submit();
	    }
	}
	</script>
</body>
</html>
