var viewrow = 2;
var viewnum = 6;
// 페이지 최초 로딩 
$(document).ready(function() {
	loadPage();
	
    $("#but").click(function(){
		viewrow = viewrow + 2;
		loadPage();
    });
});
	

function loadPage() {
	for(var i=0; i<viewrow*viewnum; i++) {
    	k = "#a" + i;
		$(k).show();
	}
}