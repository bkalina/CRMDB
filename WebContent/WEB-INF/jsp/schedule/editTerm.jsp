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
<title>CRMDB - Edycja terminu</title>
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
					<h1>Edycja terminu</h1>
				</div>
			</div>
			<div class="panel-body"
				style="border: 1px solid #428bca; border-radius: 4px; padding-right: 22px;">
				<c:if test="${ranga == 'doradca'}">
					<form id="usun" action="${pageContext.request.contextPath}/usunTerminDO"
						method="post">
						<input type="hidden" name="termId" value="${termId}" />
						<button type="button" onclick="confrimDelete()" class="btn btn-danger" title="Usuń"
							style="float: right; width: 21px; height: 21px; margin-top: -14px; margin-right: -21px; padding: 0px;">
							<i class="fa fa-times-circle"></i>
						</button>
					</form>
				</c:if>
				<sf:form class="form-horizontal" method="post"
					action="${pageContext.request.contextPath}/edytujTerminDO"
					commandName="scheduleModel">

					<div class="form-group">
						<label for="nazwaFirmy" class="col-sm-1 control-label"
							style="width: 15%;">Data</label>
						<div class="col-sm-10" style="width: 35%;">
							<sf:input type="text" class="form-control" path="dataZdarzenia"
								value="${term.dataZdarzenia}" name="dataZdarzenia" />
							<sf:errors path="dataZdarzenia" cssClass="error" />
						</div>

						<label for="imie" class="col-sm-1 control-label"
							style="width: 15%;">Godzina</label>
						<div class="col-sm-4" style="width: 35%;">
							<sf:input type="text" class="form-control" path="godzina"
								name="godzina" value="${term.godzina}" />
							<sf:errors path="godzina" cssClass="error" />
						</div>
					</div>

					<div class="form-group">
						<label for="nazwisko" class="col-sm-2 control-label"
							style="width: 15%;">Opis</label>
						<div class="col-sm-4" style="width: 85%;">
							<sf:input type="text" class="form-control" path="opis"
								name="opis" value="${term.opis}" />
							<sf:errors path="opis" cssClass="error" />
						</div>
					</div>

					<div class="form-group">
						<label for="ulica" class="col-sm-1 control-label"
							style="width: 15%;">Notatka</label>
						<div class="col-sm-4" style="width: 85%;">
							<sf:textarea type="text" class="form-control" path="notatka"
								name="notatka" value="${term.notatka}" />
							<sf:errors path="notatka" cssClass="error" />
						</div>

						<sf:input type="hidden" path="pracownikId" name="pracownikId"
							value="${pracownikId}" />
					</div>
					<div>
						<button type="submit" class="btn btn-success">
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
