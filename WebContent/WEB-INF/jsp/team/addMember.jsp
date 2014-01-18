<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="pl">
<head>
<jsp:include page="../default/headTag.jsp" />
<title>CRMDB - Dodaj członka zespołu</title>
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
					<h1>Dodaj członka zespołu</h1>
				</div>
				<div class="page-header" style="padding-left: 15px;"></div>
			</div>
			<div class="panel-body"
				style="border: 1px solid #428bca; border-radius: 4px; padding-right: 22px;">
				<sf:form class="form-horizontal" method="post"
					action="${pageContext.request.contextPath}/dodajCzlonkaDO"
					commandName="workerModel">


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
						<label for="telKontaktowy" class="col-sm-1 control-label"
							style="width: 15%;">Tel. kontaktowy</label>
						<div class="col-sm-4" style="width: 35%;">
							<sf:input type="text" class="form-control" path="telefon"
								name="telefon" placeholder="Telefon kontaktowy" />
							<sf:errors path="telefon" cssClass="error" />
						</div>
						<label for="email" class="col-sm-2 control-label"
							style="width: 15%;">Email</label>
						<div class="col-sm-4" style="width: 35%;">
							<sf:input type="text" class="form-control" path="email"
								name="email" placeholder="Email" />
							<sf:errors path="email" cssClass="error" />
						</div>
					</div>

					<div class="form-group">
						<label for="haslo" class="col-sm-1 control-label"
							style="width: 15%;">Hasło</label>
						<div class="col-sm-4" style="width: 35%;">
							<sf:input type="text" class="form-control" name="haslo"
								placeholder="Hasło" path="haslo" />
							<sf:errors path="haslo" cssClass="error" />
						</div>
					</div>
					<sf:input type="hidden" path="ranga" name="ranga"
						value="telemarketer" />
					<sf:input type="hidden" path="przelozonyId" name="przelozonyId"
						value="${pracownikId}" />
					<div>
						<button type="submit" class="btn btn-success">
							<i class="fa fa-floppy-o"></i> Zapisz
						</button>
						<a href="${pageContext.request.contextPath}/mojZespol">
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
