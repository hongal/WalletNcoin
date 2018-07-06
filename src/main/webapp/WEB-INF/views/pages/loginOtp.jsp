<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2018-07-02
  Time: 오후 5:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script>
        function otpLogin() {
            var code = $('#otp_login_key').val();

            var data = {
                code: code
            };

            $.ajax({
                url: '/api/loginOTP',
                type: 'get',
                data : data,
                contentType : "application/json; charset=UTF-8",
                success: function (args) {
                    console.log(args);

                    if(args == 'otpLoginSuccess!!'){
                        location.reload();
                    }else if(args == 'otpLoginFail!!'){
                        alert('로그인 실패!');
                    }
                }
            });
        }
    </script>
    <style>
        #openNavBtn{
            display: none;
        }
    </style>
    <title>OTP로그인</title>
</head>
<body>
<div class="primary_container">
    <div class="primary_content_column" style="align-items: center; justify-content: space-around">
        <img src="../../../resources/img/google-auth.png" style="margin-top: 20px">
        <input id="otp_login_key" class="primary_input" style="width: 60%; text-align: center"
               placeholder="구글 authenticator 키를 입력해주세요!">
        <button class="button_primary" style="width: 60%;" onclick="otpLogin()">OTP 로그인</button>
        <button class="button_primary" style="width: 60%;" onclick="location.href='/logout'">로그인 취소</button>

    </div>
</div>
</body>
</html>
