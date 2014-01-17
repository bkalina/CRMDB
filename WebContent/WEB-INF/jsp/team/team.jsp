<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="pl">
<head>
<jsp:include page="../default/headTag.jsp" />
<title>CRMDB - Mój zespół</title>
</head>

<body>
	<div id="wrapper">

		<!-- SIDEBAR -->
		<jsp:include page="../default/sideBar.jsp" />

		<!-- CONTENT -->
		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h1>Mój zespół</h1>
				</div>
				<div class="page-header" style="padding-left: 15px;">
					<c:if test="${ranga == 'doradca'}">
						<a href="${pageContext.request.contextPath}/dodajCzlonka"><button
								type="button" class="btn btn-success">
								<i class="fa fa-plus"></i> Dodaj czlonka zespołu
							</button></a>
					</c:if>
				</div>
			</div>
			<div class="panel-body"
				style="border: 1px solid #428bca; border-radius: 4px; padding-right: 22px;">
				<c:forEach var="worker" items="${workers}">
					<div class="panel panel-primary"
						style="float: left; width: auto; margin-right: 10px;">
						<div class="panel-heading">
							<h3 class="panel-title">
								<b>${worker.imie} ${worker.nazwisko}</b>
							</h3>
							<form action="${pageContext.request.contextPath}/usunCzlonkaDO"
								method="post">
								<input type="hidden" name="workerId" value="${worker.id}" />
								<button type="submit" class="btn btn-danger"
									style="float: right; width: 21px; height: 21px; margin-top: -23px; margin-right: -12px; padding: 0px;">
									<i class="fa fa-times-circle"></i>
								</button>
							</form>
						</div>
						<div class="panel-body">
							<b>Ranga:</b> ${worker.ranga}<br /> <b>Imie:</b> ${worker.imie}<br />
							<b>Nazwisko:</b> ${worker.nazwisko}<br /> <b>Przelozony:</b>
							${worker.przelozony} <br />
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
		<!-- /#page-wrapper -->
	</div>
	<!-- /#wrapper -->

	<!-- JAVASCRIPT -->
	<jsp:include page="../default/javaScript.jsp" />

</body>
</html>
