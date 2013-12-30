<%@ page language="java" contentType="text/html; charset=ISO-8859-2"
	pageEncoding="ISO-8859-2"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-2">
<title>CRMDB - Mój zespół</title>
</head>
<body>

	Mój zespół<br/><br/>
	Id doradcy: ${id}<br/><br/>

	<sql:query var="rs" dataSource="jdbc/crmdb">
		select p.imie, p.nazwisko, p.ranga, CONCAT(pp.imie, ' ', pp.nazwisko) as przelozony from pracownik p join pracownik pp on p.przelozony_id=pp.id where pp.id=${id}
	</sql:query>

	<c:forEach var="row" items="${rs.rows}">
	    Ranga: ${row.ranga}<br/>
	    Imie: ${row.imie}<br/>
	    Nazwisko: ${row.nazwisko}<br/>
	    Przelozony: ${row.przelozony}<br/><br/>
	</c:forEach>

<br/><br/>
<p><a href="${pageContext.request.contextPath}/">Powrót</a></p>

</body>
</html>