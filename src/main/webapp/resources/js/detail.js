
// 페이지 최초 로딩 
$(document).ready(function() {
	loadPage(pfid);
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
	
	$("#demoXML").html(table);
}
