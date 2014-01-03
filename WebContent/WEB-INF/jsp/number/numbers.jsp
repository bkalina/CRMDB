<%@ page language="java" contentType="text/html; charset=ISO-8859-2"
	pageEncoding="ISO-8859-2"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="datatables"
	uri="http://github.com/dandelion/datatables"%>
<!DOCTYPE html>
<html lang="pl">
<head>
<jsp:include page="../default/headTag.jsp" />
<title>CRMDB - Telefony</title>

<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.8.3.min.js"></script>
<body>

	<div id="wrapper">

		<!-- SIDEBAR -->
		<jsp:include page="../default/sideBar.jsp" />

		<!-- CONTENT -->
		<!-- Nazwa strony -->
		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h1>Telefony</h1>
				</div>
				<div class="col-lg-12">
					<div class="page-header"></div>
				</div>
			</div>
			<div class="table-responsive">
				<datatables:table cdn="true" id="numery" data="${numbersList}"
					cssClass="table table-hover table-striped" >
					<!-- theme="jqueryui" themeOption="redmond" -->
					<datatables:column title="Lp."></datatables:column>
					<datatables:column title="Operator" property="operator" />
					<datatables:column title="Koniec" property="koniec_umowy" />
					<datatables:column title="Numer telefonu" property="numer" />
					<datatables:column title="Us³uga" property="typ_uslugi" />
					<datatables:column title="D³ugo¶æ" property="dlugosc_umowy" />
					<datatables:column title=" ">
						<a href="#"><i class="fa fa-pencil-square-o fa-2x"></i></a>
					</datatables:column>
				</datatables:table>
			</div>
		</div>
		<!-- /#page-wrapper -->
	</div>
	<!-- /#wrapper -->

	<!-- JAVASCRIPT -->
	<jsp:include page="../default/javaScript.jsp" />
</body>
</html>
