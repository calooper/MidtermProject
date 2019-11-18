<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>

<!-- Local Style sheets -->
<style><%@include file="/WEB-INF/userProfileStyle.css"%></style>

<meta charset="UTF-8">
<title>User Profile</title>
</head>
<body>


	<jsp:include page="navbar.jsp" />

	<!-- start of template -->

	<div class="container main-section">
		<div class="row">
			<div class="col-md-12 col-sm-12 col-xs-12 image-section">
				<img src="https://i.imgur.com/gDgAFWN.jpg">
			</div>
			<div class="row user-left-part">
				<div class="col-md-3 col-sm-3 col-xs-12 user-profil-part pull-left">
					<div class="row ">
						<div
							class="col-md-12 col-md-12-sm-12 col-xs-12 user-image text-center">
							<img
								src="http://nicesnippets.com/demo/1499344631_malecostume.png">
						</div>
						<div
							class="col-md-12 col-sm-12 col-xs-12 user-detail-section1 text-center">
							
							
								<h1 >${user.username }</h1>
							
						</div>
						<div class="row user-detail-row">
							<div class="col-md-12 col-sm-12 user-detail-section2 pull-left">
								<div class="border"></div>
								<p>Full Name</p>
								<span> ${user.firstName} ${user.lastName}</span>
							</div>
							<div class="col-md-12 col-sm-12 user-detail-section2 pull-right">
								<div class="border"></div>
								<p>Garden</p>
								<span>Name of Garden</span>
							</div>
							<div class="col-md-12 user-detail-section2">
								<div class="border"></div>
								<p>Email</p>
								<span>${user.email} </span>
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
										<div style="background-color: white" >
											<table class="table table-hover table-responsive">


												<thead>
													<tr>
														<th></th>
														<th></th>
														<th></th>
														<th></th>
														<th>ID</th>
														<th>Garden</th>
														<th>Name</th>
														<th>Quantity</th>
														<th>Unit</th>
														<th></th>
														<th></th>
														<th></th>
														<th></th>
														<th></th>
														<th></th>
														<th></th>
														<th>Edit</th>
														<th>Delete</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach items="${ user.plots}" var="campsite">


														<c:choose>
															<c:when test="${user.plots == null }">
																<strong style="padding-left: 35em; color: red"></strong>
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
																	<td id="f1">${user.username }</td>
																	<td id="f1">${ user.lastName}</td>
																	<td id="l1">${ user.lastName}</td>
																	<td id="m1">${ user.lastName}</td>
																	<td id="m2">${ user.lastName}</td>
																	<td></td>
																	<td></td>
																	<td></td>
																	<td></td>
																	<td></td>
																	<td></td>
																	<td></td>


																	<td>
																		<button type="submit" data-toggle="modal"
																			value=${ user.id} name="campsite"
																			data-target="#edit2" data-uid="2"
																			class="update btn btn-info btn-sm">
																			<span class="glyphicon glyphicon-pencil"></span>
																		</button>
																	</td>
																	<td>
																		<!-- DELETE BUTTON -->

																		<button data-target="#delete" value=${ user.id}
																			type="submit" data-toggle="modal" data-uid="1"
																			class="delete btn btn-danger btn-sm" name="id"
																			value=${ user.id}>

																			<span class="glyphicon glyphicon-trash"></span>

																		</button>

																	</td>


																</tr>

															</c:otherwise>
														</c:choose>
													</c:forEach>
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