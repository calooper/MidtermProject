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
<title>Items</title>
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
														<th>Name</th>
														<th>Quantity</th>
														<th>Unit</th>
														<th>Seller</th>
														<th>Date Harvested</th>
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
													<c:forEach var="i" items="${itemList}">

														<c:choose>
															<c:when test="${empty itemList}">
																<strong style="padding-left: 35em; color: red">No items found.</strong>
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
																	<td id="f1">${i.produce.name}</td>
																	<td id="f1">${i.quantity}</td>
																	<td id="l1">${i.unit}</td>
																	<td id="m1">${i.user.username}</td>
																	<td id="m2">${i.harvestDate}</td>
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

													<tr id="d2">

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


  <!--  ADD A  SITE POP_UP MENU-->
  <div id="edit" class="modal fade" role="dialog">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal"></button>
          <h4 class="modal-title">Add an Item </h4>
        </div>


        <form action="addCampsite.do" method="POST">
          <div class="modal-body">
            <input type="text" class="form-control" name="description" placeholder="Description" required>

            <input type="text" class="form-control" name="state" placeholder="State">

            <input type="text" class="form-control" name="mountainRange" placeholder="Moutain Range" required>

            <input type="number" step="0.000001" class="form-control" name="latitude" placeholder="Latitude in Decimal Degrees" required>

            <input type="number" step="0.000001" class="form-control" name="longitude" placeholder="Longitude in Decimal Degrees" required>
          </div>


          <div class="modal-footer">
            <button type="submit" class="btn btn-warning" class="form-control">Update</button>

            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
          </div>

        </form>
      </div>
    </div>
  </div>

  <!-- Edit a site pop-up menu  -->

  <div id="edit2" class="modal fade" role="dialog">
    <div class="modal-dialog">
      <div class="modal-content">

        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal"></button>
          <h4 class="modal-title">Edit an Item</h4>
        </div>


        <form action="editCampsite.do" method="GET">
          <div class="modal-body">
            <input type="number" class="form-control" name="id" placeholder="Id" required>

            <input type="text" class="form-control" name="description" placeholder="Description" required>

            <input type="text" class="form-control" name="state" placeholder="State">

            <input type="text" class="form-control" name="mountainRange" placeholder="Moutain Range" required>


          </div>


          <div class="modal-footer">
            <button type="submit" class="btn btn-warning" class="form-control">Update</button>

            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
          </div>

        </form>
      </div>
    </div>
  </div>


<!-- DELETE POP UP -->

  <div id="delete" class="modal fade" role="dialog">
  	<div class="modal-dialog">
  		<div class="modal-content">
  			<div class="modal-header">
  				<button type="button" class="close" data-dismiss="modal"></button>
  				<h4 class="modal-title">Delete Data</h4>
  			</div>
  			<div class="modal-body">
  				<strong>Are you sure you want to delete this data?</strong>
  			</div>
  		<form action="deleteCampsite.do" method="GET" name="id" value=${ campsite.id}>
  			<div class="modal-footer">
  				<button type="submit" id="del" class="btn btn-danger "
  					data-dismiss="modal" value=${ campsite.id}>Delete</button>
  				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
  			</div>
  			  </form>
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
		</div>
</body>
</html>