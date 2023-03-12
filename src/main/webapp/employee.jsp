<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<style>
body {
	min-height: 100vh;
	display: flex;
	flex-direction: column;
	align-content: center;
	align-items: center;
}

p {
	height: 100px;
}
</style>
<body>
	<h1>Employee home</h1>
	<p>
		<%=session.getAttribute("user")%>
		:
		<%=session.getAttribute("role")%>
	</p>
	<div>
		<%
		String home = getServletContext().getContextPath().concat("/logout");
		%>
		<a href="<%=home%>">Back</a>
	</div>
</body>
</html>