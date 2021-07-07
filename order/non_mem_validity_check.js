function click_public_door(pdchk){
	document.getElementById("public_door").text = null;
}
function input_public_door(){
	document.getElementById("public_door").text = "0";
}
function click_jik(jikchk){
	document.getElementById("jik").text = null;
}
function input_jik(){
	document.getElementById("jik").text = "0";
}
function non_mem_payinfo_chk(){
	if(document.getElementById("door").checked){
		if(document.getElementById("public_door_chk").checked){
			if(document.getElementById("public_door").text == null || document.getElementById("public_door").text == undefined){
				alert("공동현관이 있는경우 동호수와 현관비밀번호를 입력해주세요");
				return false;
			} else{
				if(document.getElementById("credit").checked){
					if(document.getElementById("select_card").value == "X"){
						alert("카드를 선택해주세요");
						return false;
					} else{
						if(!document.getElementById("agree").checked){
							alert("이용약관에 동의해주세요");
							return false;
						} else{
							return true;
						}
					}
				} else {
					if(!document.getElementById("agree").checked){
						alert("이용약관에 동의해주세요");
						return false;
					} else{
						return true;
					}
				}
			}
		} else{
			if(document.getElementById("credit").checked){
				if(document.getElementById("select_card").value == "X"){
					alert("카드를 선택해주세요");
					return false;
				} else{
					if(!document.getElementById("agree").checked){
						alert("이용약관에 동의해주세요");
						return false;
					} else{
						return true;
					}
				}
			} else {
				if(!document.getElementById("agree").checked){
					alert("이용약관에 동의해주세요");
					return false;
				} else{
					return true;
				}
			}
		}
	} else if(document.getElementById("so").checked){
		if(document.getElementById("credit").checked){
			if(document.getElementById("select_card").value == "X"){
				alert("카드를 선택해주세요");
				return false;
			} else{
				if(!document.getElementById("agree").checked){
					alert("이용약관에 동의해주세요");
					return false;
				} else{
					return true;
				}
			}
		} else {
			if(!document.getElementById("agree").checked){
				alert("이용약관에 동의해주세요");
				return false;
			} else{
				return true;
			}
		}
	} else if(document.getElementById("etc").checked){
		if(document.getElementById("jik").text == null || document.getElementById("jik").text == undefined){
			alert("직접 입력방법을 기입해주세요");
			return false;
		} else{
			if(document.getElementById("credit").checked){
				if(document.getElementById("select_card").value == "X"){
					alert("카드를 선택해주세요");
					return false;
				} else{
					if(!document.getElementById("agree").checked){
						alert("이용약관에 동의해주세요");
						return false;
					} else{
						return true;
					}
				}
			} else {
				if(!document.getElementById("agree").checked){
					alert("이용약관에 동의해주세요");
					return false;
				} else{
					return true;
				}
			}
		}
	} else{
		return true;
	}
}