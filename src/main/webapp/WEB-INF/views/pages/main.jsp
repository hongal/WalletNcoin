
<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2018-05-24
  Time: 오전 9:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="/resources/css/main.css" rel="stylesheet" type="text/css">
    <title>메인</title>
</head>
<body>
<div class="primary_container">
    <div class="primary_content_column" >
        <h2>내 지갑 정보</h2>
        <p>${amount}NCN</p>
    </div>

    <div class="primary_content_row" style="max-width: 700px; flex-wrap: wrap; justify-content: space-between;">
        <div class="main_menu_btn" onclick="location.href='/send'">
            <img src="/resources/img/menu_send.png">
            <span>보내기</span>
        </div>
        <div class="main_menu_btn" onclick="location.href='/receive'">
            <img src="/resources/img/menu_receive.png">
            <span>받기</span>
        </div>
        <div class="main_menu_btn" onclick="location.href='/listtransactions'">
            <img src="/resources/img/menu_listtransactions.png">
            <span>거래내역</span>
        </div>
        <div class="main_menu_btn" onclick="location.href='/member/modify'">
            <img src="/resources/img/menu_modify.png">
            <span>정보수정</span>
        </div>
        <div class="main_menu_btn" onclick="location.href='/security'">
            <img src="/resources/img/menu_security.png">
            <span>보안설정</span>
        </div>
        <div class="main_menu_btn" onclick="location.href='/security/sPw'">
            <img src="/resources/img/menu_sPw.png">
            <span>2차 비밀번호</span>
        </div>
    </div>
</div>

</body>
</html>
