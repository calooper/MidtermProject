<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
				<img src="img_girl.jpg" alt="Garden Picture"
		style="width: 200px; height: 300px;">
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
								<p>Size</p>
								<span>${garden.size_sqft}</span>
							</div>
							<div class="col-md-12 user-detail-section2">
								<div class="border"></div>
								<p>Address</p>
								<span>${garden.address.street}</span>
								<span>${garden.address.city},${garden.address.state} ${garden.address.zip}</span>
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
														<th>Plot ID</th>
														<th>Plot Number</th>
														<th>Size (Square Feet)</th>
														<th>Availability</th>
														<th>User</th>
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
													<c:forEach var="p" items="${plotsList}">

														<c:choose>
															<c:when test="${empty plotsList}">
																<strong style="padding-left: 35em; color: red">No plots in this garden</strong>
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
																	<td id="f1">${p.id}</td>
																	<td id="f2">${p.plot_number}</td>
																	<td id="l1">${p.produce.name}</td>
																	<td id="m1">${p.Availability}</td>
																	<td id="n1">${p.user.username}</td>
																	<td></td>
																	<td></td>
																	<td></td>
																	<td></td>
																	<td></td>
																	<td></td>
																	<td></td>
																	<td>

																	</td>


																</tr>

															</c:otherwise>
														</c:choose>
													</c:forEach>

													<tr id="d2">

          <td><input type="hidden" id="f1"></td>
          <td><input type="hidden" id="f1"></td>
          <td><input type="hidden" id="f1"></td>
          <td><input type="hidden" id="f2"></td>
          <td><input type="hidden" id="f2"></td>
          <td><input type="hidden" id="f2"></td>
          <td><input type="hidden" id="l2"></td>
          <td><input type="hidden" id="m1"></td>
          <td><input type="hidden" id="m2"></td>
          <td><input type="hidden" id="m2"></td>
          <td><input type="hidden" id="m2"></td>
          <td><input type="hidden" id="m2"></td>
          <td><input type="hidden" id="m2"></td>
          <td><input type="hidden" id="m2"></td>
          <td><input type="hidden" id="m2"></td>
          <td><input type="hidden" id="m2"></td>
          <td><input type="hidden" id="m2"></td>
          <td><input type="hidden" id="m2"></td>




          <td>
          <td><strong>Add</strong></td>
          <td><button type="submit" data-toggle="modal" data-target="#edit" data-uid="2" class="add btn btn-primary btn-sm">
              <span class="glyphicon glyphicon-plus" value="Submit Button"></span>
            </button></td>
          </td>
        </tr>
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
		</div>
</body>
</html>
