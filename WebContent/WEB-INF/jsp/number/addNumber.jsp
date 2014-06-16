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
<link href="${pageContext.request.contextPath}/static/css/datepicker.css" rel="stylesheet">
<title>CRMDB - Dodaj numer</title>
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
					<h1>Dodaj numer</h1>
				</div>
				<div class="page-header" style="padding-left: 15px;"></div>
			</div>
			<div class="panel-body"
				style="border: 1px solid #428bca; border-radius: 4px; padding-right: 22px;">
				<sf:form id="numerForm" name="numerForm" class="form-horizontal" method="post" onsubmit="zapisz.disabled = true; makeEndDate(); return true;;"
					action="${pageContext.request.contextPath}/dodajNumerDO" 
					commandName="phoneNumberModel">

					<div class="form-group">
						<label for="imie" class="col-sm-1 control-label"
							style="width: 15%;">Numer</label>
						<div class="col-sm-4" style="width: 85%;">
							<sf:input type="text" class="form-control" path="numer"
								name="numer" placeholder="Numer" />
							<sf:errors path="numer" cssClass="error" />
						</div>
					</div>
					<div class="form-group">
						<label for="nazwisko" class="col-sm-2 control-label"
							style="width: 15%;">Operator</label>
						<div class="col-sm-4" style="width: 35%;">
							<sf:select class="form-control" path="operator" id="operator"
								name="operator">
								<option value="play">PLAY</option>
								<option value="plus">PLUS</option>
								<option value="orange">ORANGE</option>
								<option value="tmobile">T-MOBILE</option>
								<option value="inny">INNY</option>
							</sf:select>
							<sf:errors path="operator" cssClass="error" />
						</div>
						<label for="miasto" class="col-sm-2 control-label"
							style="width: 15%;">Typ usługi</label>
						<div class="col-sm-4" style="width: 35%;">
							<sf:select class="form-control" path="typUslugi" id="typUslugi"
								name="typUslugi">
								<option value="postpaid_voice">POSTPAID VOICE</option>
								<option value="postpaid_data">POSTPAID DATA</option>
							</sf:select>
							<sf:errors path="typUslugi" cssClass="error" />
						</div>
					</div>

					<div class="form-group">
						<label for="ulica" class="col-sm-1 control-label"
							style="width: 15%;">Długość umowy</label>
						<div class="col-sm-4" style="width: 35%;">
							<sf:select class="form-control" path="dlugoscUmowy"
								id="dlugoscUmowy" name="dlugoscUmowy">
								<option value="12">12 miesięcy</option>
								<option value="18">18 miesięcy</option>
								<option value="24">24 miesiące</option>
								<option value="36">36 miesięcy</option>
							</sf:select>
							<sf:errors path="dlugoscUmowy" cssClass="error" />
						</div>
						<label for="poczatekUmowy" class="col-sm-2 control-label"
							style="width: 15%;">Pocztek umowy</label>
						<div class="input-group date" style="width: 15%;">
							<sf:input type="text" class="form-control date-picker" path="poczatekUmowy"
								name="poczatekUmowy" id="poczatekUmowy" placeholder="yyyy-mm-dd" readonly="true"/>
								<label for="poczatekUmowy" class="input-group-addon btn"><span class="fa fa-calendar"></span></label>
							<sf:errors path="poczatekUmowy" cssClass="error" />
						</div>
						<sf:hidden class="form-control" path="koniecUmowy"
							name="koniecUmowy" id="koniecUmowy" placeholder="yyyy-mm-dd" readonly="true"/>
						<sf:errors path="koniecUmowy" cssClass="error" />
					</div>

					<div class="form-group">
						<label for="ulica" class="col-sm-1 control-label"
							style="width: 15%;">Notatka</label>
						<div class="col-sm-4" style="width: 85%;">
							<sf:textarea type="text" class="form-control" path="notatka"
								name="notatka" placeholder="Notatka" />
							<sf:errors path="notatka" cssClass="error" />
						</div>
					</div>

					<div class="form-group">
						<label for="klientId" class="col-sm-2 control-label"
							style="width: 15%;">Wybrane ID</label>
						<div class="col-sm-4" style="width: 120px;">
							<sf:input type="text" class="form-control" path="klientId"
								name="klientId" placeholder="ID klienta" />
							<sf:errors path="klientId" cssClass="error" />
						</div>
						<div>
							<button name="zapisz" id="zapisz" type="submit" class="btn btn-success">
								<i class="fa fa-floppy-o"></i> Zapisz
							</button>
							<a href="${pageContext.request.contextPath}/telefony">
								<button type="button" class="btn btn-danger"
									style="float: right; margin-right: 17px;">
									<i class="fa fa-times-circle"></i> Anuluj
								</button>
							</a>
						</div>
					</div>

				</sf:form>
				<div style="width: 15%; float: left;">
					<a href="${pageContext.request.contextPath}/dodajKlienta"
						style="float: right; margin-right: 25px;">
						<button type="submit" class="btn btn-success btn-sm">
							<i class="fa fa-plus"></i> Dodaj klienta
						</button></a> <label
						style="float: right; margin-right: -104px; margin-top: 42px;">Kliknij
						ID</label>
				</div>
				<div class="table-responsive" style="width: 85%; float: right;">
					<datatables:table cdn="true" id="klienci" name="klienci"
						data="${clientsList}" cssClass="table table-hover table-striped"
						row="cl">
						<datatables:column title="ID klienta"
							style="width:100px; text-align: center;">

							<button type="button" style="color: black; text-decoration: none"
								class="btn btn-link" type="button" onclick="fillId(this.value)"
								value="${cl.id}">
								<font size="+1"><strong>${cl.id}</strong></font>
							</button>

						</datatables:column>
						<datatables:column title="Nazwa klienta">
							<b><c:out value="${cl.nazwaFirmy}"></c:out></b>
							<br>
							<font size="-2"> <c:out
									value="${cl.ulica} ${cl.nrBudynku}"></c:out> <c:if
									test="${not empty cl.nrLokalu}">/${cl.nrLokalu}</c:if> <c:out
									value=", ${cl.kodPocztowy} ${cl.miasto}, NIP: ${cl.nip}"></c:out>
							</font>
						</datatables:column>
						<datatables:column title="Miasto" property="miasto" />
						<datatables:column title="Osoba kontaktowa">
							<b><c:out value="${cl.imie} ${cl.nazwisko}"></c:out></b>
							<br>
							<font size="-2"><c:out value="Tel. ${cl.telKontaktowy}"></c:out></font>
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
	<script src="${pageContext.request.contextPath}/static/js/bootstrap-datepicker.js"></script>
	<script src="${pageContext.request.contextPath}/static/js/bootstrap-datepicker.pl.js"></script>
	<script type="text/javascript">
	
		<!-- Wstawienie wybranego id -->
		function fillId(someval) {
			document.numerForm.klientId.value = someval;
		}

	    function makeEndDate() {
		var date = new Date($('#poczatekUmowy').val());
		var dl = parseInt($('#dlugoscUmowy').val());
		switch(dl){
		case 12:
			date.setMonth(date.getMonth()+12);
			$('#koniecUmowy').val(date.getFullYear()+'-'+date.getMonth()+'-'+date.getDate());
			break;
		case 18:
			date.setMonth(date.getMonth()+18);
			$('#koniecUmowy').val(date.getFullYear()+'-'+date.getMonth()+'-'+date.getDate());
			break;
		case 24:
			date.setMonth(date.getMonth()+24);
			$('#koniecUmowy').val(date.getFullYear()+'-'+date.getMonth()+'-'+date.getDate());
			break;
		case 36:
			date.setMonth(date.getMonth()+36);
			$('#koniecUmowy').val(date.getFullYear()+'-'+date.getMonth()+'-'+date.getDate());
			break;
			}
		}

		$(".date-picker").datepicker({
			format : "yyyy-mm-dd",
			startView : 2,
			language : "pl",
			autoclose : true
		});

		$(".date-picker").on("change", function() {
			var id = $(this).attr("id");
			var val = $("label[for='" + id + "']").text();
			$("#msg").text(val + " changed");
		});
	</script>
</body>
</html>
