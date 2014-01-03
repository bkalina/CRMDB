<%@ page language="java" contentType="text/html; charset=ISO-8859-2"
	pageEncoding="ISO-8859-2"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="pl">
<head>
<jsp:include page="default/headTag.jsp" />
<title>CRMDB - Logowanie</title>
</head>

<body>

	<!-- BELKA -->
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target=".navbar-ex1-collapse">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand"
				href="${pageContext.request.contextPath}/panel">CRM DB</a>
		</div>
	</nav>
	<div style="width: 100%; margin: 0 auto;">

		<div class="col-lg-4"
			style="width: 200px; padding: 0px; position: absolute; z-index: 100; top: 50%; left: 50%; margin: -100px 0 0 -100px;">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<h3 class="panel-title">Logowanie</h3>
				</div>
				<div class="panel-body">
					<div class="input-group margin-bottom-sm">
						<span class="input-group-addon"><i
							class="fa fa-envelope-o fa-fw"></i></span> <input class="form-control"
							type="text" placeholder="Email">
					</div>
					<div class="input-group">
						<span class="input-group-addon"><i class="fa fa-key fa-fw"></i></span>
						<input class="form-control" type="password" placeholder="Has³o">
					</div></br>
					<div style="text-align: center;">
						<a href="${pageContext.request.contextPath}/panel">
							<button type="button" class="btn btn-primary">Zaloguj</button>
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- JAVASCRIPT -->
	<jsp:include page="default/javaScript.jsp" />

</body>
</html>
