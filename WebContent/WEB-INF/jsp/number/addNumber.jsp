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
<title>CRMDB - Dodaj numer</title>
<script type="text/javascript">
	function fillId(someval) {
		document.numerForm.klientId.value = someval;
	}
</script>
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
				<sf:form name="numerForm" class="form-horizontal" method="post"
					action="${pageContext.request.contextPath}/dodajNumerDO"
					commandName="numberModel">

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
							<sf:input type="text" class="form-control" path="operator"
								name="operator" placeholder="Operator" />
							<sf:errors path="operator" cssClass="error" />
						</div>
						<label for="miasto" class="col-sm-2 control-label"
							style="width: 15%;">Typ usługi</label>
						<div class="col-sm-4" style="width: 35%;">
							<sf:input type="text" class="form-control" path="typUslugi"
								name="typUslugi" placeholder="Typ usługi" />
							<sf:errors path="typUslugi" cssClass="error" />
						</div>
					</div>

					<div class="form-group">
						<label for="ulica" class="col-sm-1 control-label"
							style="width: 15%;">Długość umowy</label>
						<div class="col-sm-4" style="width: 35%;">
							<sf:input type="text" class="form-control" path="dlugoscUmowy"
								name="dlugoscUmowy" placeholder="Długość umowy" />
							<sf:errors path="dlugoscUmowy" cssClass="error" />
						</div>
						<label for="nrBudynku" class="col-sm-2 control-label"
							style="width: 15%;">Pocztek umowy</label>
						<div class="col-sm-1" style="width: 12%;">
							<sf:input type="text" class="form-control" path="poczatekUmowy"
								name="poczatekUmowy" placeholder="Poczatek umowy" />
							<sf:errors path="poczatekUmowy" cssClass="error" />
						</div>
						<label for="nrLokalu" class="col-sm-2 control-label"
							style="width: 11%;">Koniec umowy</label>
						<div class="col-sm-1" style="width: 12%;">
							<sf:input type="text" class="form-control" path="koniecUmowy"
								name="koniecUmowy" placeholder="Koniec umowy" />
							<sf:errors path="koniecUmowy" cssClass="error" />
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
							<button type="submit" class="btn btn-success">
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
				<a href="${pageContext.request.contextPath}/dodajKlienta" style="float: right; margin-right: 25px;"><button type="button" class="btn btn-success  btn-sm"><i class="fa fa-plus"></i> Dodaj klienta</button></a>
					<label style="float: right; margin-right: -104px; margin-top: 42px;">Kliknij
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
</body>
</html>
