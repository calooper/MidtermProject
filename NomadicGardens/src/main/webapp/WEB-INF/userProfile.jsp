<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<link href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css" rel="stylesheet">

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
					
							<button type="submit" data-toggle="modal"
								value=${ i.id} name="itemId"
								data-target="#editProfile" data-uid="2"
								class="update btn btn-success btn-sm">

								Edit Profile
								<span class="glyphicon glyphicon-edit" ></span>
			
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

																							 <input type="text" class="form-control" name="firstName"  placeholder="${user.firstName}">
																							
																							 <input type="text" class="form-control" name="lastName"  placeholder="${user.lastName}">


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
								<p>Email User</p>
								<a href="mailto:${user.email}" target="_blank" class="btn btn-info">${user.email}</a>
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
												
														<th> Item#</th>
														<th> Produce</th>
														<th> Quantity</th>
														<th> Unit</th>
														<th> Harvest Date </th>
														<th> Use by Date  </th>
														<th> Available</th>
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
																
																	<td id="f1">${i.id}</td>
																	<td id="l1">${i.produce.name}</td>
																	<td id="m1">${i.quantity}</td>
																	<td id="m2">${i.unit}</td>
																	<td id="m2">${i.harvestDate}</td>
																	<td id="m2">${i.useByDate} </td>
																	<td id="m2">${i.available}</td>
																	<td></td>
																	<td></td>
																	<td></td>
																	<td></td>
																	<td></td>
																	
																	
																	
																	

																	<!-- EDIT BUTTON -->
																	<td>
																		<button type="button" data-toggle="collapse"
																			value=${ i.id} name="itemId" aria-expanded="false" aria-controls="collapseExample" data-target="#collapseExample"" 
																			class="update btn btn-info btn-sm">
																			<span class="glyphicon glyphicon-pencil"></span>
																		</button>
			
			
																
																	<!-- / Collapse buttons -->
																	
																	<!-- Collapsible element -->
																	<div class="collapse" id="collapseExample">
																	  <div class="mt-3">
		
																					<form action="updateItem.do" method="POST">
																					
																						<div style="float:left;">
																								
																							<div class="col-md-6">
																								<input type="hidden" class="form-control" name="user.id" value="${user.id}"  required>
																							</div>
																							
																							<div class="col-md-6">
																							<input type="hidden" class="form-control" name="oldItemId" value="${i.id}" placeholder="Item Id" >
																							</div>
																							
																							<input type="text" class="form-control" name="quantity" value="${i.quantity}" placeholder="Quantity" >

																							<input type="text" class="form-control" name="unit" value="${i.unit}" placeholder="Unit">
																							
																							<input type="date" class="form-control" name="harvestDateString" value="${i.harvestDate}" placeholder="Harvest Date">
																							
																							<input type="date" class="form-control" name="useByDateString" value="${i.useByDate}" placeholder="Use by Date"> 
																							
																							
																							<input id="abc" type="checkbox" checked data-toggle="toggle"  name="available" data-on="Available" data-off="Not Available"  data-width="100%" data-onstyle="success" data-offstyle="danger">
																							
																							
																							<script>
																							$('#abc').prop('checked')
																							
																							
																							$('.toggle').bootstrapToggle({
																							    on: 'Y',
																							    off: 'N',
																							
																							});
																							</script>
																							<!-- <input type="radio" name="available" value="true"> Available<br>
																					 		<input type="radio" name="available" value="false"> Not Available<br> -->


																						</div>
																						<div>
																						&nbsp
																						</div>


																						<div class="modal-footer">
																						<br>
																							<button type="submit"  class="btn btn-warning btn-block" class="form-control">Update</button>

																							
																						</div>

																					</form> 
		

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

            <input type="number" placeholder="Quantity" class="form-control" name="quantity" required>

            <input type="text" placeholder="Unit" class="form-control" name="unit" required>

            
            <input type="date" class="form-control" name="harvestDateString" value="${i.harvestDate}" placeholder="Harvest Date" required>
																							
			<input type="date" class="form-control" name="useByDateString" value="${i.useByDate}" placeholder="Use by Date" required> 

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
		
		
		
		
		
		
		
		
		
		<div id="editform" class="collapse">
                    <form action="updateGame.do" method="POST" modelAttribute="game">
                        <div class="form-group">
                              <input type="hidden" name="oldGameId" value="${game.id }">
                                <label >Title: </label><input type="text" name="title"value="${game.title }" required> <br />
                                <label>Developer: </label> <input type="text" name="developer" value="${game.developer }"> <br />
                                <label>Publisher: </label> <input type="text" name="publisher" value="${game.publisher }"> <br />
                                <label>Description: </label> <input type="text" size="60" name="description" value="${game.description }"> <br />
                                <label>Select ESRB Rating:</label>
                                <select name="esrbRating">
                                    <option value="RP">RP</option>
                                    <option value="eC">eC</option>
                                    <option value="E">E10+</option>
                                    <option value="T">T</option>
                                    <option value="M">M</option>
                                    <option value="AO">AO</option>
                                </select> <br />
                                <label>Metacritic Score: </label> <input type="text" name="metacriticScore" value="${game.metacriticScore }"pattern="^[1-9][0-9]?$|^100$" required> <br />
                                <label>Release Date: </label> <input type="text" name="releaseDate" value="${game.releaseDate }"pattern="(?:19|20)[0-9]{2}-(?:(?:0[1-9]|1[0-2])-(?:0[1-9]|1[0-9]|2[0-9])|(?:(?!02)(?:0[1-9]|1[0-2])-(?:30))|(?:(?:0[13578]|1[02])-31))" required> <br />
                                <label>Cover Art URL: </label> <input type="text" name="boxartURL" value="${game.boxartURL }"> <br />
                                <input type="submit" value="Update Game Info">
                                </div>
                            </form>
                    </div>

		
		
		
		
		
		
		
		
		
	<script src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>	
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>	
		
		
		
</body>
</html>
