var mtid = "";
// 페이지 최초 로딩 
$(document).ready(function() {
	loadPage(pfid);
	
    $("#facbutton").click(function(){
    	$("#facbutton").css('background-color','black');
    	$("#facbutton").css('color','white');
    
		$("#introbutton").css('background-color','white');
    	$("#introbutton").css('color','black');
		
		$("#introimg").hide();
		facPage(mtid);
		
		
		$("#faclity").show();
		
    });
    
	$("#introbutton").click(function(){
    	$("#introbutton").css('background-color','black');
    	$("#introbutton").css('color','white');
    
		$("#facbutton").css('background-color','white');
    	$("#facbutton").css('color','black');

		$("#introimg").show();
		$("#faclity").hide();
    });
	
	
});

function loadPage(pid) {
	$.ajax({
        url : "http://www.kopis.or.kr/openApi/restful/pblprfr/" + pid
			  + "?service=de93ee9825c24143a98506d9e7f616bd",
        type : "GET",
        cache : false,
        success : function(data, status){
            if(status == "success"){
				showDetail(data);
            }
        }
    });  // end $.ajax()
}

function showDetail(xmlDOM) {
	
	var table = "";
	
	table += "<tr><th>공연기간</th><td class='td0'>"
	table += $(xmlDOM).find("prfpdfrom").text() + " ~ " + $(xmlDOM).find("prfpdto").text() + "</td>";
	
	table += "<tr><th>공연장소</th><td class='td0'>"
	table += $(xmlDOM).find("fcltynm").text()
	
	table += "<tr><th>공연시간</th><td class='td0'>"
	table += $(xmlDOM).find("dtguidance").text()
	
	table += "<tr><th>관람연령</th><td class='td0'>"
	table += $(xmlDOM).find("prfage").text()
	
	table += "<tr><th>티켓가격</th><td class='td0'>"
	table += $(xmlDOM).find("pcseguidance").text()
	
	table += "<tr><th>출연진</th><td class='td0'>"
	table += $(xmlDOM).find("prfcast").text()
	
	table += "<tr><th>제작진</th><td class='td0'>"
	table += $(xmlDOM).find("prfcrew").text()
	
	table += "<tr><th>기획·제작</th><td class='td0'>"
	table += $(xmlDOM).find("entrpsnm").text()
	
	$(xmlDOM).find("styurl").each(function() {
		t = "<img src='" + $(this).text() + "'>";
		$("#introimg").html($("#introimg").html() + t);
	})
	mtid = $(xmlDOM).find("mt10id").text();
		
	$("#demoXML").html(table);
}

function facPage(mt) {
	$.ajax({
        url : "http://www.kopis.or.kr/openApi/restful/prfplc/" + mt
			  + "?service=de93ee9825c24143a98506d9e7f616bd",
        type : "GET",
        cache : false,
        success : function(data, status){
            if(status == "success"){
				facDetail(data);
            }
        }
    });  // end $.ajax()
}

function facDetail(xmlDOM) {
	//var table = "";	
	alert($(xmlDOM).find("fcltynm").text());
	$('#facname').html($(xmlDOM).find("fcltynm").text());
}
