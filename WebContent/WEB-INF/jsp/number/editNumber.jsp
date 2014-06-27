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
<title>CRMDB - Edycja numeru</title>
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
					<h1>Edycja numeru</h1>
				</div>
			</div>
			<div class="panel-body"
				style="border: 1px solid #428bca; border-radius: 4px; padding-right: 22px;">
				<c:if test="${ranga == 'doradca'}">
					<form id="usun"
						action="${pageContext.request.contextPath}/usunNumerDO"
						method="post">
						<input type="hidden" name="numberId" value="${number.id}" />
						<button type="button" onclick="confrimDelete()"
							class="btn btn-danger" title="Usuń"
							style="float: right; width: 21px; height: 21px; margin-top: -14px; margin-right: -21px; padding: 0px;">
							<i class="fa fa-times-circle"></i>
						</button>
					</form>
				</c:if>
				<sf:form name="numerForm" class="form-horizontal" method="post"
					action="${pageContext.request.contextPath}/edytujNumerDO"
					commandName="phoneNumberModel">

					<div class="form-group col-md-11">
						<label for="numer" class="col-md-1 control-label col-md-offset-2">Numer</label>
						<div class="col-md-2">
							<sf:input type="text" class="form-control" path="numer"
								name="numer" value="${number.numer}" />
							<sf:errors path="numer" cssClass="error" />
						</div>

						<label for="operator" class="col-md-1 control-label">Operator</label>
						<div class="col-md-2">
							<sf:select class="form-control" path="operator" id="operator"
								name="operator" value="${number.operator}">
								<option value="play">PLAY</option>
								<option value="plus">PLUS</option>
								<option value="orange">ORANGE</option>
								<option value="tmobile">T-MOBILE</option>
								<option value="inny">INNY</option>
							</sf:select>
							<sf:errors path="operator" cssClass="error" />
						</div>
						<label for="typUslugi" class="col-md-1 control-label">Typ
							usługi</label>
						<div class="col-md-2">
							<sf:select class="form-control" path="typUslugi" id="typUslugi"
								name="typUslugi" value="${number.typUslugi}">
								<option value="postpaid_voice">POSTPAID VOICE</option>
								<option value="postpaid_data">POSTPAID DATA</option>
							</sf:select>
							<sf:errors path="typUslugi" cssClass="error" />
						</div>
					</div>

					<div class="form-group col-md-11">
						<label for="dlugoscUmowy"
							class="col-md-1 control-label col-md-offset-2">Długość
							umowy</label>
						<div class="col-md-2">
							<sf:select class="form-control" path="dlugoscUmowy"
								id="dlugoscUmowy" name="dlugoscUmowy"
								value="${number.dlugoscUmowy}">
								<option value="12">12 miesięcy</option>
								<option value="18">18 miesięcy</option>
								<option value="24">24 miesiące</option>
								<option value="36">36 miesięcy</option>
							</sf:select>
							<sf:errors path="dlugoscUmowy" cssClass="error" />
						</div>
						<label for="poczatekUmowy" class="col-md-1 control-label">Początek
							umowy</label>
						<div class="col-md-2">
							<div class="input-group date">
								<sf:input type="text" class="form-control date-picker"
									path="poczatekUmowy" name="poczatekUmowy" id="poczatekUmowy"
									placeholder="rrrr-mm-dd" readonly="true" />
								<label for="poczatekUmowy" class="input-group-addon btn"><span
									class="fa fa-calendar"></span></label>
								<sf:errors path="poczatekUmowy" cssClass="error" />
							</div>
						</div>
						<label for="koniecUmowy" class="col-md-1 control-label">Koniec
							umowy</label>
						<div class="col-md-2">
							<div class="input-group date">
								<sf:input type="text" class="form-control date-picker"
									path="koniecUmowy" name="koniecUmowy" id="koniecUmowy"
									placeholder="rrrr-mm-dd" readonly="true" />
								<label for="koniecUmowy" class="input-group-addon btn"><span
									class="fa fa-calendar"></span></label>
								<sf:errors path="koniecUmowy" cssClass="error" />
							</div>
						</div>
					</div>

					<div class="form-group col-md-11">
						<label for="notatka"
							class="col-md-1 control-label col-md-offset-2">Notatka</label>
						<div class="col-md-8">
							<sf:textarea type="text" class="form-control" path="notatka"
								name="notatka" value="${number.notatka}" />
							<sf:errors path="notatka" cssClass="error" />
						</div>
					</div>

					<div class="form-group">
						<sf:input type="hidden" name="klientId" value="${number.klientId}"
							path="klientId" />
					</div>
					<div class="form-group col-md-11">
						<div class="col-md-9 col-md-offset-2">
							<button type="submit" class="btn btn-success">
								<i class="fa fa-floppy-o"></i> Zapisz
							</button>
							<a href="${pageContext.request.contextPath}/telefony">
								<button type="button" class="btn btn-danger"
									style="float: right;">
									<i class="fa fa-times-circle"></i> Anuluj
								</button>
							</a>
						</div>
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
	<script>
	<!-- Potwierdzenie usuniecia -->
		function confrimDelete() {
			if (confirm("Czy na pewno usunąć?") == true) {
				document.getElementById("usun").submit();
			}
		}
		
		<!-- Generowanie daty końca umowy na podstawie poczatkowej daty i dlugosci umowy -->
	    function makeEndDate() {
		var date = new Date($('#poczatekUmowy').val());
		var dl = parseInt($('#dlugoscUmowy').val());
		switch(dl){
		case 12:
			date.setMonth(date.getMonth()+12);
			$('#koniecUmowy').val(date.toISOString().substring(0,10));
			break;
		case 18:
			date.setMonth(date.getMonth()+18);
			$('#koniecUmowy').val(date.toISOString().substring(0,10));
			break;
		case 24:
			date.setMonth(date.getMonth()+24);
			$('#koniecUmowy').val(date.toISOString().substring(0,10));
			break;
		case 36:
			date.setMonth(date.getMonth()+36);
			$('#koniecUmowy').val(date.toISOString().substring(0,10));
			break;
			}
		}
	    
	    <!-- Generowanie daty końca umowy na podstawie poczatkowej daty i dlugosci umowy -->
	    function makeStartDate() {
		var date = new Date($('#koniecUmowy').val());
		var dl = parseInt($('#dlugoscUmowy').val());
		switch(dl){
		case 12:
			date.setMonth(date.getMonth()-12);
			$('#poczatekUmowy').val(date.toISOString().substring(0,10));
			break;
		case 18:
			date.setMonth(date.getMonth()-18);
			$('#poczatekUmowy').val(date.toISOString().substring(0,10));
			break;
		case 24:
			date.setMonth(date.getMonth()-24);
			$('#poczatekUmowy').val(date.toISOString().substring(0,10));
			break;
		case 36:
			date.setMonth(date.getMonth()-36);
			$('#poczatekUmowy').val(date.toISOString().substring(0,10));
			break;
			}
		}

	    <!-- Datepicker -->
		$(".date-picker").datepicker({
			format : "yyyy-mm-dd",
			startView : 2,
			language : "pl",
			autoclose : true
		});
		
		$('#poczatekUmowy').on('change', function(){makeEndDate()});
		$('#dlugoscUmowy').on('change', function(){makeEndDate()});
		$('#koniecUmowy').on('change', function(){makeStartDate()});

	</script>
</body>
</html>
