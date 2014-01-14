<%@ page language="java" contentType="text/html; charset=ISO-8859-2"
	pageEncoding="ISO-8859-2"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="datatables"
	uri="http://github.com/dandelion/datatables"%>
<!DOCTYPE html>
<html lang="pl">
<head>
<jsp:include page="../default/headTag.jsp" />
<title>CRMDB - Terminarz</title>
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
					<h1>Terminarz</h1>
				</div>
				<div class="page-header"></div>
			</div>
			<div class="table-responsive">
				<datatables:table cdn="true" id="terminy" data="${scheduleList}"
					cssClass="table table-hover table-striped table-responsive" row="s">
					<datatables:column title="Opis" sortable="false">
						<a href="${s.id}" style="color: black; text-decoration: none">
							<div><c:out value="${s.opis}"></c:out></div>
						</a>
					</datatables:column>
					<datatables:column title="Data" sortInit="asc">
						<a href="${s.id}" style="color: black; text-decoration: none">
							<div><c:out value="${s.dataZdarzenia}"></c:out></div>
						</a>
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
