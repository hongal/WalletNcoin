<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2018-06-21
  Time: 오후 5:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>비밀번호 찾기</title>

    <script>
        var ip;

        function sendSms() {
            var data;
            //?id=geopia&pwd=wldhsms&code=$code&snum=027868200&rnum=$mobile&msg=$msg&userid=geopia&ipAddr=$_SERVER[REMOTE_ADDR]



            if($("#re_pw_id").val().length == 0){
                alert('아이디를 입력해주세요!');
            }else if($("#re_pw_phone").val().length == 0){
                alert('휴대폰번호를 입력해주세요!');
            }else{
                $.getJSON('https://api.ipify.org?format=jsonp&callback=?', function(data) {
                    var result = JSON.parse(JSON.stringify(data, null, 2));
                    ip =  result.ip;

                }).then(function(){
                    data = {
                        num: $("#re_pw_phone").val(),
                        id: $("#re_pw_id").val(),
                        code : '',
                        ip_addr: ip
                    };
                    console.log(this.data);
                    $.ajax({
                        url: '/api/checkSignedHp',
                        type: 'POST',
                        data: JSON.stringify(data),
                        contentType : "application/json; charset=UTF-8",
                        success: function (args) {
                            console.log(args);
                            if(args == 'SmsSendSuccess!!') {
                                $("#re_pw_id").prop('disabled', true);
                                $("#re_pw_phone").prop('disabled', true);
                                alert('전송되었습니다!');
                            }else if('WrongInfo!!'){
                                alert('잘못된 정보입니다!');
                            }
                        }
                    });
                });

            }

        }
        
        function updatePw() {
            var data = {
                id: $("#re_pw_id").val(),
                num: $("#re_pw_phone").val(),
                code: $("#re_pw_code").val(),
                ip_addr: this.ip
            }

            if($("#re_pw_id").prop('disabled') == false || $("#re_pw_phone").prop('disabled') == false) {
                alert('인증을 진행해주세요!');
            }else if($("#re_pw_code").val().length == 0){
                alert('인증번호를 입력해주세요!');
            }else{

                console.log(data);
                $.ajax({
                    url: '/api/updatePw',
                    type: 'POST',
                    data: JSON.stringify(data),
                    contentType : "application/json; charset=UTF-8",
                    success: function (args) {
                        console.log(args);
                        if(args == 'ChangePwSuccess!!'){
                            alert('변경되었습니다!');
                            location.replace('/');
                        }else if('ChangePwFail!!'){
                            alert('변경실패!');
                        }else if('CodeChkFail!!'){
                            alert('인증코드가 틀렸습니다!');
                        }
                    }
                });
            }
        }
    </script>
</head>
<body>
<div class="primary_container">
    <div class="primary_content_column">
        <h2>비밀번호 재설정</h2>
        <p class="attention">
            인증완료하시면<br>
            문자로 임시 비밀번호를 전송합니다.
        </p>
        <input class="primary_input" id="re_pw_id" placeholder="아이디">
        <div class="primary_content_row" style="align-items: center">
            <input id="re_pw_phone" class="primary_input" placeholder="휴대폰번호" style="flex-grow: 1">
            <button class="button_dark" style="width: auto" onclick="sendSms()">인증번호 전송</button>
        </div>
        <input class="primary_input" id="re_pw_code" placeholder="인증코드를 입력해주세요!">
        <button class="button_primary" onclick="updatePw()">완료</button>

    </div>
</div>
</body>
</html>
