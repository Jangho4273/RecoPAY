var viewrow = 20;
var locationName = [];
var id = [];
var isSearch = 0;


$(document).ready(function() {

	loadPage();

	$("#but").click(function() {
		if (isSearch == 0) {
			viewrow += 10;
			loadPage();
		}

	});

	$("#searchbut").click(function() {
		var cnt = 0;
		isSearch = 1;
		hideAllPage();
		for (var i = 0; i < locationName.length; i++)
			if (locationName[i].indexOf($(searchName).val()) != -1) {
				cnt += 1;
				$("#a" + id[i].trim()).show();
			}
		alert("총 몇개? : " + cnt);
	});
});

function loadPage() {
	for (var i = 0; i < viewrow; i++) {
		k = "#a" + i;
		$(k).show();
	}
}

function hideAllPage() {
	for (var i = 0; i < locationName.length; i++) {
		k = "#a" + i;
		$(k).hide();
	}
}

