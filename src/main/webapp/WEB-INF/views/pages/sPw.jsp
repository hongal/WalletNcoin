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
</head>
<body>
<div class="primary_container">
    <div class="primary_content_column">
        <div class="primary_content_row" style="align-items: baseline">
            <input type="checkbox" ><span>2차 비밀번호 사용</span>
        </div>
        <input type="text" placeholder="4자리 숫자" class="primary_input">
        <p class="attention">
            4 자리 숫자를 입력하세요.<br>
            2차 비밀번호를 설정 하실경우<br>
            코인 전송시 필수로 입력 하셔야 합니다.
        </p>
        <button class="button_primary">설정완료</button>
    </div>
</div>
</body>
</html>
