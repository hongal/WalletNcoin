<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2018-05-24
  Time: 오후 3:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>보안설정</title>
    <script src="/resources/js/qrcode.min.js"></script>
    <script>
        $(document).ready(function(){
            console.log($('#otp_text').text());
            if($('#otp_text').text().length > 0){
                $('#qrImg').attr('src', 'https://chart.googleapis.com/chart?chs=200x200&cht=qr&chl=200x200&chld=M|0' +
                    '&cht=qr&chl=otpauth://totp/'+ '${otpInfo[0]}' +'%3Fsecret%3D' + '${otpInfo[1]}');
                $('#otp_text').text('${otpInfo[1]}');
                $("#delete_otp_container").show();
            }else{
                $("#add_otp_container").show();
            }
        });

        function createQr() {

            if(!$('#add_opt_checkbox').prop('checked')){
                alert('OTP사용에 체크해주세요!');
            }else{
                $.ajax({
                    url: '/api/createOtp',
                    type: 'get',
                    contentType : "application/json; charset=UTF-8",
                    success: function (args) {
                        console.log(args.length);
                        if(args.length > 1){
                            $('#qrImg').attr('src', 'https://chart.googleapis.com/chart?chs=200x200&cht=qr&chl=200x200&chld=M|0' +
                                '&cht=qr&chl=otpauth://totp/'+args[0]+'%3Fsecret%3D'+args[1]);

                            $("#delete_otp_container").show();
                            $("#add_otp_container").hide();
                            alert('생성되었습니다!');
                            location.reload();
                        }else{
                            alert('생성실패!');
                        }
                    }
                });
            }
        }
        
        function deleteQr() {
            if(!$('#delete_opt_checkbox').prop('checked')){
                alert('OTP 해제에 체크해주세요!');
            }else{
                $.ajax({
                    url: '/api/deleteOTP',
                    type: 'get',
                    contentType : "application/json; charset=UTF-8",
                    success: function (args) {
                        if(args == 'deleteSuccess!!'){
                            alert('삭제되었습니다!');
                            location.reload();
                        }else if('deleteFail!!'){
                            alert('삭제실패!');
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
        <h3>구글 2Factor(Google OTP)</h3>
        <div class="primary_content_row" id="add_otp_container" style="align-items: baseline; display: none;">
            <div style="flex-grow: 1">
                <input id="add_opt_checkbox" type="checkbox" style="flex-grow: 1">
                <span style="flex-grow: 1">OTP사용</span>
            </div>

            <button class="button_dark" style="flex-grow: 1; width: auto" onclick="createQr()">새 키 등록</button>
        </div>

        <div class="primary_content_row" id="delete_otp_container" style="align-items: baseline; display: none;">
            <div style="flex-grow: 1">
                <input id="delete_opt_checkbox" type="checkbox" style="margin-right: 12px">
                <span style="flex-grow: 1">OTP 해제</span>
            </div>

            <button class="button_dark" style="flex-grow: 1; width: auto" onclick="deleteQr()">키 해제</button>
        </div>

        <div id="otp_qr_container" style="margin: 0px auto;">
            <img id="qrImg" src="" />
        </div>
        <p id="otp_text" style="text-align: center">${otpInfo[1]}</p>
<%--        <div class="primary_content_row">
            <button class="button_dark" style="flex-grow: 1; margin-right: 12px">Google OTP 설정</button>
            <button class="button_primary" style="flex-grow: 1">OTP app download</button>
        </div>--%>
        <button class="button_primary" style="flex-grow: 1"
                onclick="window.open('https://play.google.com/store/apps/details?id=com.google.android.apps.authenticator2')">
            OTP app download</button>
    </div>
</div>
</body>
</html>
