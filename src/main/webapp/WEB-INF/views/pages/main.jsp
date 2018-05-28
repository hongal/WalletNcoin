
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

    <div class="primary_content_row" style="max-width: 700px; flex-wrap: wrap; ">
        <div class="main_menu_btn" onclick="location.href='/send'">
            보내기
        </div>
        <div class="main_menu_btn" onclick="location.href='/receive'">
            받기
        </div>
        <div class="main_menu_btn" onclick="location.href='/listtransactions'">
            거래내역
        </div>
        <div class="main_menu_btn" onclick="location.href='/member/modify'">
            정보수정
        </div>
        <div class="main_menu_btn" onclick="location.href='/security'">
            보안설정
        </div>
        <div class="main_menu_btn" onclick="location.href='/security/sPw'">
            2차 비밀번호
        </div>
    </div>
</div>

</body>
</html>
