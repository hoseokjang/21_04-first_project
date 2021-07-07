function detailchkAll(){
	if(document.form.agree.checked){
		document.getElementById("agree1").checked = true;
		document.getElementById("agree2").checked = true;
		document.getElementById("agree_layer").checked = true;
	}
	else{
		document.getElementById("agree1").checked = false;
		document.getElementById("agree2").checked = false;
		document.getElementById("agree_layer").checked = false;
	}
}
function detailcheck(){
	if(document.form.agree1.checked && document.form.agree2.checked){
		document.getElementById("agree").checked = true;
		document.getElementById("agree_layer").checked = true;
	}
	else{
		document.getElementById("agree").checked = false;
		document.getElementById("agree_layer").checked = false;
	}
}
function detailcheck_layer(){
	if(document.getElementById("agree_layer").checked){
		document.getElementById("agree").checked = true;
		document.getElementById("agree1").checked = true;
		document.getElementById("agree2").checked = true;
	}
	else{
		document.getElementById("agree").checked = false;
		document.getElementById("agree1").checked = false;
		document.getElementById("agree2").checked = false;
	}
}