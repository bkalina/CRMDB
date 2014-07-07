<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="pl">
<head>
<jsp:include page="../default/headTag.jsp" />
<title>CRMDB - Dodaj klienta</title>
</head>

<body>
	<div id="wrapper">

		<!-- SIDEBAR -->
		<jsp:include page="../default/sideBar.jsp" />

		<!-- CONTENT -->
		<!-- Nazwa strony -->
		<div id="page-wrapper">
			<div class="row">
				<div class="page-header" style="padding-left: 15px;">
					<h1>Dodaj klienta</h1>
				</div>
			</div>
			<div class="panel-body"
				style="border: 1px solid #428bca; border-radius: 4px; padding-right: 22px;">
				<sf:form class="form-horizontal" method="post" onsubmit="zapisz.disabled = true; return true;"
					action="${pageContext.request.contextPath}/dodajKlientaDO"
					commandName="clientModel">

					<div class="form-group">
						<label for="nazwaFirmy" class="col-sm-1 control-label"
							style="width: 15%;">Nazwa firmy</label>
						<div class="col-sm-10" style="width: 85%;">
							<sf:input type="text" class="form-control" path="nazwaFirmy"
								name="nazwaFirmy" placeholder="Nazwa firmy" />
							<sf:errors path="nazwaFirmy" cssClass="error" />
						</div>
					</div>

					<div class="form-group">
						<label for="imie" class="col-sm-1 control-label"
							style="width: 15%;">Imię</label>
						<div class="col-sm-4" style="width: 35%;">
							<sf:input type="text" class="form-control" path="imie"
								name="imie" placeholder="Imię" />
							<sf:errors path="imie" cssClass="error" />
						</div>
						<label for="nazwisko" class="col-sm-2 control-label"
							style="width: 15%;">Nazwisko</label>
						<div class="col-sm-4" style="width: 35%;">
							<sf:input type="text" class="form-control" path="nazwisko"
								name="nazwisko" placeholder="Nazwisko" />
							<sf:errors path="nazwisko" cssClass="error" />
						</div>
					</div>

					<div class="form-group">
						<label for="ulica" class="col-sm-1 control-label"
							style="width: 15%;">Ulica</label>
						<div class="col-sm-4" style="width: 35%;">
							<sf:input type="text" class="form-control" path="ulica"
								name="ulica" placeholder="Ulica" />
							<sf:errors path="ulica" cssClass="error" />
						</div>
						<label for="nrBudynku" class="col-sm-2 control-label"
							style="width: 15%;">Nr budynku</label>
						<div class="col-sm-1" style="width: 12%;">
							<sf:input type="text" class="form-control" path="nrBudynku"
								name="nrBudynku" placeholder="Budynek" />
							<sf:errors path="nrBudynku" cssClass="error" />
						</div>
						<label for="nrLokalu" class="col-sm-2 control-label"
							style="width: 11%;">Nr lokalu</label>
						<div class="col-sm-1" style="width: 12%;">
							<sf:input type="text" class="form-control" path="nrLokalu"
								name="nrLokalu" placeholder="Lokal" />
							<sf:errors path="nrLokalu" cssClass="error" />
						</div>
					</div>

					<div class="form-group">
						<label for="kodPocztowy" class="col-sm-1 control-label"
							style="width: 15%;">Kod pocztowy</label>
						<div class="col-sm-4" style="width: 35%;">
							<sf:input type="text" class="form-control" path="kodPocztowy"
								name="kodPocztowy" placeholder="Kod pocztowy" />
							<sf:errors path="kodPocztowy" cssClass="error" />
						</div>
						<label for="miasto" class="col-sm-2 control-label"
							style="width: 15%;">Miasto</label>
						<div class="col-sm-4" style="width: 35%;">
							<sf:input type="text" class="form-control" path="miasto"
								name="miasto" placeholder="Miasto" />
							<sf:errors path="miasto" cssClass="error" />
						</div>
					</div>

					<div class="form-group">
						<label for="nip" class="col-sm-1 control-label"
							style="width: 15%;">NIP</label>
						<div class="col-sm-4" style="width: 35%;">
							<sf:input type="text" class="form-control" path="nip" name="nip"
								placeholder="NIP" />
							<sf:errors path="nip" cssClass="error" />
						</div>
						<label for="regon" class="col-sm-2 control-label"
							style="width: 15%;">Regon</label>
						<div class="col-sm-4" style="width: 35%;">
							<sf:input type="text" class="form-control" path="regon"
								name="regon" placeholder="Regon" />
							<sf:errors path="regon" cssClass="error" />
						</div>
					</div>

					<div class="form-group">
						<label for="telKontaktowy" class="col-sm-1 control-label"
							style="width: 15%;">Tel. kontaktowy</label>
						<div class="col-sm-4" style="width: 35%;">
							<sf:input type="text" class="form-control" path="telKontaktowy"
								name="telKontaktowy" placeholder="Telefon kontaktowy" />
							<sf:errors path="telKontaktowy" cssClass="error" />
						</div>
						<label for="email" class="col-sm-2 control-label"
							style="width: 15%;">Email</label>
						<div class="col-sm-4" style="width: 35%;">
							<sf:input type="text" class="form-control" path="email"
								name="email" placeholder="Email" />
							<sf:errors path="email" cssClass="error" />
						</div>
						<sf:input type="hidden" path="pracownikId" name="pracownikId"
							value="${pracownikId}" />
					</div>
					<div>
						<button name="zapisz" type="submit" class="btn btn-success">
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


			</div>
		</div>
		<!-- /#page-wrapper -->
	</div>
	<!-- /#wrapper -->

	<!-- JAVASCRIPT -->
	<jsp:include page="../default/javaScript.jsp" />
</body>
</html>
