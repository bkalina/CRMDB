<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="pl">
<head>
<jsp:include page="../default/headTag.jsp" />
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
				<div class="col-lg-12">
					<h1>Edycja numeru</h1>
				</div>
				<div class="page-header" style="padding-left: 15px;"></div>
			</div>
			<div class="panel-body"
				style="border: 1px solid #428bca; border-radius: 4px; padding-right: 22px;">
				<c:if test="${ranga == 'doradca'}">
					<form action="${pageContext.request.contextPath}/usunNumerDO"
						method="post">
						<input type="hidden" name="numberId" value="${number.id}" />
						<button type="submit" class="btn btn-danger"
							style="float: right; width: 21px; height: 21px; margin-top: -14px; margin-right: -21px; padding: 0px;">
							<i class="fa fa-times-circle"></i>
						</button>
					</form>
				</c:if>
				<sf:form name="numerForm" class="form-horizontal" method="post"
					action="${pageContext.request.contextPath}/edytujNumerDO"
					commandName="phoneNumberModel">

					<div class="form-group">
						<label for="imie" class="col-sm-1 control-label"
							style="width: 15%;">Numer</label>
						<div class="col-sm-4" style="width: 85%;">
							<sf:input type="text" class="form-control" path="numer"
								name="numer" value="${number.numer}" />
							<sf:errors path="numer" cssClass="error" />
						</div>
					</div>
					<div class="form-group">
						<label for="nazwisko" class="col-sm-2 control-label"
							style="width: 15%;">Operator</label>
						<div class="col-sm-4" style="width: 35%;">
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
						<label for="miasto" class="col-sm-2 control-label"
							style="width: 15%;">Typ usługi</label>
						<div class="col-sm-4" style="width: 35%;">
							<sf:select class="form-control" path="typUslugi" id="typUslugi"
								name="typUslugi" value="${number.typUslugi}">
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
								id="dlugoscUmowy" name="dlugoscUmowy"
								value="${number.dlugoscUmowy}">
								<option value="12">12 miesięcy</option>
								<option value="18">18 miesięcy</option>
								<option value="24">24 miesiące</option>
								<option value="26">36 miesięcy</option>
							</sf:select>
							<sf:errors path="dlugoscUmowy" cssClass="error" />
						</div>
						<label for="nrBudynku" class="col-sm-2 control-label"
							style="width: 15%;">Pocztek umowy</label>
						<div class="col-sm-1" style="width: 12%;">
							<sf:input type="text" class="form-control" path="poczatekUmowy"
								name="poczatekUmowy" value="${number.poczatekUmowy}" />
							<sf:errors path="poczatekUmowy" cssClass="error" />
						</div>
						<label for="nrLokalu" class="col-sm-2 control-label"
							style="width: 11%;">Koniec umowy</label>
						<div class="col-sm-1" style="width: 12%;">
							<sf:input type="text" class="form-control" path="koniecUmowy"
								name="koniecUmowy" value="${number.koniecUmowy}" />
							<sf:errors path="koniecUmowy" cssClass="error" />
						</div>
					</div>

					<div class="form-group">
						<label for="ulica" class="col-sm-1 control-label"
							style="width: 15%;">Notatka</label>
						<div class="col-sm-4" style="width: 85%;">
							<sf:textarea type="text" class="form-control" path="notatka"
								name="notatka" value="${number.notatka}" />
							<sf:errors path="notatka" cssClass="error" />
						</div>
					</div>

					<div class="form-group">
						<sf:input type="hidden" name="klientId" value="${number.klientId}"
							path="klientId" />
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
