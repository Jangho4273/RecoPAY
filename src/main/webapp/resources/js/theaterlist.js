var viewrow = 20;

$(document).ready(function() {
	
	loadPage();
	
    $("#but").click(function(){
		viewrow += 10;
		loadPage();
    });
    
	

    $("#searchbut").click(function() {
		alert($(searchName).val());
    });
});
	

function loadPage() {
	for(var i=0; i<viewrow; i++) {
    	k = "#a" + i;
		$(k).show();
	}
}

function hidePage() {
	for(var i=0; i<viewrow; i++) {
    	k = "#a" + i;
		$(k).show();
	}
}

