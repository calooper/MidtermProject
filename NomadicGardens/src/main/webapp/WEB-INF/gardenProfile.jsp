<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>

<!-- Local Style sheets -->
<style><%@include file="/WEB-INF/userProfileStyle.css"%></style>

<meta charset="UTF-8">
<title>Community Garden Profile</title>
</head>
<body>
	<jsp:include page="navbar.jsp" />



	<!-- start of template -->

	<div class="container main-section">
		<div class="row">
			<div class="col-md-12 col-sm-12 col-xs-12 image-section">
				<img src="https://i.imgur.com/d24Ut4Q.jpg">
			</div>
			<div class="row user-left-part">
				<div class="col-md-3 col-sm-3 col-xs-12 user-profil-part pull-left">
					<div class="row ">
						<div
							class="col-md-12 col-md-12-sm-12 col-xs-12 user-image text-center">
						</div>
						<div
							class="col-md-12 col-sm-12 col-xs-12 user-detail-section1 text-center">


							<h1>${garden.name }</h1>

						</div>
						<div class="row user-detail-row">
							<div class="col-md-12 col-sm-12 user-detail-section2 pull-left">
								<div class="border"></div>
								<p>Description</p>
								<span> ${garden.description}</span>
							</div>
							<div class="col-md-12 col-sm-12 user-detail-section2 pull-right">
								<div class="border"></div>
								<p>Size (in sq. ft.)</p>
								<span>${garden.sizeSqft}</span>
							</div>
							<div class="col-md-12 user-detail-section2">
								<div class="border"></div>
								<p>Address</p>
								<a href="http://maps.google.com/?q=${garden.address.street}, ${garden.address.city},${garden.address.state} ${garden.address.zip}">
								<span>${garden.address.street}</span> <span>${garden.address.city}, ${garden.address.state}
									${garden.address.zip}</span></a>
							</div>
						</div>
					</div>
				</div>
				<div
					class="col-md-9 col-sm-9 col-xs-12 pull-right profile-right-section">
					<div class="row profile-right-section-row">
						<h1></h1>

						<div class="col-md-12 profile-header">
							<div class="row">
								<div
									class="col-md-8 col-sm-6 col-xs-6 profile-header-section1 pull-left">

								</div>
							</div>
						</div>
						<div class="col-md-12">
							<div class="row">
								<div class="col-md-8  profile-tag-section text-center">
									<div class="row">
										<div style="background-color: white">
											<table class="table table-hover table-responsive">


												<thead>
													<tr>
														<th></th>
														<th></th>
														<th></th>
														<th></th>
														<th></th>
														<th>Plot Number</th>
														<th>Size (in sq. ft.)</th>
														<th>User</th>
														<th></th>
														<th></th>
														<th></th>
														<th></th>
														<th></th>
														<th></th>
														<th></th>
													</tr>
												</thead>
												<tbody>
													<c:forEach var="p" items="${plots}">

														<c:choose>
															<c:when test="${empty plots}">
																<strong style="padding-left: 35em; color: red">No
																	plots in this garden</strong>
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
																	<td id="f1"></td>
																	<td id="f2">${p.plotNumber}</td>
																	<td id="l1">${p.sizeSqft}</td>
																	<td id="m1">
																	<c:if test="${empty p.user.username}">
																	(Plot Available)</c:if>
																	<c:if test="${not empty p.user.username}">
																	<a class="button" href="findUserById.do?userId=${p.user.id }">
																	${p.user.username}</a>
																	</c:if></td>
																	<td></td>
																	<td></td>
																	<td>
																	<c:if test="${not empty sessionUser}">
																	<c:if test="${empty p.user}">
																		<form action="claimPlot.do" method="post">
																			<input type="hidden" name="oldPlotId" value=${p.id}>
																			<input type="hidden" name="userId" value=${sessionUser.id}>
																			<input type="hidden" name="gardenId" value=${garden.id}>
																			<button type="submit" class="update btn btn-info btn-sm">
																				<span class="glyphicon glyphicon-plus"></span>
																			</button>
																		</form>
																	</c:if>

																	<c:if test="${not empty p.user && p.user.id == sessionUser.id}">
																		<form action="unclaimPlot.do" method="post">
																			<input type="hidden" name="oldPlotId" value=${p.id}>
																			<input type="hidden" name="userId" value=${p.user.id}>
																			<input type="hidden" name="gardenId" value=${garden.id}>

																			<button type="submit" class="update btn btn-danger btn-sm">
																				<span class="glyphicon glyphicon-trash"></span>
																			</button>
																		</form>
																	</c:if>
																	</c:if>


																	</td>
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
				</div>
			</div>
		</div>
	</div>
</body>
</html>
