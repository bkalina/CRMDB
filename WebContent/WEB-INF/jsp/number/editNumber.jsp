<%@ page language="java" contentType="text/html; charset=ISO-8859-2"
	pageEncoding="ISO-8859-2"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
				<form action="${pageContext.request.contextPath}/usunKlientaDO"
					method="post">
					<input type="hidden" name="klientId" value="${klientId}">
					<button type="submit" class="btn btn-danger"
						style="float: right; width: 21px; height: 21px; margin-top: -14px; margin-right: -21px; padding: 0px;">
						<i class="fa fa-times-circle"></i>
					</button>
				</form>
				<form class="form-horizontal" accept-charset="ISO-8859-2"
					method="post"
					action="${pageContext.request.contextPath}/edytujKlientaDO">

					<input type="hidden" name="id" value="${klientId}">
					<div class="form-group">
						<label for="nazwaFirmy" class="col-sm-1 control-label"
							style="width: 15%;">Nazwa firmy</label>
						<div class="col-sm-10" style="width: 85%;">
							<input type="text" class="form-control" name="nazwaFirmy"
								value="${client.nazwaFirmy}">
						</div>
					</div>

					<div class="form-group">
						<label for="imie" class="col-sm-1 control-label"
							style="width: 15%;">Imiê</label>
						<div class="col-sm-4" style="width: 35%;">
							<input type="text" class="form-control" name="imie"
								value="${client.imie}">
						</div>
						<label for="nazwisko" class="col-sm-2 control-label"
							style="width: 15%;">Nazwisko</label>
						<div class="col-sm-4" style="width: 35%;">
							<input type="text" class="form-control" name="nazwisko"
								value="${client.nazwisko}">
						</div>
					</div>

					<div class="form-group">
						<label for="ulica" class="col-sm-1 control-label"
							style="width: 15%;">Ulica</label>
						<div class="col-sm-4" style="width: 35%;">
							<input type="text" class="form-control" name="ulica"
								value="${client.ulica}">
						</div>
						<label for="nrBudynku" class="col-sm-2 control-label"
							style="width: 15%;">Nr budynku</label>
						<div class="col-sm-1" style="width: 12%;">
							<input type="text" class="form-control" name="nrBudynku"
								value="${client.nrBudynku}">
						</div>
						<label for="nrLokalu" class="col-sm-2 control-label"
							style="width: 11%;">Nr lokalu</label>
						<div class="col-sm-1" style="width: 12%;">
							<input type="text" class="form-control" name="nrLokalu"
								value="${client.nrLokalu}">
						</div>
					</div>

					<div class="form-group">
						<label for="kodPocztowy" class="col-sm-1 control-label"
							style="width: 15%;">Kod pocztowy</label>
						<div class="col-sm-4" style="width: 35%;">
							<input type="text" class="form-control" name="kodPocztowy"
								value="${client.kodPocztowy}">
						</div>
						<label for="miasto" class="col-sm-2 control-label"
							style="width: 15%;">Miasto</label>
						<div class="col-sm-4" style="width: 35%;">
							<input type="text" class="form-control" name="miasto"
								value="${client.miasto}">
						</div>
					</div>

					<div class="form-group">
						<label for="nip" class="col-sm-1 control-label"
							style="width: 15%;">NIP</label>
						<div class="col-sm-4" style="width: 35%;">
							<input type="hidden" name="nip" value="${client.nip}"> <input
								type="text" class="form-control" value="${client.nip}" disabled>
						</div>
						<label for="regon" class="col-sm-2 control-label"
							style="width: 15%;">Regon</label>
						<div class="col-sm-4" style="width: 35%;">
							<input type="text" class="form-control" name="regon"
								value="${client.regon}">
						</div>
					</div>

					<div class="form-group">
						<label for="telKontaktowy" class="col-sm-1 control-label"
							style="width: 15%;">Tel. kontaktowy</label>
						<div class="col-sm-4" style="width: 35%;">
							<input type="text" class="form-control" name="telKontaktowy"
								value="${client.telKontaktowy}">
						</div>
						<label for="email" class="col-sm-2 control-label"
							style="width: 15%;">Email</label>
						<div class="col-sm-4" style="width: 35%;">
							<input type="text" class="form-control" name="email"
								value="${client.email}">
						</div>
						<input type="hidden" name="pracownikId"
							value="${client.pracownikId}">
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
				</form>

			</div>
		</div>
		<!-- /#page-wrapper -->
	</div>
	<!-- /#wrapper -->

	<!-- JAVASCRIPT -->
	<jsp:include page="../default/javaScript.jsp" />
</body>
</html>
