<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2018-05-24
  Time: 오후 3:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>정보수정</title>
    <script>


        function showPwChange() {
            $('#changePwBtn').removeClass("button_primary").addClass("button_dark_fixed");
            $('#changeHpBtn').removeClass("button_dark_fixed").addClass("button_primary");
            $("#changePwBtn").prop('disabled', true);
            $("#changeHpBtn").prop('disabled', false);
            $('#changePhoneForm').hide();
            $('#changePwForm').show();
        }
        
        function showHpChange() {
            $('#changePwBtn').removeClass("button_dark_fixed").addClass("button_primary");
            $('#changeHpBtn').removeClass("button_primary").addClass("button_dark_fixed");
            $("#changeHpBtn").prop('disabled', true);
            $("#changePwBtn").prop('disabled', false);
            $('#changePwForm').hide();
            $('#changePhoneForm').show();
        }
        
        function changePw() {
            var pw = $("#pw").val();
            var pwChk = $("#pwChk").val();
            var data = {
                password: pw

            }
            if(pw != pwChk){
                alert("패스워드가 일치하지 않습니다!");
            }else if(!/^[A-Za-z]{1}[A-Za-z0-9]{3,19}$/.test(pw)){
                alert('영문/숫자 조합의 패스워드 6 ~ 14자리를 입력해주세요!');
            }else{
                console.log("send");
                console.log(data);
                $.ajax({
                    url: '/api/changePw',
                    type: 'get',
                    data: data,
                    contentType : "application/json; charset=UTF-8",
                    success: function (args) {
                        console.log(args);
                        if(args == 'pwChangeSuccess!!'){
                            alert('수정되었습니다!!');
                            $(location).attr('href', '/');
                        }else{
                            alert('수정실패!!')
                        }
                    }
                });
            }
        }

        
        function changeHP() {

            if($("#country").val() == 0){
                alert('국가를 선택해 주세요!');
            }else if($("#phone").val().length == 0){
                alert('휴대폰 번호를 입력해주세요!');
            }else if($('#auth_btn').prop('disabled') == false){
                alert('휴대폰 인증을 진행해주세요!');
            }else{
                console.log('success!');
                var data = {
                    phone: $("#phone").val()
                }
                $.ajax({
                    url: '/api/changeHp',
                    type: 'get',
                    data: data,
                    contentType : "application/json; charset=UTF-8",
                    success: function (args) {
                        console.log(args);
                        if(args == 'HpChangeSuccess!!'){
                            alert('수정되었습니다!!');
                            $(location).attr('href', '/');
                        }else{
                            alert('수정실패!!')
                        }
                    }
                });
            }
        }
        
        function sendSms() {
            var data;

            if($("#phone").val().length == 0){
                alert('휴대폰 번호를 입력해주세요!');
            }else{
                $.getJSON('https://api.ipify.org?format=jsonp&callback=?', function(data) {
                    var result = JSON.parse(JSON.stringify(data, null, 2));
                    this.ip =  result.ip;
                    this.data = {
                        num: $("#phone").val(),
                        ip_addr: this.ip
                    };

                }).then(function(){
                    $.ajax({
                        url: '/api/checkHp',
                        type: 'post',
                        data: JSON.stringify(this.data),
                        contentType : "application/json; charset=UTF-8",
                        success: function (args) {
                            console.log(args);
                            if(args == 'HpCheckComplete!!') {
                                alert('전송되었습니다!');
                                $('#sms_code').prop('disabled', false);
                                $('#sms_code').val('');
                                $('#auth_btn').prop('disabled', false);
                            }else if('HpDuplicated'){
                                alert('중복되는 번호입니다!!');
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

    </script>
    <style>
        .button_dark_fixed{
            color: #fff;
            background-color: #4C4C4C;
            padding: 7px 10px 7px 10px;
            border-radius: 6px;
            display: block;
            width: 100%;
            font-size: 19px;
            text-align: center;
            cursor: pointer;
            height: auto;
            box-shadow: none;
            border: none;
            cursor: default;
        }
    </style>
</head>
<body>
<div class="primary_container">
    <div class="primary_content_column">
        <h3>정보수정</h3>

        <div class="primary_content_row">
            <button id="changePwBtn" class="button_dark_fixed" style="flex-grow: 1; margin-right: 12px" onclick="showPwChange()" disabled="true">비밀번호 변경</button>
            <button id="changeHpBtn" class="button_primary" style="flex-grow: 1" onclick="showHpChange()">휴대폰번호 변경</button>
        </div>

        <div id="changePwForm" class="primary_content_column">
            <input id="pw" type="password" placeholder="Password" class="primary_input">
            <input id="pwChk" type="password" placeholder="RePassword" class="primary_input">
            <button id="pwChangeBtn" class="button_primary" onclick="changePw()">회원정보 수정</button>
        </div>

        <div id="changePhoneForm" class="primary_content_column" style="display: none">
            <select id="country">
                <option style="display: none" value="0"> 국가</option>
                <option value="1">한국</option>
                <option value="2">미국</option>
                <option value="3">일본</option>
                <option value="4">중국</option>
            </select>
            <div class="primary_content_row" style="align-items: center">
                <input id="phone" class="primary_input" placeholder="휴대폰번호" style="flex-grow: 1">
                <button class="button_dark" style="width: auto" onclick="sendSms()">인증번호 전송</button>
            </div>
            <p style="color: #bbb; font-size: 17px; padding-left: 10px">
                -를 제외한 숫자만 입력해 주세요.<br>
                EX)01012345678
            </p>
            <div class="primary_content_row" id="sms_container">
                <input id="sms_code" class="primary_input" placeholder="인증번호" style="flex-grow: 1" >
                <button id="auth_btn" class="button_dark" style="width: auto" onclick="checkCode()" >인증</button>
            </div>
            <button class="button_primary" onclick="changeHP()">휴대폰번호 수정</button>
        </div>
    </div>
</div>

</body>
</html>
