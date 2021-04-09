/**
 * 
 */

var api_key = "b9540b392fb0493c963e4b00ad293087";
var eddate = getFormatDate(new Date());
var fcltynm = "";

$(document)
	.ready(
		function() {

			fcltynm = document.getElementById("fcltynm").value;
			getPerformanceXML();
			getFacilityID();
		});

function getPerformanceXML() {
	
	// prfstate=02  -> 공연중 
	var url = "http://www.kopis.or.kr/openApi/restful/pblprfr?service=" + api_key +
	"&stdate=20160601&eddate="+ eddate +"&cpage=1&rows=10&prfstate=02&shprfnmfct=" + fcltynm;
	
	$.ajax({
		url: url,
		type: "GET",
		cache: false,
		success: function(data, status, xhr) {
			if (status == "success") {
				parsePerformanceXML(data);
			} else {
				alert('openAPI loading 실패 - 문의해주세요.');
			}
		}
	});
}

function getFacilityXML(mt10id) {

	var url = "http://www.kopis.or.kr/openApi/restful/prfplc/" + mt10id +"?service=" + api_key;
	
	// 공연시설목록
	$.ajax({
		url: url,
		type: "GET",
		cache: false,
		success: function(data, status, xhr) {
			//alert(xhr.status);
			if (status == "success") {
				parseFacilityXML(data);
			} else {
				alert('openAPI loading 실패 - 문의해주세요.');
			}

		}
	});
}

function getFacilityID() {
	
	var url = "http://www.kopis.or.kr/openApi/restful/prfplc?service=" + 
	api_key + "&cpage=1&rows=1&shprfnmfct=" + fcltynm;
	
	$.ajax({
		url: url,
		type: "GET",
		cache: false,
		success: function(data, status, xhr) {
			//alert(xhr.status);
			if (status == "success") {
				
				$(data).find("db").each(function() {
					mt10id =  $(this).find("mt10id").text();
					getFacilityXML(mt10id);
				});
					
			} else {
				alert('openAPI loading 실패 - 문의해주세요.');
			}

		}
	});
}


function parseFacilityXML(xmlDOM) {

	$(xmlDOM).find("db").each(function() {
		
		$("#theater_name").html("극장명 : " +  fcltynm);
		
		var hompage_url = $(this).find("relateurl").text();
	
		if (hompage_url == "") {
			$("#theater_homepage").html("● 홈페이지 제공 안함");
		} else {
			$("#theater_homepage").html("▷ " + hompage_url);
			document.getElementById("theater_homepage")
				.setAttribute("href", hompage_url);
		}

		$("#theater_num").html(
			"공연장 수 : " + $(this).find("mt13cnt").text());
		$("#theater_feature").html(
			"시설 특성 : " + $(this).find("fcltychartr").text());
		$("#theater_openyear").html(
			"개관 연도 : " + $(this).find("opende").text());
		$("#theater_seat_num").html(
			"객석 수 : " + $(this).find("seatscale").text());
		$("#theater_phone").html(
			"전화번호 : " + $(this).find("telno").text());
		$("#theater_addr").html(
			"주소 : " + $(this).find("adres").text());
		setMap($(this).find("la").text(), $(this).find("lo").text());
	});
}


function parsePerformanceXML(xmlDOM) {
	var img_url = "";
	var img = "";

	$(xmlDOM).find("db").each(function() {
		if(typeof $(this).find("poster") == undefined) {
			document.getElementById("poster_img").innerHTML = "<p style='font-weight:bold; font-size: large;'> 상영중인 작품이 없습니다. </p>";
		} else {
			img_url = $(this).find("poster").text();
			img += "<img src='" + img_url + "' style='width: 310px; height: 500px; max-height: 600px; margin-right:30px; margin-bottom:35px'>";
			document.getElementById("poster_img").innerHTML = img;
			img_url = "";
		}

	});
}


// google map 초기화
function initMap() {
	var mapProp = {
		center: new google.maps.LatLng(37.499558, 127.035861),
		zoom: 17
	}
	var map = new google.maps.Map(document.getElementById("googleMap"), mapProp);
}


function setMap(lat, lng) {

	var mapProp = {
		center: new google.maps.LatLng(lat, lng),
		zoom: 16
	}

	var map = new google.maps.Map(document.getElementById("googleMap"), mapProp);

	var marker = new google.maps.Marker({
		position: new google.maps.LatLng(lat, lng),
		map: map,
		animation: google.maps.Animation.BOUNCE
	});
}

function getFormatDate(date) {
	var year = date.getFullYear();
	var month = (1 + date.getMonth());
	month = month >= 10 ? month : '0' + month;
	var day = date.getDate();
	day = day >= 10 ? day : '0' + day;
	return year + '' + month + '' + day;
}

