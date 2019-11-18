<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Profile</title>
</head>
<body>


	<jsp:include page="navbar.jsp"/>

	<img src="img_girl.jpg" alt="User Profile Pic"
		style="width: 200px; height: 300px;">
		
	<p> ${user.username } </p>
	
	<div>
		<h1>${user.firstName} ${user.lastName}</h1>
	</div>
	
	    <c:if test="${not empty user.plots}">
        <ul>
            <c:forEach var="film" items="${user.plots}">
                <li>${user.plots}</li>
            </c:forEach>
        </ul>
    </c:if>


</body>
</html>