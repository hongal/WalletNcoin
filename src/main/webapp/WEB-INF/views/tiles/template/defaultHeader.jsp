
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%--<div class="menuBorderBox">
    <div class="menuBox">
        <div class="b" style="font-size:20px;padding-left:5px;">N코인</div>
    </div>
    <div class="border tl"></div>
    <div class="border tr"></div>
    <div class="border bl"></div>
    <div class="border br"></div>
</div>--%>
<%--<div class="menuBorderBox" style="margin-top:5px;">
    <div class="menuBox"
        <script>
            treeMenu1 = new dTree("treeMenu1");
            treeMenu1.add(0, -1, "관리자");

            treeMenu1.add(100, 0, "지갑 관리");
            treeMenu1.add(101, 100, "지갑 목록", "<c:url value='/walletList.do' />");
            treeMenu1.add(102, 100, "송금하기", "<c:url value='/sendMoney.do' />");
            treeMenu1.add(103, 100, "송금 로그", "<c:url value='/tradeLog.do' />");
            treeMenu1.add(104, 100, "지갑 순위", "<c:url value='/walletList.do?mode=ranking' />");
            
            treeMenu1.add(1, 0, "블록 목록", "<c:url value='/ledgerList.do' />");

            treeMenu1.add(2, 0, "노드 목록", "<c:url value='/nodeList.do' />");
            treeMenu1.add(3, 0, "일반 설정", "<c:url value='/setting.do' />");
            document.write(treeMenu1);
        </script>
    </div>
    <div class="border tl"></div>
    <div class="border tr"></div>
    <div class="border bl"></div>
    <div class="border br"></div>
</div>--%>

<%--
<div>
    <ul>
        <li>
            <div class="main_menu_btn" onclick="location.href='/send'">
                보내기
            </div>
        </li>
        <li>
            <div class="main_menu_btn" onclick="location.href='/receive'">
                받기
            </div>
        </li>
        <li>
            <div class="main_menu_btn" onclick="location.href='/listtransactions'">
                거래내역
            </div>
        </li>
        <li>
            <div class="main_menu_btn" onclick="location.href='/member/modify'">
                정보수정
            </div>
        </li>
        <li>
            <div class="main_menu_btn" onclick="location.href='/security'">
                보안설정
            </div>
        </li>
        <li>
            <div class="main_menu_btn" onclick="location.href='/security/sPw'">
                2차 비밀번호
            </div>
        </li>
    </ul>
</div>
<div class="menuBorderBox" style="margin-top:5px;">
    <div class="menuBox">
        <strong>관리자 : 샘플 </strong>[<a href="<c:url value='/login.do' />">로그아웃</a>]<br><br>
    </div>
    <div class="border tl"></div>
    <div class="border tr"></div>
    <div class="border bl"></div>
    <div class="border br"></div>
</div>--%>

<div id="default_header">
    <span>Arisu Coin</span>
    <span>메뉴 버튼</span>

</div>
