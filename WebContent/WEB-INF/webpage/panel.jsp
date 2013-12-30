<%@ page language="java" contentType="text/html; charset=ISO-8859-2"
    pageEncoding="ISO-8859-2"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-2">
<title>CRMDB - Panel</title>
</head>
<body>

Panel<br/><br/>
Id doradcy: ${id}<br/><br/>

	<p><a href="${pageContext.request.contextPath}/telefony">Telefony</a></p>
	<p><a href="${pageContext.request.contextPath}/klienci">Klienci</a></p>
	<p><a href="${pageContext.request.contextPath}/mojzespol">Mój zespół</a></p>
	<p><a href="${pageContext.request.contextPath}/mojekonto">Moje konto</a></p>

</body>
</html>