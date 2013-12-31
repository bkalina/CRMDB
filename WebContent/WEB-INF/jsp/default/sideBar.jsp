<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-2"
	pageEncoding="ISO-8859-2"%>

<!-- SIDEBAR -->
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
	<!-- Brand and toggle get grouped for better mobile display -->
	<div class="navbar-header">
		<button type="button" class="navbar-toggle" data-toggle="collapse"
			data-target=".navbar-ex1-collapse">
			<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span>
			<span class="icon-bar"></span> <span class="icon-bar"></span>
		</button>
		<a class="navbar-brand"
			href="${pageContext.request.contextPath}/panel">CRMDB</a>
	</div>

	<!-- SIDEBAR MENU -->
	<div class="collapse navbar-collapse navbar-ex1-collapse">
		<ul class="nav navbar-nav side-nav">
			<li ><a
				href="${pageContext.request.contextPath}/panel"><i
					class="fa fa-dashboard"></i> Panel</a></li>
			<li><a href="${pageContext.request.contextPath}/terminarz"><i
					class="fa fa-edit"></i> Terminarz</a></li>
			<li><a href="${pageContext.request.contextPath}/telefony"><i
					class="fa fa-bar-chart-o"></i> Telefony</a></li>
			<li><a href="${pageContext.request.contextPath}/klienci"><i
					class="fa fa-table"></i> Klienci</a></li>
			<li><a href="${pageContext.request.contextPath}/mojzespol"><i
					class="fa fa-edit"></i> M�j zesp�</a></li>
		</ul>
		<!-- / SIDEBAR MENU -->

		<!-- USER DROP DOWN -->
		<ul class="nav navbar-nav navbar-right navbar-user">
			<li class="dropdown user-dropdown"><a href="#"
				class="dropdown-toggle" data-toggle="dropdown"><i
					class="fa fa-user"></i> Edek Furtka <b class="caret"></b></a>
				<ul class="dropdown-menu">
					<li><a href="${pageContext.request.contextPath}/mojekonto"><i class="fa fa-user"></i> Moje konto</a></li>
					<li class="divider"></li>
					<li><a href="${pageContext.request.contextPath}/"><i
							class="fa fa-power-off"></i> Wyloguj</a></li>
				</ul></li>
		</ul>
		<!-- / USER DROP DOWN -->
	</div>
	<!-- /.navbar-collapse -->
</nav>