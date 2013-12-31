<%@ page language="java" contentType="text/html; charset=ISO-8859-2"
    pageEncoding="ISO-8859-2"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="pl">
  <head>
  	<jsp:include page="../default/headTag.jsp" />
    <title>CRMDB - Moje konto</title>
  </head>

  <body>

<sql:query var="rs" dataSource="jdbc/crmdb">
select imie, nazwisko, telefon, email from pracownik where id=${id}
</sql:query>

    <div id="wrapper">

	<!-- SIDEBAR -->
     <jsp:include page="../default/sideBar.jsp" />

      <!-- CONTENT -->
      <!-- Nazwa strony -->
      <div id="page-wrapper">
        <div class="row">
          <div class="col-lg-12">
            <h1>Moje konto</h1>
          </div>
          <div class="page-header"></div>
        </div>
        
        <div class="col-lg-4" >
				<c:forEach var="row" items="${rs.rows}">
					<div class="panel panel-primary" style="float:left; width: auto; margin-right: 10px;">
						<div class="panel-heading">
							<h3 class="panel-title"><b>${row.imie} ${row.nazwisko}</b></h3>
						</div>
						<div class="panel-body">
							<b>Imie:</b> ${row.imie}<br /> 
							<b>Nazwisko:</b> ${row.nazwisko}<br />
							<b>Telefon:</b> ${row.telefon}<br />
							<b>Email:</b> ${row.email}<br />
						</div>
					</div>
				</c:forEach>
			</div>

      </div><!-- /#page-wrapper -->
    </div><!-- /#wrapper -->

<!-- JAVASCRIPT -->
<jsp:include page="../default/javaScript.jsp" />

  </body>
</html>
