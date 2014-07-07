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
				<div class="page-header" style="padding-left: 15px;">
					<h1>Dodaj członka zespołu</h1>
				</div>
			</div>
			<div class="panel-body"
				style="border: 1px solid #428bca; border-radius: 4px; padding-right: 22px;">
				<sf:form class="form-horizontal" method="post" onsubmit="zapisz.disabled = true; return true;"
					action="${pageContext.request.contextPath}/dodajCzlonkaDO"
					commandName="workerModel">


					<div class="form-group col-md-11">
						<label for="imie" class="col-md-1 control-label col-md-offset-2"
							>Imię</label>
						<div class="col-md-3" >
							<sf:input type="text" class="form-control" path="imie"
								name="imie" placeholder="Imię" />
							<sf:errors path="imie" cssClass="error" />
						</div>
						<label for="nazwisko" class="col-md-1 control-label"
							>Nazwisko</label>
						<div class="col-md-3" >
							<sf:input type="text" class="form-control" path="nazwisko"
								name="nazwisko" placeholder="Nazwisko" />
							<sf:errors path="nazwisko" cssClass="error" />
						</div>
					</div>

					<div class="form-group col-md-11">
						<label for="telKontaktowy" class="col-md-1 control-label col-md-offset-2"
							>Tel. kontaktowy</label>
						<div class="col-md-3" >
							<sf:input type="text" class="form-control" path="telefon"
								name="telefon" placeholder="Telefon kontaktowy" />
							<sf:errors path="telefon" cssClass="error" />
						</div>
						<label for="email" class="col-md-1 control-label"
							>Email (login)</label>
						<div class="col-md-3" >
							<sf:input type="text" class="form-control" path="email"
								name="email" placeholder="Email" />
							<sf:errors path="email" cssClass="error" />
						</div>
					</div>

					<div class="form-group col-md-11">
						<label for="haslo" class="col-md-1 control-label col-md-offset-2"
							>Hasło</label>
						<div class="col-md-3" >
							<sf:input type="text" class="form-control" name="haslo"
								placeholder="Hasło" path="haslo" />
							<sf:errors path="haslo" cssClass="error" />
						</div>
					</div>
					<sf:input type="hidden" path="ranga" name="ranga"
						value="telemarketer" />
					<sf:input type="hidden" path="przelozonyId" name="przelozonyId"
						value="${pracownikId}" />
					<div class="col-md-7 col-md-offset-2">
						<button name="zapisz" type="submit" class="btn btn-success">
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
	<script type="text/javascript">

	</script>
</body>
</html>
