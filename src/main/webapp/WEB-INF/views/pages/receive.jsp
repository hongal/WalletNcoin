<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

    <script src="/resources/js/qrcode.min.js"></script>
    <link href="/resources/css/receive.css" rel="stylesheet" type="text/css">
    <script>

        function setQr(qrAddress){

            $("#register_body").css("display", "block");

            var qrCode = new QRCode(document.getElementById("register_body"), {
                text: qrAddress,
                width: 256,
                height: 256,
                colorDark: '#000000',
                colorLight: '#ffffff',
                correctLevel: QRCode.CorrectLevel.H
            });
        }

        $(document).ready(function(){
            var address;
            var copyAddr;
            $("#addressList").on('click', "#address", function (event) {
                if(address != $( this ).text()) {
                    address = $( this ).text();
                    console.log($(this).text());
                    $("#register_body").empty();
                    setQr($(this).text());
                }
            }).on('click', "#copyAddressBtn", function (event) {
                if(copyAddr != $(this).parents("div").children('#address').text()) {
                    var $temp = $("<input>");
                    $("body").append($temp);
                    $temp.val($(this).parents("div").children('#address').text()).select();
                    document.execCommand("copy");
                    $temp.remove();
                }
            });

        });

        function createAddress() {
            $.ajax({
                url: '/api/createAddress',
                type: 'get',
                contentType : "application/json; charset=UTF-8",
                success: function (args) {
                    console.log(args);
                    if(args == 'createSuccess!!'){
                        alert('생성완료!');
                        location.reload();
                    }else{
                        alert('생성실패!');
                    }
                }
            });
        }


        function copyAddress() {
            console.log("click");
            $(this).text('sdf');
            console.log($(this).text());
            console.log($(this).parents("div").children('#address').text());
        }
    </script>
    <style>
        #addressRow{
            width: 100%;
            align-items: baseline;
        }
    </style>
</head>
<body>
<div class="primary_container">
    <div class="primary_content_column">
        <h3>받기</h3>

        <c:if test="${empty addressList}">
            <div id="none_address_attention" class="attention" >
                <p>등록된 지갑이</p>
                <p>없습니다!</p>
            </div>
        </c:if>

        <c:if test="${not empty addressList}">
            <h3>아래 주소를 클릭해주세요!</h3>
        </c:if>
    </div>
    <div id="register_body" style="display: none">
    </div>
    <div id="addressList" class="primary_content_column" style="align-items: center; margin-top: 12px">
        <c:forEach var="address" items="${addressList}">
            <div id="addressRow" class="primary_content_row">
                <div id="address" style="cursor: pointer; width: auto; flex-grow: 3; padding-left: 20px">${address}</div>
                <button id="copyAddressBtn" class="button_primary" style="flex-grow: 1; width: auto " onclick="copyAddress()">주소복사</button>
            </div>
        </c:forEach>

<%--        <button class="button_dark">지갑 추가</button>--%>
        <button class="button_primary" onclick="createAddress()">지갑 생성</button>
    </div>

</div>


<%--<img src="http://chart.apis.google.com/chart?cht=qr&chs=128x128&chl=http%3A//jindo.dev.naver.com/collie&chld=H|0" />--%>
</body>
</html>
