<%@ page language="java" contentType="text/html; charset=ISO-8859-2"
	pageEncoding="ISO-8859-2"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-2">
<title>CRMDB - Klienci</title>
</head>
<body>
Klienci<br/><br/>
Id doradcy: ${id}<br/><br/>

<sql:query var="rs" dataSource="jdbc/crmdb">
select k.id, k.nazwa_firmy, k.imie, k.nazwisko, CONCAT(p.imie, ' ', p.nazwisko) as doradca from klient k left join pracownik p on k.pracownik_id=p.id where k.pracownik_id=${id}
</sql:query>

<c:forEach var="row" items="${rs.rows}">
    Id: ${row.id}<br/>
    Nazwa firmy: ${row.nazwa_firmy}<br/>
    Imie: ${row.imie}<br/>
    Nazwisko: ${row.nazwisko}<br/>
    Doradca: ${row.doradca}<br/><br/>
</c:forEach>

<br/><br/>
<p><a href="${pageContext.request.contextPath}/">Powrót</a></p>

</body>
</html>