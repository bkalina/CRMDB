<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="pl">
<head>
<jsp:include page="default/headTag.jsp" />
<title>CRMDB - Panel główny</title>
</head>

<body>

	<div id="wrapper">

		<!-- SIDEBAR -->
		<jsp:include page="default/sideBar.jsp" />

		<!-- CONTENT -->
		<!-- Nazwa strony -->
		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h1>Panel główny</h1>
					<ol class="breadcrumb">
						<li class="active"><i class="fa fa-dashboard"></i> Statystyki</li>
					</ol>
				</div>
			</div>
			<!-- CONTENT -->





			<!-- /CONTENT -->
		</div>
		<!-- /#page-wrapper -->
	</div>
	<!-- /#wrapper -->

	<!-- JAVASCRIPT -->
	<jsp:include page="default/javaScript.jsp" />

</body>
</html>
