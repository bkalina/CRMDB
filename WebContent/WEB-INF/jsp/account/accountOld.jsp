<%@ page language="java" contentType="text/html; charset=ISO-8859-2"
    pageEncoding="ISO-8859-2"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-2">
<title>CRMDB - Moje konto</title>
</head>
<body>

Moje konto<br/><br/>
Id doradcy: ${id}<br/><br/>

<sql:query var="rs" dataSource="jdbc/crmdb">
select imie, nazwisko, telefon, email, ranga from pracownik where id=${id}
</sql:query>

<c:forEach var="row" items="${rs.rows}">
    Imie: ${row.imie}<br/>
    Nazwisko: ${row.nazwisko}<br/>
    Telefon: ${row.telefon}<br/>
    Email: ${row.email}<br/>
    Ranga: ${row.ranga}<br/><br/>
</c:forEach>

<br/><br/>
<p><a href="${pageContext.request.contextPath}/">Powrót</a></p>

</body>
</html>