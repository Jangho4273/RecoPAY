/**
 * 
 */


var clickedArr = [];

function reply_click(id) {
	if (document.getElementById(id).style.backgroundColor != "rgb(245, 214, 130)") {
		document.getElementById(id).style.backgroundColor = "#f5d682";
		clickedArr.push(id);
	} else {
		document.getElementById(id).style.backgroundColor = "#FFFFFF";
		for (var i = 0; i < clickedArr.length; i++) {
			if (clickedArr[i] === id ) {
				clickedArr.splice(i, 1);
				i--;
			}
		}
	}

	for (var i = 0; i < clickedArr.length; i++) {
		if (i == 0) {
			document.getElementById("state").innerHTML = "선택한 좌석 : " + clickedArr[i];
		} else {
			document.getElementById("state").innerHTML += ", " + clickedArr[i];
		}
	}
	
	document.getElementById("totalseat").innerHTML = "총 선택된 좌석 : " + clickedArr.length;
	
}




























