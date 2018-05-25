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
<h3>보내기</h3>
<h2>내 지갑 정보</h2>
<p>ARS</p>
<p>ARS</p>
<ul>
    <li>
        <input id="amount" type="text" maxlength="20" placeholder="수량">
    </li>
    <li>+</li>
    <li>
        <input id="fee" type="text" placeholder="수수료">
    </li>
    <p></p>
    <li>
        <input id="totalamount" type="text" placeholder="총 전송 수량">
    </li>
    <li>
        <input id="destination" type="text" placeholder="보낼 주소">
    </li>
    <li>
        <input id="secret" type="text" placeholder="시크릿키">
    </li>
    <div class="button_container">
        <button class="button_transparent">QR코드 스캔</button>
        <button class="button_primary">보내기</button>
    </div>
</ul>

</body>
</html>
