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
<link
	href="${pageContext.request.contextPath}/static/css/datepicker.css"
	rel="stylesheet">
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
				<div class="page-header" style="padding-left: 15px;">
					<h1>Dodaj numer</h1>
				</div>
			</div>
			<div class="panel-body"
				style="border: 1px solid #428bca; border-radius: 4px; padding-right: 22px;">
				<sf:form id="numerForm" name="numerForm" class="form-horizontal"
					method="post"
					onsubmit="zapisz.disabled = true; makeEndDate(); return true;;"
					action="${pageContext.request.contextPath}/dodajNumerDO"
					commandName="phoneNumberModel">

					<div class="form-group col-md-11">
						<label for="numer" class="col-md-1 control-label col-md-offset-2">Numer</label>
						<div class="col-md-2">
							<sf:input type="text" class="form-control" path="numer"
								name="numer" placeholder="Numer" />
							<sf:errors path="numer" cssClass="error" />
						</div>
						<label for="operator" class="col-md-1 control-label">Operator</label>
						<div class="col-md-2">
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
						<label for="typUslugi" class="col-md-1 control-label">Typ
							usługi</label>
						<div class="col-md-2">
							<sf:select class="form-control" path="typUslugi" id="typUslugi"
								name="typUslugi">
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
								id="dlugoscUmowy" name="dlugoscUmowy">
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
								name="notatka" placeholder="Notatka" />
							<sf:errors path="notatka" cssClass="error" />
						</div>
					</div>

					<div class="form-group col-md-11">
						<label for="klientId"
							class="col-md-1 control-label col-md-offset-2">Wybrane ID</label>
						<div class="col-md-1" style="width: 100px;">
							<sf:input type="text" class="form-control" path="klientId"
								name="klientId" placeholder="ID klienta" />
							<sf:errors path="klientId" cssClass="error" />
						</div>
					</div>
					<div class="form-group col-md-11">
						<div class="col-md-9 col-md-offset-2">
							<button name="zapisz" id="zapisz" type="submit"
								class="btn btn-success">
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
				<div class="form-group col-md-11">
					<div class="col-md-9 col-md-offset-2" style="padding: 0px">
						<a href="${pageContext.request.contextPath}/dodajKlienta"">
							<button class="btn btn-success btn-sm">
								<i class="fa fa-plus"></i> Dodaj klienta
							</button>
						</a>
					</div>
				</div>
				<div class="form-group col-md-11">
					<div class="table-responsive col-md-9 col-md-offset-2"
						style="padding: 0px">
						<datatables:table cdn="true" id="klienci" name="klienci"
							data="${clientsList}" cssClass="table table-hover table-striped"
							row="cl">
							<datatables:column title="ID klienta"
								style="width:100px; text-align: center;">

								<button type="button"
									style="color: black; text-decoration: none"
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
	<script type="text/javascript">
	
		<!-- Wstawienie wybranego id -->
		function fillId(someval) {
			document.numerForm.klientId.value = someval;
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
