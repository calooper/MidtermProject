<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Community Garden Resources</title>
</head>
<body>
	<jsp:include page="navbar.jsp" />
  <div class="row ml-0 mr-0">
      <div class="col-md-6 pr-0">
          <div class="card">
              <img class="card-img" src="communitygarden1.jpg" alt="">
              <div class="card-img-overlay d-flex align-items-center justify-content-center flex-column">
                  <p>COMMUNITY GARDENS</p>
                  <hr />
                  <h2>Where people and plants come together</h2>
                  <a href="https://cdn.shopify.com/s/files/1/0145/8808/4272/files/A3905-01.pdf" class="btn">READ MORE</a>
              </div>
          </div>
      </div>
      <div class="col-md-6 pl-0">
          <div class="card">
              <img class="card-img" src="assets/images/right-img.jpg" alt="">
              <div class="card-img-overlay d-flex align-items-center justify-content-center flex-column">
                  <p>GROW</p>
                  <hr />
                  <h2>Planting Calendar For Denver, CO</h2>
                  <a href="https://www.almanac.com/gardening/planting-calendar/CO/Denver" class="btn">READ MORE</a>
              </div>
          </div>
      </div>

      <div class="col-md-3 pr-0 first">
          <div class="card">
              <img class="card-img" src="thrivegarden.jpeg" alt="">
              <div class="card-img-overlay">
                  <h5>Thrive</h5>
                  <a href="https://learn.eartheasy.com/articles/15-ways-to-help-your-community-garden-thrive/" class="btn">READ MORE</a>
              </div>
          </div>
      </div>

      <div class="col-md-3 pl-0 pr-0">
          <div class="card">
              <img class="card-img" src="freshfruitcopy.jpeg" alt="">
              <div class="card-img-overlay">
                  <h5>Keep it Fresh</h5>
                    <a href="http://www.eatbydate.com/vegetables/fresh-vegetables/" class="btn">READ MORE</a>
              </div>
          </div>
      </div>

      <div class="col-md-3 pl-0 pr-0">
          <div class="card">
              <img class="card-img" src="rottenlemons.jpeg" alt="">
              <div class="card-img-overlay">
                  <h5>Spoil Check</h5>
                    <a href="https://www.wikihow.com/Check-if-Vegetables-Are-Spoiled" class="btn">READ MORE</a>
              </div>
          </div>
      </div>

      <div class="col-md-3 pl-0 last">
          <div class="card">
              <img class="card-img" src="fruittraycopy.jpeg" alt="">
              <div class="card-img-overlay">
                  <h5>Calender</h5>
                  <a href="https://www.growinggardens.org/assets/colorado%20local%20planting%20calendar.doc" class="btn">READ MORE</a>
              </div>
          </div>
      </div>
  </div>

</header>

<div class="container-fluid video-player">
  <div class="container">
      <div class="screen embed-responsive embed-responsive-16by9">
          <iframe id="screen" src="https://www.youtube.com/watch?v=TWSlrRo2Ddw" frameborder="0"
              allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
              allowfullscreen></iframe>
      </div>

      <div class="play-list">
          <div class="owl-carousel owl-carousel4 owl-theme">
              <div>
                  <div class="card"> <img class="card-img link-img"
                          data-link="https://www.youtube.com/watch?v=kueifr5Ve8Q" src="assets/images/play1.png"
                          alt="">
                  </div>
              </div>
              <div>
                  <div class="card"> <img class="card-img link-img"
                          data-link="https://www.youtube.com/watch?v=ILDnpeCELeY" src="assets/images/play2.png"
                          alt="">
                  </div>
              </div>

          </div>
      </div>
</body>
</html>
