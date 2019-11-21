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
				<!-- <img src="https://i.imgur.com/gDgAFWN.jpg"> -->
			</div>
			<br><br>

			<div class="col-md-12">
				<div class="row">
					<div class="col-md-10  profile-tag-section text-center">
						<div class="row">
							<div style="background-color: white">
								<h2><b>Cart</b></h2>
								<table class="table table-hover table-responsive">
									<thead>
										<tr>
											<th></th>
											<th></th>
											<th></th>
											<th></th>
											<th>Cart ID#</th>
											<th>Produce</th>	
											<th>Unit</th>
											<th>Harvest Date</th>
											<th>Use by Date</th>
											<th>Available</th>
											<th>Seller</th>
											<th></th>
											<th></th>
											<th></th>
											<th></th>
											<th></th>
											<th>Delete</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="c" items="${allCartItems}">
											<c:choose>
												<c:when test="${empty allCartItems}">
													<strong style="padding-left: 35em; color: red">No
														items in cart</strong>
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
														<td id="l1">${c.item.produce.name}</td>
														<td id="m2">${c.item.unit}</td>
														<td id="m1">${c.item.harvestDate}</td>
														<td id="m2">${c.item.useByDate}</td>
														<td id="m2">${c.item.available}</td>
														<td id="m2"><a class="button" href="findUserById.do?userId=${c.item.user.id }">${c.item.user.username}</a></td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>

														
														<td>
															<!-- DELETE BUTTON -->
															<form action="removeCartItem.do" method="POST">
															<input type=hidden class=“form-control” name=“cartItem” value=“${c.id}”>
																<button data-target="#delet" value=${ c.id}
																	type="submit" data-toggle="modal" data-uid="1"
																	class="delete btn btn-danger btn-sm" name="cartItem"
																	value=${ c.id}>
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
																		name="itemId" value=${ c.item.id}>
																		<button type="submit" id="del" class="btn btn-danger "
																			data-dismiss="modal" value=${ c.item.id}>Delete</button>
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