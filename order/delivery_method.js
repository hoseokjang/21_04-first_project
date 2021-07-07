function delivery_methd(n){
	if(n==1){
		document.getElementById("dv_methd").innerText = "일반배송";
	} else if(n==2){
		document.getElementById("dv_methd").innerText = "새벽배송";
	} else{
		document.getElementById("dv_methd").innerText = "퀵배송";
	}
}