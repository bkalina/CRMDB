<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="pl">
<head>
<jsp:include page="default/headTag.jsp" />
<title>CRMDB - Logowanie</title>
</head>

<body onload='document.f.j_username.focus();'>

	<!-- BELKA -->
	<nav class="navbar navbar-inverse navbar-fixed-top" >
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target=".navbar-ex1-collapse">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand"
				href="${pageContext.request.contextPath}/panel">CRMDB</a>
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
				
					<c:if test="${param.error != null}">
						<div class="alert alert-danger"><font size="-1">Błędny login lub hasło!</font></div>
					</c:if>
				
					<form name='f' action='${pageContext.request.contextPath}/j_spring_security_check'
						method='POST'>
						<div class="input-group margin-bottom-sm">
							<span class="input-group-addon"><i
								class="fa fa-envelope-o fa-fw"></i></span>
								<input type='text' class="form-control" name='j_username' value='' placeholder='Email' >
						</div>
						<div class="input-group">
							<span class="input-group-addon"><i class="fa fa-key fa-fw"></i></span>
							<input type='password' class="form-control" name='j_password' placeholder='Hasło' />
						</div>
						<br>
						<div style="text-align: center;">
								<button name="submit" type="submit" class="btn btn-primary">Zaloguj</button>
						</div>
					</form>
					<c:if test="${param.login != null}">
						<div class="alert alert-success"><font size="-1">Zalogowano!</font></div>
					</c:if>
				</div>
			</div>
		</div>
	</div>

	<!-- JAVASCRIPT -->
	<jsp:include page="default/javaScript.jsp" />

</body>
</html>


