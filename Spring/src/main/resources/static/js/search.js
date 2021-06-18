// AIzaSyAr3X1JBnC3e4b_CAJqGSd81q6OY_ex8Hc
var multi = {lat: 37.5012743, lng: 127.039585};
var map;
var markers = [];
var infoWindow;

function initMap() {
	map = new google.maps.Map(document.getElementById('map'), {
		center: multi, zoom: 15
	});
	
	infoWindow = new google.maps.InfoWindow;
	
//	const myposition = "img/my_position.png";
//	
//	var multimarker = {
//			coords: multi,
//			iconImage: myposition,
//			content: '멀티캠퍼스(역삼)'
//	};
//	addMarker(multimarker);
//	infoWindow.setPosition(multi);
//	infoWindow.setContent('멀티캠퍼스.');
//	infoWindow.open(map);
	
}


//function handleLocationError(browserHasGeolocation, infoWindow, pos) {
//	infoWindow.setPosition(pos);
//	infoWindow.setContent(browserHasGeolocation ?
//		'Error: Geolocation 서비스 실패.' :
//		'Error: Geolocation을 지원하지 않는 브라우저.');
//	infoWindow.open(map);
//}

function addMarker(lat, lng) {
//	alert("!!!");
	var props = new google.maps.LatLng(lat, lng);
	const marker = new google.maps.Marker({
		position: new google.maps.LatLng(parseFloat(lat),parseFloat(lng)),
		map: map
	});
	map.setCenter(marker.getPosition());
	map.setZoom(15);
	
	if(props.iconImage){
		marker.setIcon(props.iconImage);
	}

	if(props.content){
		infoWindow = new google.maps.InfoWindow({
			content:props.content
		});

	}
	
	marker.addListener('click', function() {
		map.setZoom(17);
		map.setCenter(marker.getPosition());
		bounceMarker(marker);
	});
	markers.push(marker);
	setMapOnAll(map);
}

function bounceMarker(marker) {
	if (marker.getAnimation() !== null) {
		marker.setAnimation(null);
	} else {
		marker.setAnimation(google.maps.Animation.BOUNCE);
	}
}

function deleteMarkers() {
	clearMarkers();
	markers = [];
}

function clearMarkers() {
	setMapOnAll(null);
}

function setMapOnAll(map) {
	for (let i = 0; i < markers.length; i++) {
		markers[i].setMap(map);
	}
}
