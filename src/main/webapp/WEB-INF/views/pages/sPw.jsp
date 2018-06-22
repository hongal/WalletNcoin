<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2018-05-24
  Time: 오후 3:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="/resources/css/sPw.css" rel="stylesheet" type="text/css">
    <title>2차 비밀번호</title>
    <script>
        $.ajax({
            url: '/api/checkSecPw',
            type: 'get',
            contentType : "application/json; charset=UTF-8",
            success: function (args) {
                console.log(args);
                if(args == 'secPwExist!!'){
                    $('#sPwCheck').prop('checked', true);
                    $("#deleteSecPw").css("display", "block");
                }else{
                    $("#setSecPw").css("display", "block");
                }
            }
        });

        function setSecPw() {
            if($('#sPwInput').val().length == 0){
                alert('입력해주세요!');
            }else if($('#sPwInput').val().length < 4
                || !/^[0-9]*$/.test($('#sPwInput').val())){
                alert('4자리 숫자를 입력해주세요!');
            }else if(!$('#sPwCheck').prop('checked')){
                alert('체크해주세요!');
            }else{

                var data = {
                    sPw: $('#sPwInput').val()
                }

                $.ajax({
                    url: '/api/setSecPw',
                    type: 'get',
                    data: data,
                    contentType : "application/json; charset=UTF-8",
                    success: function (args) {
                        if(args == 'setSuccess!!'){
                            alert('설정완료!');
                            $('#sPwInput').val("");
                            $("#setSecPw").css("display", "none");
                            $("#deleteSecPw").css("display", "block");
                        }else{
                            alert('설정실패!');
                        }
                    }
                });
            }
        }
        
        function deleteSecPw() {
            if($('#sPwInput').val().length == 0){
                alert('입력해주세요!');
            }else if($('#sPwInput').val().length < 4
                || !/^[0-9]*$/.test($('#sPwInput').val())){
                alert('4자리 숫자를 입력해주세요!');
            }else{
                var data = {
                    sPw: $('#sPwInput').val()
                }

                $.ajax({
                    url: '/api/deleteSecPw',
                    type: 'get',
                    data: data,
                    contentType : "application/json; charset=UTF-8",
                    success: function (args) {
                        if(args == 'sPwDeleteSuccess!!'){
                            $('#sPwInput').val("");
                            $("#setSecPw").css("display", "block");
                            $("#deleteSecPw").css("display", "none");
                            $('#sPwCheck').prop('checked', false);
                            alert('해제되었습니다!');
                        }else{
                            alert('틀린 비밀번호입니다!');
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
        <div class="primary_content_row" style="align-items: baseline">
            <input type="checkbox" id="sPwCheck" ><span>2차 비밀번호 사용</span>
        </div>
        <input id="sPwInput" type="text" placeholder="4자리 숫자" class="primary_input" maxlength="4">
        <p class="attention">
            4 자리 숫자를 입력하세요.<br>
            2차 비밀번호를 설정 하실경우<br>
            코인 전송시 필수로 입력 하셔야 합니다.
        </p>
        <button id="setSecPw" class="button_primary" onclick="setSecPw()" style="display: none">설정완료</button>
        <button id="deleteSecPw" class="button_primary" onclick="deleteSecPw()" style="display:none;">설정해제</button>
    </div>
</div>
</body>
</html>
