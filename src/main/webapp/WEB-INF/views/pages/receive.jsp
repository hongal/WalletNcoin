<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2018-05-24
  Time: 오후 1:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>받기</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="/resources/js/qrcode.min.js"></script>
    <link href="/resources/css/receive.css" rel="stylesheet" type="text/css">
    <script>
        window.onload = function(){
            var qrCode = new QRCode(document.getElementById("register_body"), {
                text: '${qrText}',
                width: 256,
                height: 256,
                colorDark: '#000000',
                colorLight: '#ffffff',
                correctLevel: QRCode.CorrectLevel.H
            });
        };

    </script>
</head>
<body>
<div class="primary_container">
    <div class="primary_content_column">
        <h2>내 지갑 정보</h2>
        <h3>받기</h3>
        <h3>Qr Code</h3>
    </div>
    <div id="register_body">

    </div>
    <div class="primary_content_column" style="align-items: center">
        <p>1234567890</p>
        <button class="button_primary">주소복사</button>
    </div>

</div>


<%--<img src="http://chart.apis.google.com/chart?cht=qr&chs=128x128&chl=http%3A//jindo.dev.naver.com/collie&chld=H|0" />--%>
</body>
</html>
