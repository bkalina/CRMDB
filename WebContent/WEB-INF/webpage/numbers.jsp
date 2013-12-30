<%@ page language="java" contentType="text/html; charset=ISO-8859-2"
    pageEncoding="ISO-8859-2"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-2">
<title>CRMDB - Numery</title>
</head>
<body>

Numery<br/><br/>
Id doradcy: ${id}<br/><br/>

<sql:query var="rs" dataSource="jdbc/crmdb">
select t.numer, t.operator, t.dlugosc_umowy, t.poczatek_umowy, t.koniec_umowy, CONCAT(k.imie, ' ', k.nazwisko) as wlasciciel from telefon t join klient k on t.klient_id=k.id where k.pracownik_id=${id}
</sql:query>

<c:forEach var="row" items="${rs.rows}">
    Numer: ${row.numer}<br/>
    Operator: ${row.operator}<br/>
    Długośc umowy: ${row.dlugosc_umowy}<br/>
    Początek umowy: ${row.poczatek_umowy}<br/>
    Koniec umowy: ${row.koniec_umowy}<br/>
    Właściciel: ${row.wlasciciel}<br/><br/>
</c:forEach>

<br/><br/>
<p><a href="${pageContext.request.contextPath}/">Powrót</a></p>

</body>
</html>