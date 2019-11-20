<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>


<style>
/* Set the size of the div element that contains the map */
#map {
	height: 400px; /* The height is 400 pixels */
	width: 100%; /* The width is the width of the web page */
}
</style>


<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


	<!--The div element for the map -->
	<div id="map"></div>
	<script>
// Initialize and add the map
  function initMap() {
  // The location of Uluru
  var SyracuseCommunityGarden = {lat: 39.638323, lng: -104.900165};

  var SamuelCommunityGarden = {lat: 39.644277, lng: -104.891570};

  var MooseMeadowsCommunityGarden = {lat: 39.647944, lng: -104.911719};

  var FirstPlymouthChurchCommunityGarden = {lat: 39.652261, lng: -104.941615};

  var EnglewoodCommunityGarden = {lat: 39.660520, lng: -104.995016};

  var DUBridgeCommunityGarden = {lat: 39.674406, lng: -104.963923};
  // The map, centered at Uluru
  var map = new google.maps.Map(
      document.getElementById('map'), {zoom: 12, center: DUBridgeCommunityGarden});
  // The marker, positioned at Uluru
  var marker = new google.maps.Marker({position: SyracuseCommunityGarden, map: map, label: "Syracuse"});
  var marker2 = new google.maps.Marker({position: SamuelCommunityGarden, map: map, label: "Samuel"});
  var marker3 = new google.maps.Marker({position: MooseMeadowsCommunityGarden, map: map, label: "Moose Meadows"});
  var marker4 = new google.maps.Marker({position: FirstPlymouthChurchCommunityGarden, map: map, label: "Plymouth Church"});
  var marker5 = new google.maps.Marker({position: EnglewoodCommunityGarden, map: map, label: "Englewood"});
  var marker6 = new google.maps.Marker({position: DUBridgeCommunityGarden, map: map, label: "DU Bridge"});

  
  	marker.addListener('click', function() {
		/* window.location.href = 'gardenProfile.jsp' */
	  	/* window.location.replace("http://stackoverflow.com"); */
	  	window.location.replace("findGardenById.do?gardenId=1");
	  	/* document.location.href = "findGardenById.do?gardenId=1"; */
	})
	  marker2.addListener('click', function() {
	  	window.location.replace("findGardenById.do?gardenId=2");
	})
	  marker3.addListener('click', function() {
	  	window.location.replace("findGardenById.do?gardenId=3");
	})
	  marker4.addListener('click', function() {
	  	window.location.replace("findGardenById.do?gardenId=4");
	})
	  marker5.addListener('click', function() {
	  	window.location.replace("findGardenById.do?gardenId=5");
	})
	  marker6.addListener('click', function() {
	  	window.location.replace("findGardenById.do?gardenId=6");
	})
};


    </script>
	<!--Load the API from the specified URL
    * The async attribute allows the browser to render the page while the API loads
    * The key parameter will contain your own API key (which is not needed for this tutorial)
    * The callback parameter executes the initMap() function
    -->



	<script async defer
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBXFCz7g6nw2SaTNO051P1AGYJk0RjWdkw&callback=initMap">
    </script>



	<script
		google.maps.event.addListener(SyracuseCommunityGarden, 'click', function() {
    window.location.href='www.google.com'>
    </script>








</body>
</html>