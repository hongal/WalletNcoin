<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2018-05-24
  Time: 오후 1:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>보내기</title>
</head>
<body>
<div class="primary_container">
    <div class="primary_content_column">
        <h3>보내기</h3>
        <h2>내 지갑 정보</h2>
        <p>ARS</p>
        <p>ARS</p>
        <div class="primary_content_row">
            <input id="amount" type="text" maxlength="20" placeholder="수량">
            <span>+</span>
            <input id="fee" type="text" placeholder="수수료">
        </div>
        <input id="totalamount" type="text" placeholder="총 전송 수량">
        <input id="destination" type="text" placeholder="보낼 주소">
        <div class="primary_content_row">
            <button class="button_transparent">QR코드 스캔</button>
            <button class="button_primary">보내기</button>
        </div>
    </div>
</div>
</body>
</html>
