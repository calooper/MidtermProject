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
								
								
						<!--  Edit Profiel Button-->
						<p>Edit Profile </p>
							<button type="submit" data-toggle="modal"
								value=${ i.id} name="itemId"
								data-target="#editProfile" data-uid="2"
								class="update btn btn-success btn-sm">
								<span class="glyphicon glyphicon-pencil"></span>
			
							</button>
								
								
								
								
								
								<!--  Edit Profile Modal Pop-Up-->
																		<div id="editProfile" class="modal fade" role="dialog">
																			<div class="modal-dialog">
																				<div class="modal-content">

																					<div class="modal-header">
																						<button type="button" class="close" data-dismiss="modal"></button>
																						<h4 class="modal-title">Edit Profile</h4>
																					</div>


																					<form action="updateUser.do" method="POST">
																						<div class="modal-body">

																							<input type="hidden" class="form-control" name="oldUserId" value="${user.id}"  required>
																							
																							<input type="hidden" class="form-control" name="password" value="${user.password}"  required>

																							<input type="hidden" class="form-control" name="username" value="${user.username}"  required>
																							
																							<input type="text" class="form-control" name="email"  placeholder="${user.email}" required>

																							<input type="text" class="form-control" name="lastName"  placeholder="${user.lastName}">

																							<input type="text" class="form-control" name="firstName"  placeholder="${user.firstName}">											


																						</div>


																						<div class="modal-footer">
																							<button type="submit" class="btn btn-warning" class="form-control">Update</button>

																							<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
																						</div>

																					</form>
																				</div>
																			</div>
																		</div>
									
								
								
								
								
								
								
								
								

						</div>
						<div class="row user-detail-row">
							<div class="col-md-12 col-sm-12 user-detail-section2 pull-left">
								<div class="border"></div>
								<p>Full Name</p>
								<span> ${user.firstName} ${user.lastName}</span>
							</div>
							<div class="col-md-12 col-sm-12 user-detail-section2 pull-right">
								<div class="border"></div>
								<p>Gardens</p>

								<c:forEach var="g" items="${gardens}">
								<span>${g.name}</span>
								</c:forEach>



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
								<div class="col-md-10  profile-tag-section text-center">
									<div class="row">
										<div style="background-color: white" >
											<table class="table table-hover table-responsive">


												<thead>
													<tr>
														<th></th>
														<th></th>
														<th></th>
														<th></th>
														<th></th>
														<th> Item ID</th>
														<th> Produce</th>
														<th> Quantity</th>
														<th> Unit</th>
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
													<c:forEach var="i" items="${itemsList}">

														<c:choose>
															<c:when test="${empty itemsList}">
																<strong style="padding-left: 35em; color: red">No items from this users garden</strong>
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
																	<td id="f1">${i.id}</td>
																	<td id="l1">${i.produce.name}</td>
																	<td id="m1">${i.quantity}</td>
																	<td id="m2">${i.unit}</td>
																	<td></td>
																	<td></td>
																	<td></td>
																	<td></td>
																	<td></td>
																	<td></td>
																	<td></td>

																	<!-- EDIT BUTTON -->
																	<td>
																		<button type="submit" data-toggle="modal"
																			value=${ i.id} name="itemId"
																			data-target="#edit2" data-uid="2"
																			class="update btn btn-info btn-sm">
																			<span class="glyphicon glyphicon-pencil"></span>


																		</button>
																		<div id="edit2" class="modal fade" role="dialog">
																			<div class="modal-dialog">
																				<div class="modal-content">

																					<div class="modal-header">
																						<button type="button" class="close" data-dismiss="modal"></button>
																						<h4 class="modal-title">Edit an Item</h4>
																					</div>


																					<form action="updateItem.do" method="POST">
																						<div class="modal-body">

																							<input type="hidden" class="form-control" name="user.id" value="${user.id}"  required>

																							<input type="hidden" class="form-control" name="oldItemId" value="${i.id}" placeholder="Item Id" required>

																							<input type="text" class="form-control" name="quantity" value="${i.quantity}" placeholder="Quantity" required>

																							<input type="text" class="form-control" name="unit" value="${i.unit}" placeholder="Unit">

																							 <input type="radio" name="available" value="true"> Available<br>
																					 <input type="radio" name="available" value="false"> Not Available<br>


																						</div>


																						<div class="modal-footer">
																							<button type="submit" class="btn btn-warning" class="form-control">Update</button>

																							<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
																						</div>

																					</form>
																				</div>
																			</div>
																		</div>
																	</td>
																	<td>
																		<!-- DELETE BUTTON -->
 																		<form action="destroyItem.do" method="POST" name="itemId" value=${ i.id}>
																			<button data-target="#delet" value=${ i.id}
																				type="submit" data-toggle="modal" data-uid="1"
																				class="delete btn btn-danger btn-sm" name="itemId"
																				value=${ i.id}>
																			<span class="glyphicon glyphicon-trash"></span>
																		</button>
  																		</form>
																	</td>
																</tr>





<!-- DELETE POP UP -->

  <div id="delete" class="modal fade" role="dialog">
  	<div class="modal-dialog">
  		<div class="modal-content">
  			<div class="modal-header">
  				<button type="button" class="close" data-dismiss="modal"></button>
  				<h4 class="modal-title">Delete Item</h4>
  			</div>
  			<div class="modal-body">
  				<strong>Are you sure you want to delete this item?</strong>
  			</div>

  			<div class="modal-footer">
  			  		<form action="destroyItem.do" method="POST" name="itemId" value=${ i.id}>
  				<button type="submit" id="del" class="btn btn-danger "data-dismiss="modal" value=${ i.id}>Delete</button>
  					</form>
  				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>

  			</div>

  		</div>
  	</div>
  </div>

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


  <!--  ADD A  ITEM POP_UP MENU-->
  <div id="edit" class="modal fade" role="dialog">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal"></button>
          <h4 class="modal-title">Add an Item </h4>
        </div>


        <form action="createItem.do" method="POST">
          <div class="modal-body">
            
            <input type="hidden" class="form-control" name="user.id" value="${user.id}"  required>
            
            <input type="number" placeholder="Quantity" class="form-control" name="quantity" >
            
            <input type="text" placeholder="Unit" class="form-control" name="unit" >
            
            Select Produce Type:
            <select name="produce.id">
			  <option value="1">Potato</option>
			  <option value="2">Corn</option>
			  <option value="3">Strawberry</option>
			  <option value="4">Broccoli</option>
			  <option value="5">Tomato</option>
			  <option value="6">Cucumber</option>
			  <option value="7">Pear</option>
			  <option value="8">Orange</option>
			  <option value="9">Bell Pepper</option>
			  <option value="10">Garlic</option>
			  <option value="11">Apple</option>
			  <option value="12">Radish</option>
			  <option value="13">Grape</option>
			  <option value="14">Banana</option>
			  <option value="15">Cabbage</option>
			  <option value="16">Onion</option>
			  <option value="17">Carrot</option>
			</select> 
            
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
