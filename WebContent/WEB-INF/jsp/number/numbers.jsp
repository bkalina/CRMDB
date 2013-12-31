<%@ page language="java" contentType="text/html; charset=ISO-8859-2"
	pageEncoding="ISO-8859-2"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="pl">
<head>
<jsp:include page="../default/headTag.jsp" />
<title>CRMDB - Telefony</title>
</head>

<body>

	<sql:query var="rs" dataSource="jdbc/crmdb">
select t.numer, t.operator, t.dlugosc_umowy, t.koniec_umowy, CONCAT(k.imie, ' ', k.nazwisko) as wlasciciel from telefon t join klient k on t.klient_id=k.id where k.pracownik_id=${id}
</sql:query>

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
				<div class="page-header"></div>
			</div>

			<div class="table-responsive">
				<table
					class="table table-bordered table-hover table-striped tablesorter">
					<thead>
						<tr>
							<th style="width: 50px;">Operator<i class="fa fa-sort" ></i></th>
							<th >Koniec<i class="fa fa-sort"></i></th>
							<th >Numer telefonu<i class="fa fa-sort"></i></th>
							<th >D³ugo¶æ<i class="fa fa-sort"></i></th>
							<th >W³a¶ciciel<i class="fa fa-sort"></i></th>
						</tr>
					</thead>
					<tbody>
					<c:forEach var="row" items="${rs.rows}">
						<tr>
							<td>${row.operator}</td>
							<td>${row.koniec_umowy}</td>
							<td>${row.numer}</td>
							<td>${row.dlugosc_umowy}</td>
							<td>${row.wlasciciel}</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
			</div>

		</div>
		<!-- /#page-wrapper -->
	</div>
	<!-- /#wrapper -->

	<!-- JAVASCRIPT -->
	<jsp:include page="../default/javaScript.jsp" />

</body>
</html>
