<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<style><%@include file="/WEB-INF/resourcesStyle.css"%></style>
<link href="resourcesStyle.css" rel="stylesheet" type="text/css">

<title>Community Garden Resources</title>
</head>

<body>
	<jsp:include page="navbar.jsp" />
	<br>
	<br>
	<h1>Gardening Resources</h1>
  <div class="row ml-0 mr-0">
      <div class="col-md-6 pr-0">
          <div class="card padding">
              <img class="card-img" src="images/communitygarden1.jpg" alt="Community Garden" style="width:650px;height:450px;">
              <div class="card-img-overlay d-flex align-items-center justify-content-center flex-column">
                  <h2>Community Gardens</h2>
                  <p>Where people and plants come together</p>
                  <a href="https://cdn.shopify.com/s/files/1/0145/8808/4272/files/A3905-01.pdf" class="btn" target="_blank">Read More</a>
									<hr/>
							</div>
          </div>
      </div>
      <div class="col-md-6 pl-0">
          <div class="card">
              <img class="card-img" src="images/soil.jpeg" alt="Grow" style="width:650px;height:450px;">
              <div class="card-img-overlay d-flex align-items-center justify-content-center flex-column">
                  <h2>Grow!</h2>

                  <p>Planting Calendar For Denver, CO</p>
                  <a href="https://www.almanac.com/gardening/planting-calendar/CO/Denver" class="btn" target="_blank">Read More</a>
									<hr/>
							</div>
          </div>
      </div>
      <div class="col-md-3 pr-0 first">
          <div class="card padding ">
              <img class="card-img" src="images/thrivegarden.jpeg" alt="" style="width:300px;height:400px;">
              <div class="card-img-overlay">
                  <h3>15 ways to help your community garden thrive!</h3>
                  <a href="https://learn.eartheasy.com/articles/15-ways-to-help-your-community-garden-thrive/" class="btn" target="_blank">Thrive!</a>
              </div>
          </div>
      </div>

      <div class="col-md-3 pl-0 pr-0">
          <div class="card">
              <img class="card-img" src="images/freshfruit.jpeg" alt="Fresh Fruit" style="width:400px;height:400px;">
              <div class="card-img-overlay">
                  <h3>Fresh Vegetables - How long do fresh vegetables last?</h3>
                    <a href="http://www.eatbydate.com/vegetables/fresh-vegetables/" class="btn" target="_blank">Stay Fresh!</a>
              </div>
          </div>
      </div>

      <div class="col-md-3 pl-0 pr-0">
          <div class="card">
              <img class="card-img" src="images/rottenlemons.jpg" alt="Check Spoil" style="width:400px;height:400px;">
              <div class="card-img-overlay">
                  <h3>Check if vegetables are spoiled</h3>
                    <a href="https://www.wikihow.com/Check-if-Vegetables-Are-Spoiled" class="btn" target="_blank">Spoiled!</a>
              </div>
          </div>
      </div>
      <div class="col-md-3 pl-0 last">
          <div class="card">
              <img class="card-img" src="images/fruittray.jpg" alt="Calender" style="width:300px;height:400px;">
              <div class="card-img-overlay">
                  <h3>Garden Planting Calendar</h3>
                  <a href="https://www.growinggardens.org/assets/colorado%20local%20planting%20calendar.doc" class="btn" target="_blank">Click Here!</a>
              </div>
          </div>
      </div>
  </div>
	<br>
	<br>
</body>
</html>
