<%@ page language="java" contentType="text/html; charset=ISO-8859-2"
    pageEncoding="ISO-8859-2"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="pl">
  <head>
  	<jsp:include page="../default/headTag.jsp" />
    <title>CRMDB - Klienci</title>
  </head>

  <body>

<sql:query var="rs" dataSource="jdbc/crmdb">
select k.nazwa_firmy, k.imie, k.nazwisko, k.tel_kontaktowy, k.email from klient k left join pracownik p on k.pracownik_id=p.id where k.pracownik_id=${id}
</sql:query>

    <div id="wrapper">

	<!-- SIDEBAR -->
     <jsp:include page="../default/sideBar.jsp" />

      <!-- CONTENT -->
      <!-- Nazwa strony -->
      <div id="page-wrapper">
        <div class="row">
          <div class="col-lg-12">
            <h1>Klienci</h1>
          </div>
          <div class="page-header" ></div>
        </div>
        
        <div class="table-responsive">
				<table
					class="table table-bordered table-hover table-striped tablesorter">
					<thead>
						<tr>
							<th style="min-width: 120px;">Nazwa firmy<i class="fa fa-sort" ></i></th>
							<th >Imie<i class="fa fa-sort"></i></th>
							<th >Nazwisko<i class="fa fa-sort"></i></th>
							<th >Telefon<i class="fa fa-sort"></i></th>
							<th >Email<i class="fa fa-sort"></i></th>
						</tr>
					</thead>
					<tbody>
					<c:forEach var="row" items="${rs.rows}">
						<tr>
							<td>${row.nazwa_firmy}</td>
							<td>${row.imie}</td>
							<td>${row.nazwisko}</td>
							<td>${row.tel_kontaktowy}</td>
							<td>${row.email}</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
			</div>

      </div><!-- /#page-wrapper -->
    </div><!-- /#wrapper -->

<!-- JAVASCRIPT -->
<jsp:include page="../default/javaScript.jsp" />

  </body>
</html>
