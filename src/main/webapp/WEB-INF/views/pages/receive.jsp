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
    <script>

        window.onload = function(){
            var qrCode = new QRCode(document.getElementById("qrContainer"), {
                text: '${qrText}',
                width: 200,
                height: 200,
                colorDark: '#000000',
                colorLight: '#ffffff',
                correctLevel: QRCode.CorrectLevel.H
            });
        };

        console.log(${qrText});



    </script>
</head>
<body>
<h3>받기</h3>

<button class="button_primary">주소복사</button>
<div id="qrContainer"></div>
<%--<img src="http://chart.apis.google.com/chart?cht=qr&chs=128x128&chl=http%3A//jindo.dev.naver.com/collie&chld=H|0" />--%>
</body>
</html>
