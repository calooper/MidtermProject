<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cart</title>
</head>
<body>
	<jsp:include page="navbar.jsp" />

	<div class="container main-section">
		<div class="row">
			<div class="col-md-12 col-sm-12 col-xs-12 image-section">
				<img src="https://i.imgur.com/gDgAFWN.jpg">
			</div>

			<div class="col-md-12">
				<div class="row">
					<div class="col-md-10  profile-tag-section text-center">
						<div class="row">
							<div style="background-color: white">
								<table class="table table-hover table-responsive">

									<thead>
										<tr>
											<th></th>
											<th></th>
											<th></th>
											<th></th>

											<th>Cart #</th>
											<th>Produce</th>
											<th>Quantity</th>
											<th>Unit</th>
											<th>Harvest Date</th>
											<th>Use by Date</th>
											<th>Available</th>
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
										<c:forEach var="c" items="${itemsList}">

											<c:choose>
												<c:when test="${empty itemsList}">
													<strong style="padding-left: 35em; color: red">No
														items from this users garden</strong>
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
														<td id="f1">${c.id}</td>
														<td id="l1">${c.item.name}</td>
														<td id="m1">${i.quantity}</td>
														<td id="m2">${i.unit}</td>
														<td id="m2">${i.harvestDate}</td>
														<td id="m2">${i.useByDate}</td>
														<td id="m2">${i.available}</td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>

														<!-- EDIT BUTTON -->
														<td>
															<button type="submit" data-toggle="modal" value=${ i.id}
																name="itemId" data-target="#edit2" data-uid="2"
																class="update btn btn-info btn-sm">
																<span class="glyphicon glyphicon-pencil"></span>
															</button>
															<div id="edit2" class="modal fade" role="dialog">
																<div class="modal-dialog">
																	<div class="modal-content">

																		<div class="modal-header">
																			<button type="button" class="close"
																				data-dismiss="modal"></button>
																			<h4 class="modal-title">Edit an Item</h4>
																		</div>


																		<form action="updateItem.do" method="POST">
																			<div class="modal-body">

																				<input type="hidden" class="form-control"
																					name="user.id" value="${user.id}" required>

																				<input type="hidden" class="form-control"
																					name="oldItemId" value="${i.id}"
																					placeholder="Item Id"> <input type="text"
																					class="form-control" name="quantity"
																					value="${i.quantity}" placeholder="Quantity">

																				<input type="text" class="form-control" name="unit"
																					value="${i.unit}" placeholder="Unit"> <input
																					type="date" class="form-control"
																					name="harvestDateString" value="${i.harvestDate}"
																					placeholder="Harvest Date"> <input
																					type="date" class="form-control"
																					name="useByDateString" value="${i.useByDate}"
																					placeholder="Use by Date"> <input
																					type="radio" name="available" value="true">
																				Available<br> <input type="radio"
																					name="available" value="false"> Not
																				Available<br>


																			</div>


																			<div class="modal-footer">
																				<button type="submit" class="btn btn-warning"
																					class="form-control">Update</button>

																				<button type="button" class="btn btn-default"
																					data-dismiss="modal">Close</button>
																			</div>

																		</form>
																	</div>
																</div>
															</div>
														</td>
														<td>
															<!-- DELETE BUTTON -->
															<form action="destroyItem.do" method="POST" name="itemId"
																value=${ i.id}>
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
																	<button type="button" class="close"
																		data-dismiss="modal"></button>
																	<h4 class="modal-title">Delete Item</h4>
																</div>
																<div class="modal-body">
																	<strong>Are you sure you want to delete this
																		item?</strong>
																</div>

																<div class="modal-footer">
																	<form action="destroyItem.do" method="POST"
																		name="itemId" value=${ i.id}>
																		<button type="submit" id="del" class="btn btn-danger "
																			data-dismiss="modal" value=${ i.id}>Delete</button>
																	</form>
																	<button type="button" class="btn btn-default"
																		data-dismiss="modal">Close</button>

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
											<td><button type="submit" data-toggle="modal"
													data-target="#edit" data-uid="2"
													class="add btn btn-primary btn-sm">
													<span class="glyphicon glyphicon-plus" value="Submit Button"></span>
												</button></td>
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
</body>
</html>