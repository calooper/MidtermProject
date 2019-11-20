<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html>
<head>

<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
<link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css" integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt" crossorigin="anonymous">
<!-- Local Style sheets -->
<style><%@include file="/WEB-INF/homeStyle.css"%></style>
<style><%@include file="/WEB-INF/main.js"%></style>

<!--  External styling-->
<script src="js/jquery-1.11.0.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/wow.min.js"></script>

<meta charset="UTF-8">
<title>Nomadic Gardens</title>
</head>

<body>

	<jsp:include page="navbar.jsp" />


 <!-- ========== HEADER SECTION ========== -->
  <section id="home"></section>
  <div id="headerwrap">
    <div class="container">
      <div class="logo">
        <img >
      </div>
      <br>
      <div class="row">
        <h1>Nomadic Gardens</h1>
        <h3>Community. Food. Health.</h3>
        <br>


        <br>
        <div class="col-lg-6 col-lg-offset-3">


        </div>
      </div>
    </div>
    <!-- /container -->
  </div>


	<br>

	  <jsp:include page="map.jsp" />

	<br>
    <div class="container">
	<div class="col-md-12"> 
							<div class="row">
								<div class="col-md-8 profile-tag-section text-center">
									<div class="row">
										<div style="background-color: white">
											<table class="center-table table table-hover table-responsive">
												<thead>
													<tr>
														<th></th>
														<th></th>
														<th></th>
														<th></th>
														<th></th>
														<th></th>
														<th></th>
														<th></th>
														<th>Garden ID</th>
														<th></th>
														<th>Garden Name</th>
														<th></th>
														<th>Size (Square Feet)</th>
														<th></th>
														<th></th>
														<th></th>
														<th></th>
														<th></th>
														<th></th>
													</tr>
												</thead>
												<tbody>
													<c:forEach var="g" items="${allGardens}">
														<c:choose>
															<c:when test="${empty allGardens}">
																<strong style="padding-left: 35em; color: red">No
																	Gardens in System</strong>
																<br>
																<br>
																<br>
															</c:when>
															<c:otherwise>
																<tr id="d1">
																	<td></td>
																	<td></td>
																	<td></td>
																	<td></td>
																	<td></td>
																	<td></td>
																	<td></td>
																	<td></td>
																	<td id="f1">${g.id}</td>
																	<td></td>
																	<td id="f2">
																	<a class="button" href="findGardenById.do?gardenId=${g.id}">${g.name}</a></td>
																	<td></td>
																	<td id="l1">${g.sizeSqft}</td>
																	<td></td>
																	<td></td>
																	<td></td>
																	<td></td>
																	<td></td>
																	<td></td>
																</tr>
															</c:otherwise>
														</c:choose>
													</c:forEach>
												</tbody>
											</table>
										</div>
									</div>

								</div>
							</div>
						</div>
					</div>

	<!-- Footer -->
<footer class="footer-container">

    <div class="container">
        <div class="row">

            <div class="col-md-6 footer-left">
                <h3>Contact us</h3>
                <div class="contact-form">
                    <form role="form"  method="post">
                        <div class="form-group">
                            <label class="sr-only" for="contact-email">Email</label>
                            <input type="text" name="email" placeholder="Email..." class="contact-email form-control" id="contact-email" required>
                        </div>
                        <div class="form-group">
                            <label class="sr-only" for="contact-subject">Subject</label>
                            <input type="text" name="subject" placeholder="Subject..." class="contact-subject form-control" id="contact-subject">
                        </div>
                        <div class="form-group">
                            <label class="sr-only" for="contact-message">Message</label>
                            <textarea name="message" placeholder="Message..." class="contact-message form-control" id="contact-message"></textarea>
                        </div>
                        <button type="submit" href="mailto: colt.a.looper-1@ou.edu" class="btn btn-primary">Send message</button>
                    </form>
                </div>
            </div>

            <div class="col-md-5 offset-md-1 footer-right">
                <h3>Follow us</h3>
                <div class="footer-social">
                    <a href="home.do"><i class="fab fa-facebook-f"></i></a>
                    <a href="home.do"><i class="fab fa-dribbble"></i></a>
                    <a href="home.do"><i class="fab fa-twitter"></i></a>
                    <a href="home.do"><i class="fab fa-instagram"></i></a>
                    <a href="home.do"><i class="fab fa-pinterest"></i></a>
                </div>
            </div>

        </div>
    </div>

    <div class="footer-bottom">
        <a class="scroll-link" href="home.do"><i class="fas fa-chevron-up"></i></a>
    </div>

</footer>

 <form action="findUserById.do" method="GET">
      <input type="number"   placeholder="Search by ID..." name="userId">
      <button type="submit"><i class="fa fa-search"></i></button>
    </form>








</body>
</html>