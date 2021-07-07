function non_mem_select_pay_method(n){
	if(n==1){
		if(document.getElementById("credit").checked){
			document.getElementById("card_option1").style.display="table-row";
			document.getElementById("card_option2").style.display="table-row";
			document.getElementById("account_iche").style.display="none";
			document.getElementById("pay_method_layer").innerText = "신용카드";
		}
	} else{
		document.getElementById("card_option1").style.display="none";
		document.getElementById("card_option2").style.display="none";
		document.getElementById("account_iche").style.display="table-row";
		document.getElementById("pay_method_layer").innerText = "실시간 계좌이체";
	}
}