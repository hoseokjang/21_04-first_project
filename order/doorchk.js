function door_chk(n){
   if(n==1){
      if(document.form.door.checked){   
          document.getElementById("doorchk").style.display="table-row";
          document.getElementById("jik").style.display="none";
       }
   }
   else if(n==2){
          document.getElementById("doorchk").style.display="none";
          document.getElementById("jik").style.display="none";
          document.getElementById("public_door_chk").checked=false;
       }
   else if(n==3){
      document.getElementById("doorchk").style.display="none";
      document.getElementById("jik").style.display="inline";
      document.getElementById("public_door_chk").checked=false;
   }
}

function public_doorchk(my)
{
	
	 if(my.checked){
   	  document.getElementById("public_door").disabled = false;
     }
     else{
   	  document.getElementById("public_door").disabled = true;
     }
}
