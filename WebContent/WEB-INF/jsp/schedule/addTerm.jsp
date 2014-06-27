<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="pl">
<head>
<jsp:include page="../default/headTag.jsp" />
<link
	href="${pageContext.request.contextPath}/static/css/datepicker.css"
	rel="stylesheet">
<link
href="${pageContext.request.contextPath}/static/css/bootstrap-timepicker.min.css"
	rel="stylesheet">
<title>CRMDB - Dodaj termin</title>
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
					<h1>Dodaj termin</h1>
				</div>
			</div>
			<div class="panel-body"
				style="border: 1px solid #428bca; border-radius: 4px; padding-right: 22px;">




				<sf:form class="form-horizontal" method="post"
					onsubmit="zapisz.disabled = true; return true;"
					action="${pageContext.request.contextPath}/dodajTerminDO"
					commandName="scheduleModel">

					<div class="form-group">

						<label for="dataZdarzenia" class="col-md-1 control-label">Data
						</label>
						<div class="col-md-2">
							<div class="input-group date">
								<sf:input type="text" class="form-control date-picker"
									path="dataZdarzenia" name="dataZdarzenia" id="dataZdarzenia"
									readonly="true" value="${data}" />
								<label for="dataZdarzenia" class="input-group-addon btn"><span
									class="fa fa-calendar"></span></label>
								<sf:errors path="dataZdarzenia" cssClass="error" />
							</div>
						</div>
						
						<label for="godzina" class="col-md-1 control-label">Godzina
						</label>
						<div class="col-md-2">
							<div class="input-group date">
								<sf:input data-format="hh:mm:ss" type="text" class="form-control timepicker"
									path="godzina" name="godzina" id="godzina"
									readonly="true" />
								<label for="godzina" class="input-group-addon btn"><span
									class="fa fa-clock-o"></span></label>
								<sf:errors path="godzina" cssClass="error" />
							</div>
						</div>

						<label for="imie" class="col-sm-1 control-label"
							style="width: 15%;">Godzina</label>
						<div class="col-sm-4" style="width: 35%;">
							<sf:input type="text" class="form-control" path="godzina"
								name="godzina" placeholder="Godzina" />
							<sf:errors path="godzina" cssClass="error" />
						</div>
					</div>

					<div class="form-group">
						<label for="nazwisko" class="col-sm-2 control-label"
							style="width: 15%;">Opis</label>
						<div class="col-sm-4" style="width: 85%;">
							<sf:input type="text" class="form-control" path="opis"
								name="opis" placeholder="Opis" />
							<sf:errors path="opis" cssClass="error" />
						</div>
					</div>

					<div class="form-group">
						<label for="ulica" class="col-sm-1 control-label"
							style="width: 15%;">Notatka</label>
						<div class="col-sm-4" style="width: 85%;">
							<sf:textarea type="text" class="form-control" path="notatka"
								name="notatka" placeholder="Notatka" />
							<sf:errors path="notatka" cssClass="error" />
						</div>

						<sf:input type="hidden" path="pracownikId" name="pracownikId"
							value="${pracownikId}" />
					</div>
					<div>
						<button name="zapisz" type="submit" class="btn btn-success">
							<i class="fa fa-floppy-o"></i> Zapisz
						</button>
						<a href="${pageContext.request.contextPath}/terminarz">
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
	<script
		src="${pageContext.request.contextPath}/static/js/bootstrap-datepicker.js"></script>
	<script
		src="${pageContext.request.contextPath}/static/js/bootstrap-datepicker.pl.js"></script>
	<script
		src="${pageContext.request.contextPath}/static/js/bootstrap-timepicker.js"></script>
	<script type="text/javascript">
	<!-- Datepicker -->
		$("#dataZdarzenia").datepicker({
			format : "yyyy-mm-dd",
			startView : 2,
			language : "pl",
			autoclose : true
		});
		
		$('#godzina').timepicker();
	</script>
</body>
</html>
