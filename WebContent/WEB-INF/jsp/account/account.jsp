<%@ page language="java" contentType="text/html; charset=ISO-8859-2"
	pageEncoding="ISO-8859-2"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="pl">
<head>
<jsp:include page="../default/headTag.jsp" />
<title>CRMDB - Moje konto</title>
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
					<h1>Moje konto</h1>
				</div>
				<div class="page-header"></div>
			</div>

			<label style="width: 100px;">Moje dane</label>
			<div class="panel-body"
				style="border: 1px solid #428bca; border-radius: 4px; padding-right: 22px;"
				id="daneForm">
				<form class="form-horizontal" accept-charset="ISO-8859-2"
					method="post"
					action="${pageContext.request.contextPath}/mojekontoEdycja">

					<input type="hidden" name="id" value="${pracownik.id}">
					<div class="form-group">
						<label for="imie" class="col-sm-1 control-label"
							style="width: 15%;">Imiê</label>
						<div class="col-sm-4" style="width: 35%;">
							<input type="text" class="form-control" name="imie"
								value="${pracownik.imie}" disabled>
						</div>
						<label for="nazwisko" class="col-sm-2 control-label"
							style="width: 15%;">Nazwisko</label>
						<div class="col-sm-4" style="width: 35%;">
							<input type="text" class="form-control" name="nazwisko"
								value="${pracownik.nazwisko}" disabled>
						</div>
					</div>

					<div class="form-group">
						<label for="telKontaktowy" class="col-sm-1 control-label"
							style="width: 15%;">Telefon</label>
						<div class="col-sm-4" style="width: 35%;">
							<input type="text" class="form-control" name="telefon"
								value="${pracownik.telefon}">
						</div>
						<input type="hidden" name="numerOld" value="${pracownik.telefon}">

						<label for="email" class="col-sm-2 control-label"
							style="width: 15%;">Email</label>
						<div class="col-sm-4" style="width: 35%;">
							<input type="text" class="form-control" name="email"
								value="${pracownik.email}">
						</div>
						<input type="hidden" name="emailOld" value="${pracownik.email}">

						<input type="hidden" name="ranga" value="${pracownik.ranga}">
						<input type="hidden" name="przelozonyId"
							value="${pracownik.przelozonyId}">
					</div>
					<div>
						<button type="submit" class="btn btn-success">
							<i class="fa fa-floppy-o"></i> Zapisz
						</button>
						<a href="${pageContext.request.contextPath}/mojekonto">
							<button type="button" class="btn btn-danger"
								style="float: right;">
								<i class="fa fa-times-circle"></i> Anuluj
							</button>
						</a>
					</div>
				</form>
			</div>

			<label style="width: 100px; margin-top: 20px;">Zmiana has³a</label>
			<div class="panel-body"
				style="border: 1px solid #428bca; border-radius: 4px; padding-right: 22px;"
				id="hasloForm">
				<form class="form-horizontal" accept-charset="ISO-8859-2"
					method="post"
					action="${pageContext.request.contextPath}/mojekontoHaslo">

					<input type="hidden" name="id" value="${pracownik.id}">
					<div class="form-group">
						<label for="haslo" class="col-sm-1 control-label"
							style="width: 15%;">Nowe haslo</label>
						<div class="col-sm-4" style="width: 35%;">
							<input type="text" class="form-control" name="haslo">
						</div>
						<label for="haslo2" class="col-sm-2 control-label"
							style="width: 15%;">Powtorz</label>
						<div class="col-sm-4" style="width: 35%;">
							<input type="text" class="form-control" name="haslo2">
						</div>
					</div>
					<div>
						<button type="submit" class="btn btn-success">
							<i class="fa fa-floppy-o"></i> Zapisz
						</button>
						<a href="${pageContext.request.contextPath}/mojekontoHaslo">
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
