function emailDuplCheck() {
	var inputemail = $("#email").val();
	var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
	if(exptext.test(inputemail)==false){
		alert("이 메일형식이 올바르지 않습니다.");
	}
	else {
	
	$.ajax({
		url: '/emailDuplChk.do',
		type:'post',
		data : {
			email : inputemail
		},
		success:function(data) {
			
			if (data == 0) {
				alert("사용 가능한 이메일입니다.");
				$("#emailChk").val("set");
			}
			else {
				alert("이미 사용중인 이메일입니다.");
			}
		}
		
	})
	}
}



function checkPassword() {
	
	 var reg_pwd = /^.*(?=.{8,12})(?=.*[0-9])(?=.*[a-zA-Z])(?=.*?[#?!@$%^&*-]).*$/;
	 var pwd =$("#password").val();
	 if(!reg_pwd.test(pwd)){
		$("#passwordsetMessage").text("유효한 비밀번호를 설정하세요.");
	  return false;
	 }
	 $("#passwordsetMessage").text("유효한 비밀번호입니다.");
	 $("#passwordChk").val("set");
	 return true;

}

function checkPasswordEqual() {
	var pwd =$("#password").val();
	var pwdConfirm = $("#passwordConfirm").val();
	if (pwd == pwdConfirm) {
		$("#passwordConfirmChk").val("set");
		$("#passwordConfirmMessage").text("비밀번호가 일치합니다.");
	}
	else {
		$("#passwordConfirmMessage").text("비밀번호가 일치하지 않습니다.");
	}
}


function validateformcheck(obj) {
	
	if (Chkpwd($("#password").val()))
	
	
	if ($("#emailChk").val() == "set") {
		alert("가입 ok");
		return true;
	}
	else {
		alert("가입 not ok");
		return false;
	}
	
}