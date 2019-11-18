<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Community Garden Profile</title>
</head>
<body>
	<jsp:include page="navbar.jsp" />

	<img src="img_girl.jpg" alt="Garden Picture"
		style="width: 200px; height: 300px;">

	<p>${garden.name }</p>

	
	<!-- Dont know if this is right -->
	
	<c:if test="${not empty garden.plots}">
		<ul>
			<c:forEach var="garden" items="${garden.plots}">
				<li>${garden.plots}</li>
			</c:forEach>
		</ul>
	</c:if>

</body>
</html>