<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Nomadic Gardens</title>
</head>
<body>

	<jsp:include page="navbar.jsp" />

	<form action="findUserById.do" method="GET">
		<input type="number" placeholder="Search by Id.." name="userId"
			required>
		<button type="submit">
			<i class="fa fa-search"></i>
		</button>
	</form>






</body>
</html>