function idChanged() {
    $("#idUnChked").css('display', "block");
}

function chkPw() {
    var password = $("#password").val();
    var chk_password = $("#chk_password").val();
    if(password == chk_password){
        return true;
    }else{
        return false;
    }
}

function idDuplicateChk() {
    console.log('click');
    var regExpId = /^[A-Za-z]{1}[A-Za-z0-9]{3,19}$/;
    var id = $("#id").val();
    var data = {
    	id: id
	}
	console.log(id);

	if(!regExpId.test(id)) {
        alert('영문/숫자 조합으로 6 ~ 14자리를 입력해주세요!');
    }else{
        $.ajax({
            url: '/api/idDuplicateChk',
            type: 'get',
            data: data,
            contentType : "application/json; charset=UTF-8",
            success: function (args) {
                console.log(args);
                if (args == "idUseable") {//사용가능할 경우
                    alert("사용가능한 id입니다!");
                    $("#idUnChked").css("display", "none");
                    //$("#idChked").css("display", "block");
                    $("#id").prop('disabled', true);
                } else if (args == "idDuplicated") {//중복일경우
                    alert("중복된 id입니다!");
                }
            }
        });
	}
}

function addCustomer() {
    var id = $("#id").val();
    var country = $("#country").val();
    var phone = $("#phone").val();
    var password = $("#password").val();

	if($('#id').prop('disabled') == false){
        alert('id중복체크를 진행해주세요!');
	}else if(!/^[A-Za-z]{1}[A-Za-z0-9]{6,14}$/.test(password)){
        alert('영문/숫자 조합의 패스워드 6 ~ 14자리를 입력해주세요!');
	}else if(chkPw() == false){
        alert('password가 일치하지 않습니다!');
	}else if(country == 0){
		alert('국가를 선택해주세요!');
	}else if($('#sms_code').prop('disabled') == false){
	    alert('인증을 진행해주세요!');
    }else{

        var data = {
            id: id,
            password : password,
            phone: phone,
            country: country
        }
        $.ajax({
            url: '/api/addCustomer',
            type: 'post',
            data: JSON.stringify(data),
            contentType : "application/json; charset=UTF-8",
            success: function (args) {
                console.log(args);
                if(args == 'addSuccess!!'){
                    alert('가입되었습니다!');
                    $(location).attr('href', '/');
                }else{
                    alert('가입실패!')
                }
            }
        });
    }

}

function sendSms() {
    //?id=geopia&pwd=wldhsms&code=$code&snum=027868200&rnum=$mobile&msg=$msg&userid=geopia&ipAddr=$_SERVER[REMOTE_ADDR]
    var data;
    var id = $("#id").val();
    var phone = $("#phone").val();
    var ip;

    if($('#id').prop('disabled') == false){
        alert('아이디 중복확인을 진행해주세요!');
    }else if(phone.length == 0){
        alert('휴대폰번호를 입력해주세요!');
    }else{
        $.getJSON('https://api.ipify.org?format=jsonp&callback=?', function(data) {
            var result = JSON.parse(JSON.stringify(data, null, 2));
            this.ip =  result.ip;
            this.data = {
                num: phone,
                id: id,
                ip_addr: this.ip
            };

        }).then(function(){
            console.log('send');
            $.ajax({
                url: '/api/sendSms',
                type: 'post',
                data: JSON.stringify(this.data),
                contentType : "application/json; charset=UTF-8",
                success: function (args) {
                    console.log(args);
                    if(args == 'sendSuccess!!') {
                        alert('전송되었습니다!');
                    }else{
                        alert('전송실패!');
                    }
                }
            });
        });

    }

}


function checkCode() {
    var sms_code = $("#sms_code").val();

    if ( sms_code.length > 0 && sms_code != "Default text" ){

        var data = {
            sms_code: sms_code
        }

        $.ajax({
            url: '/api/chkCode',
            type: 'get',
            data: data,
            contentType : "application/json; charset=UTF-8",
            success: function (args) {
                if(args == 'codeChkSuccess!!'){
                    alert('인증완료!');
                    $('#sms_code').prop('disabled', true);
                    $('#sms_code').val('인증완료!');
                    $('#auth_btn').prop('disabled', true);
                }else{
                    alert('잘못된 인증번호입니다!');
                }
            }
        });
    }else{
        alert("인증코드를 입력해주세요!");

    }
}

/*
function getUserIP(onNewIP) { //  onNewIp - your listener function for new IPs
    //compatibility for firefox and chrome
    var myPeerConnection = window.RTCPeerConnection || window.mozRTCPeerConnection || window.webkitRTCPeerConnection;
    var pc = new myPeerConnection({
            iceServers: []
        }),
        noop = function() {},
        localIPs = {},
        ipRegex = /([0-9]{1,3}(\.[0-9]{1,3}){3}|[a-f0-9]{1,4}(:[a-f0-9]{1,4}){7})/g,
        key;

    function iterateIP(ip) {
        if (!localIPs[ip]) onNewIP(ip);
        localIPs[ip] = true;
    }

    //create a bogus data channel
    pc.createDataChannel("");

    // create offer and set local description
    pc.createOffer().then(function(sdp) {
        sdp.sdp.split('\n').forEach(function(line) {
            if (line.indexOf('candidate') < 0) return;
            line.match(ipRegex).forEach(iterateIP);
        });

        pc.setLocalDescription(sdp, noop, noop);
    }).catch(function(reason) {
        // An error occurred, so handle the failure to connect
    });

    //listen for candidate events
    pc.onicecandidate = function(ice) {
        if (!ice || !ice.candidate || !ice.candidate.candidate || !ice.candidate.candidate.match(ipRegex)) return;
        ice.candidate.candidate.match(ipRegex).forEach(iterateIP);
    };
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

}*/
