<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tbody>
    <tr>
        <td height="20" style="padding: 0 0 0 10px;">
            <table border="0" cellspacing="0" cellpadding="0">
                <tbody>
                <tr>
                    <td width="7"><img src="<c:url value='/res/img/' />MarketReadIcon3.gif" alt=""
                                       width="4" height="5" style="padding-bottom: 3px"></td>
                    <td class="CopyText2">회원 검색</td>
                </tr>
                </tbody>
            </table>
        </td>
    </tr>
    <tr>
        <td bgcolor="#FFFFFF" style="padding: 0 7px 0 7px">
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tbody>
                <tr>
                    <td height="1" bgcolor="#7bae7c"></td>
                </tr>
                <tr>
                    <td bgcolor="#93bb93">

                        <form name="searchForm" method="get" action="#">
                            <input type="hidden" name="view" value="memberList"> <input
                                type="hidden" name="type" value="search">

                            <table width="100%" border="0" cellspacing="1" cellpadding="0">
                                <tbody>
                                <tr>
                                    <td width="80" height="40" align="center"
                                        class="MyMoneyText1 bgGreen">검색</td>
                                    <td class="MyMoneyText1 bgGreen">
                                        <table border="0" cellspacing="5" cellpadding="0">
                                            <tbody>
                                            <tr>
                                                <td><select name="searchType">
                                                    <option value="mobile">전화번호</option>
                                                    <option value="idx">아이디</option>
                                                    <option value="deviceId">기기값</option>
                                                    <option value="nickname">닉네임</option>
                                                    <option value="email">이메일</option>
                                                    <option value="version">버전</option>
                                                    <option value="device">기기명</option>
                                                </select></td>
                                                <td><input type="text" name="query"
                                                           class="MarketText3" value=""></td>
                                                <td><input type="image"
                                                           src="<c:url value='/res/img/' />MyMoneyBut4.gif" alt="" width="40"
                                                           height="17"></td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </td>
                                </tr>
                                </tbody>
                            </table>

                        </form>

                    </td>
                </tr>
                </tbody>
            </table>
        </td>
    </tr>
    </tbody>
</table>
<br>

<form name="manageForm" method="post" action="#">
    <input type="hidden" name="view" value="action"> <input
        type="hidden" name="action" value="adminManagerSync"> <input
        type="hidden" name="actionType"> <input type="hidden"
                                                name="accessLevel">

    <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tbody>
        <tr>
            <td height="20" style="padding: 0 0 0 10px;">
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tbody>
                    <tr>
                        <td width="7"><img src="<c:url value='/res/img/' />MarketReadIcon3.gif" alt=""
                                           width="4" height="5" style="padding-bottom: 3px"></td>
                        <td class="CopyText2">회원 목록</td>
                        <td align="right"
                            style="padding-right: 10px; padding-bottom: 5px; font-size: 12px;"
                            class="b"></td>
                    </tr>
                    </tbody>
                </table>
            </td>
        </tr>
        <tr>
            <td bgcolor="#FFFFFF" style="padding: 0 7px 0 7px">
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tbody>
                    <tr>
                        <td height="1" bgcolor="#7bae7c"></td>
                    </tr>
                    <tr>
                        <td bgcolor="#93bb93">
                            <table width="100%" border="0" cellspacing="1" cellpadding="0">
                                <tbody>
                                <tr>
                                    <td width="40" height="50" align="center"
                                        class="MyMoneyText1 bgGreen"><input type="checkbox"
                                                                            id="manageCheckBox"></td>
                                    <td width="60" align="center" class="MyMoneyText1 bgGreen">번호</td>
                                    <td width="150" align="center" class="MyMoneyText1 bgGreen">아이디</td>
                                    <td width="100" align="center" class="MyMoneyText1 bgGreen">닉네임</td>
                                    <td width="200" align="center" class="MyMoneyText1 bgGreen">추천인</td>
                                    <td width="80" align="center" class="MyMoneyText1 bgGreen">포인트</td>
                                    <td width="40" align="center" class="MyMoneyText1 bgGreen">위치</td>
                                    <td width="120" align="center" class="MyMoneyText1 bgGreen">전화번호</td>
                                    <td width="130" align="center" class="MyMoneyText1 bgGreen">가입일</td>
                                    <td width="130" align="center" class="MyMoneyText1 bgGreen">최종로그인</td>
                                    <td width="130" align="center" class="MyMoneyText1 bgGreen">발송일</td>
                                    <td width="80" align="center" class="MyMoneyText1 bgGreen">푸시정보</td>
                                    <td width="80" align="center" class="MyMoneyText1 bgGreen">제재</td>
                                    <td width="130" align="center" class="MyMoneyText1 bgGreen">관리</td>
                                    <td width="130" align="center" class="MyMoneyText1 bgGreen">인증정보</td>
                                    <td width="160" align="center" class="MyMoneyText1 bgGreen">정기권
                                        정보</td>
                                </tr>


                                <tr
                                        onmouseover="this.style.backgroundColor='#f2f7f2'"
                                        onmouseout="this.style.backgroundColor='#FFFFFF'"
                                        bgcolor="#FFFFFF"
                                        style="background-color: rgb(255, 255, 255);">
                                    <td height="40" align="center" class="LoginText2 bgGray"><input
                                            type="checkbox" name="userid[]" value="27924"
                                            class="useridCheckBox"></td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;"
                                        class="LoginText2 bgGray">24735</td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        27924<br>(355500071515381)<br> <a
                                            onclick="window.open('?view=memberList&type=search&searchType=email&query=eco4022@gmail.com')"
                                            target="_blank" style="cursor: pointer">eco4022@gmail.com</a>
                                    </td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;"
                                        class="bgSky">백작4022<br> M<br> <a
                                            onclick="window.open('?view=memberList&type=search&searchType=version&query=178')"
                                            target="_blank" style="cursor: pointer">178</a> N
                                    </td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;"
                                        class=""></td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        0</td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        <a
                                                href="http://m.map.naver.com/map.nhn?lng=126.6904974&lat=37.7015881&dlevel=11"
                                                target="_blank">위치</a>
                                    </td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        (SKT)<br>010-5414-9660<br>
                                        <a
                                                href="?view=androidDevices&type=search&searchType=deviceName&query=herolteskt"
                                                style="color: #FF6600" target="_blank"
                                                title="Samsung
Galaxy S7 
1440 * 2560 (640DPI)
API: 23">herolteskt</a>
                                        <br> <a
                                            onclick="window.open('?view=memberList&type=search&searchType=device&query=herolteskt')"
                                            target="_blank" style="cursor: pointer">[기기검색]</a>
                                    </td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        2018-04-13 10:51:39</td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        2018-04-13 11:02:17<br>218.237.204.112
                                    </td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;"></td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;"
                                        class="bgSky"
                                        title="APA91bGgX4L56uGhYlIEAJPmF2ckQROEmiAbMxIgZ5bWr_fM_g5R6H94B9SnPcaqFY1Nfnyk8lShVPFkKFzqsfzhHAXAp30q_symYEqmnTQwHy-CV4I8UvuQprQ9I3tGe-zIpCRR01uh">
                                        APA91bGgX4</td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;"
                                        title="정상">정상</td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        <a href="#"
                                           onclick="adminManager('changeNickname','27924','0');return false;">[닉네임수정요청]</a><br>
                                        <a href="#"
                                           onclick="adminManager('block','27924','4');return false;">[1일]</a>
                                        <a href="#"
                                           onclick="adminManager('block','27924','6');return false;">[7일]</a>
                                        <a href="#"
                                           onclick="adminManager('block','27924','8');return false;">[365일]</a><br>
                                        <a href="#"
                                           onclick="adminManager('withdraw','27924','0');return false;">[탈퇴]</a>
                                        <a href="#"
                                           onclick="adminManager('adminWithdraw','27924','0');return false;">[강제탈퇴]</a>
                                    </td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        <span style="color: #0000FF">인증완료</span><br>2018-04-13
                                        10:52:09
                                    </td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        정기권 없음 <br> <a href="#"
                                                       onclick="requestGrantMembership('27924', '1DAY');return false;">[1일권]</a>
                                        <a href="#"
                                           onclick="requestGrantMembership('27924', '7DAYS');return false;">[7일권]</a>
                                        <a href="#"
                                           onclick="requestGrantMembership('27924', '30DAYS');return false;">[30일권]</a><br>
                                        <a href="#"
                                           onclick="requestGrantMembership('27924', '90DAYS');return false;">[90일권]</a>
                                    </td>
                                </tr>

                                <tr
                                        onmouseover="this.style.backgroundColor='#f2f7f2'"
                                        onmouseout="this.style.backgroundColor='#FFFFFF'"
                                        bgcolor="#FFFFFF"
                                        style="background-color: rgb(255, 255, 255);">
                                    <td height="40" align="center" class="LoginText2 bgGray"><input
                                            type="checkbox" name="userid[]" value="27923"
                                            class="useridCheckBox"></td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;"
                                        class="LoginText2 bgGray">24734</td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        27923<br>(358335081585620)<br> <a
                                            onclick="window.open('?view=memberList&type=search&searchType=email&query=jjss754321@gmail.com')"
                                            target="_blank" style="cursor: pointer">jjss754321@gmail.com</a>
                                    </td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;"
                                        class="bgSky">장종수<br> M<br> <a
                                            onclick="window.open('?view=memberList&type=search&searchType=version&query=178')"
                                            target="_blank" style="cursor: pointer">178</a> N
                                    </td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;"
                                        class="bgSky"><a
                                            onclick="window.open('?view=memberList&type=search&searchType=idx&query=1975')"
                                            target="_blank" style="cursor: pointer">추천인 : 1975</a></td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        0</td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        <a
                                                href="http://m.map.naver.com/map.nhn?lng=126.8494152&lat=37.3114097&dlevel=11"
                                                target="_blank">위치</a>
                                    </td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        (LGT)<br>010-3994-1975<br>
                                        <a
                                                href="?view=androidDevices&type=search&searchType=deviceName&query=greatlteks"
                                                target="_blank">greatlteks</a> <br> <a
                                            onclick="window.open('?view=memberList&type=search&searchType=device&query=greatlteks')"
                                            target="_blank" style="cursor: pointer">[기기검색]</a>
                                    </td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        2018-04-13 08:47:54</td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        2018-04-13 09:42:32<br>117.111.11.220
                                    </td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        2018-04-13 09:24:10</td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;"
                                        class="bgSky"
                                        title="APA91bF_mROFe2gFypeDG3wXq8u6dW9htwps6EwO5x1nx6Em18o1lxhhZ8FDAYsQYk86AeHGa6KS5ogFmKDiI1KN462hQnC2MDq6OqM0RUppAgqe0LZycLBmz_s_Y3XNdjvicofivIK4">
                                        APA91bF_mR</td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;"
                                        title="정상">정상</td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        <a href="#"
                                           onclick="adminManager('changeNickname','27923','0');return false;">[닉네임수정요청]</a><br>
                                        <a href="#"
                                           onclick="adminManager('block','27923','4');return false;">[1일]</a>
                                        <a href="#"
                                           onclick="adminManager('block','27923','6');return false;">[7일]</a>
                                        <a href="#"
                                           onclick="adminManager('block','27923','8');return false;">[365일]</a><br>
                                        <a href="#"
                                           onclick="adminManager('withdraw','27923','0');return false;">[탈퇴]</a>
                                        <a href="#"
                                           onclick="adminManager('adminWithdraw','27923','0');return false;">[강제탈퇴]</a>
                                    </td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        <span style="color: #0000FF">인증완료</span><br>2018-04-13
                                        08:49:56
                                    </td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        정기권 없음 <br> <a href="#"
                                                       onclick="requestGrantMembership('27923', '1DAY');return false;">[1일권]</a>
                                        <a href="#"
                                           onclick="requestGrantMembership('27923', '7DAYS');return false;">[7일권]</a>
                                        <a href="#"
                                           onclick="requestGrantMembership('27923', '30DAYS');return false;">[30일권]</a><br>
                                        <a href="#"
                                           onclick="requestGrantMembership('27923', '90DAYS');return false;">[90일권]</a>
                                    </td>
                                </tr>

                                <tr
                                        onmouseover="this.style.backgroundColor='#f2f7f2'"
                                        onmouseout="this.style.backgroundColor='#FFFFFF'"
                                        bgcolor="#FFFFFF"
                                        style="background-color: rgb(255, 255, 255);">
                                    <td height="40" align="center" class="LoginText2 bgGray"><input
                                            type="checkbox" name="userid[]" value="27922"
                                            class="useridCheckBox"></td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;"
                                        class="LoginText2 bgGray">24733</td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        27922<br>(352464070315231)<br> <a
                                            onclick="window.open('?view=memberList&type=search&searchType=email&query=leesoochul73@gmail.com')"
                                            target="_blank" style="cursor: pointer">leesoochul73@gmail.com</a>
                                    </td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;"
                                        class=""><br> <br> <a
                                            onclick="window.open('?view=memberList&type=search&searchType=version&query=178')"
                                            target="_blank" style="cursor: pointer">178</a> Y</td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;"
                                        class=""></td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        0</td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        <a
                                                href="http://m.map.naver.com/map.nhn?lng=127.1742588&lat=37.8494908&dlevel=11"
                                                target="_blank">위치</a>
                                    </td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        (KT)<br>010-4130-9396<br>
                                        <a
                                                href="?view=androidDevices&type=search&searchType=deviceName&query=zenltektt"
                                                style="color: #00AA00" target="_blank"
                                                title="Samsung
Galaxy S6 Edge+
1440 * 2560 (560DPI)
API: 22">zenltektt</a>
                                        <br> <a
                                            onclick="window.open('?view=memberList&type=search&searchType=device&query=zenltektt')"
                                            target="_blank" style="cursor: pointer">[기기검색]</a>
                                    </td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        2018-04-13 06:15:05</td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        2018-04-13 06:15:05<br>175.223.30.182
                                    </td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        2018-04-13 07:39:21</td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;"
                                        class="bgRed"
                                        title="APA91bECBO2L-YC-NlgpDCD9m2M8vIm_uGBLdBHLEq-k-J8iV9BU_uXFZ4iCWN3-qQ2b7mI0USE1lRqRVxclYC1ccqpH-EOlZ86Xsz3lXKc-T4acLE4ZJVNzoCTVRTfa1yeQJKu4_94p">
                                        APA91bECBO</td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;"
                                        title="정상">정상</td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        <a href="#"
                                           onclick="adminManager('changeNickname','27922','0');return false;">[닉네임수정요청]</a><br>
                                        <a href="#"
                                           onclick="adminManager('block','27922','4');return false;">[1일]</a>
                                        <a href="#"
                                           onclick="adminManager('block','27922','6');return false;">[7일]</a>
                                        <a href="#"
                                           onclick="adminManager('block','27922','8');return false;">[365일]</a><br>
                                        <a href="#"
                                           onclick="adminManager('withdraw','27922','0');return false;">[탈퇴]</a>
                                        <a href="#"
                                           onclick="adminManager('adminWithdraw','27922','0');return false;">[강제탈퇴]</a>
                                    </td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        <span style="color: #FF0000">미인증</span><br>
                                        <a href="#"
                                           onclick="memberManager('deviceConfirm','27922');return false;">[인증
                                            재시도]</a>
                                    </td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        정기권 없음 <br> <a href="#"
                                                       onclick="requestGrantMembership('27922', '1DAY');return false;">[1일권]</a>
                                        <a href="#"
                                           onclick="requestGrantMembership('27922', '7DAYS');return false;">[7일권]</a>
                                        <a href="#"
                                           onclick="requestGrantMembership('27922', '30DAYS');return false;">[30일권]</a><br>
                                        <a href="#"
                                           onclick="requestGrantMembership('27922', '90DAYS');return false;">[90일권]</a>
                                    </td>
                                </tr>

                                <tr
                                        onmouseover="this.style.backgroundColor='#f2f7f2'"
                                        onmouseout="this.style.backgroundColor='#FFFFFF'"
                                        bgcolor="#FFFFFF"
                                        style="background-color: rgb(255, 255, 255);">
                                    <td height="40" align="center" class="LoginText2 bgGray"><input
                                            type="checkbox" name="userid[]" value="27921"
                                            class="useridCheckBox"></td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;"
                                        class="LoginText2 bgGray">24732</td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        27921<br>(356358080716303)<br> <a
                                            onclick="window.open('?view=memberList&type=search&searchType=email&query=cok7762@gmail.com')"
                                            target="_blank" style="cursor: pointer">cok7762@gmail.com</a>
                                    </td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;"
                                        class="bgSky">고배당~맨<br> M<br> <a
                                            onclick="window.open('?view=memberList&type=search&searchType=version&query=178')"
                                            target="_blank" style="cursor: pointer">178</a> N
                                    </td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;"
                                        class=""></td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        0</td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        <a
                                                href="http://m.map.naver.com/map.nhn?lng=127.0788515&lat=37.5635333&dlevel=11"
                                                target="_blank">위치</a>
                                    </td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        (LGT)<br>010-7762-7210<br>
                                        <a
                                                href="?view=androidDevices&type=search&searchType=deviceName&query=dreamlteks"
                                                target="_blank">dreamlteks</a> <br> <a
                                            onclick="window.open('?view=memberList&type=search&searchType=device&query=dreamlteks')"
                                            target="_blank" style="cursor: pointer">[기기검색]</a>
                                    </td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        2018-04-13 05:27:07</td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        2018-04-13 05:29:15<br>117.111.1.118
                                    </td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        2018-04-13 06:06:53</td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;"
                                        class="bgSky"
                                        title="APA91bH9ExLjEVS5gyJXGv8mtWg23X-5a4E0qqeWChjAeiEom5CUbl9DJu0trXOOwP2BIvuE0WV3wMlZx2MqFmPhWQWxJq8hY_4HfI-yTM0HNAMuOZD-eXNpe7-Q5uaKRlKK1Qnb4Xam">
                                        APA91bH9Ex</td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;"
                                        title="정상">정상</td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        <a href="#"
                                           onclick="adminManager('changeNickname','27921','0');return false;">[닉네임수정요청]</a><br>
                                        <a href="#"
                                           onclick="adminManager('block','27921','4');return false;">[1일]</a>
                                        <a href="#"
                                           onclick="adminManager('block','27921','6');return false;">[7일]</a>
                                        <a href="#"
                                           onclick="adminManager('block','27921','8');return false;">[365일]</a><br>
                                        <a href="#"
                                           onclick="adminManager('withdraw','27921','0');return false;">[탈퇴]</a>
                                        <a href="#"
                                           onclick="adminManager('adminWithdraw','27921','0');return false;">[강제탈퇴]</a>
                                    </td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        <span style="color: #0000FF">인증완료</span><br>2018-04-13
                                        05:29:16
                                    </td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        정기권 없음 <br> <a href="#"
                                                       onclick="requestGrantMembership('27921', '1DAY');return false;">[1일권]</a>
                                        <a href="#"
                                           onclick="requestGrantMembership('27921', '7DAYS');return false;">[7일권]</a>
                                        <a href="#"
                                           onclick="requestGrantMembership('27921', '30DAYS');return false;">[30일권]</a><br>
                                        <a href="#"
                                           onclick="requestGrantMembership('27921', '90DAYS');return false;">[90일권]</a>
                                    </td>
                                </tr>

                                <tr
                                        onmouseover="this.style.backgroundColor='#f2f7f2'"
                                        onmouseout="this.style.backgroundColor='#FFFFFF'"
                                        bgcolor="#FFFFFF"
                                        style="background-color: rgb(255, 255, 255);">
                                    <td height="40" align="center" class="LoginText2 bgGray"><input
                                            type="checkbox" name="userid[]" value="27920"
                                            class="useridCheckBox"></td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;"
                                        class="LoginText2 bgGray">24731</td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        27920<br>(358490072501092)<br> <a
                                            onclick="window.open('?view=memberList&type=search&searchType=email&query=limsang1029@gmail.com')"
                                            target="_blank" style="cursor: pointer">limsang1029@gmail.com</a>
                                    </td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;"
                                        class=""><br> <br> <a
                                            onclick="window.open('?view=memberList&type=search&searchType=version&query=178')"
                                            target="_blank" style="cursor: pointer">178</a> Y</td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;"
                                        class=""></td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        0</td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        <a
                                                href="http://m.map.naver.com/map.nhn?lng=127.4014989&lat=36.342016&dlevel=11"
                                                target="_blank">위치</a>
                                    </td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        (KT)<br>010-3812-9561<br>
                                        <a
                                                href="?view=androidDevices&type=search&searchType=deviceName&query=j7xeltektt"
                                                style="color: #00AA00" target="_blank"
                                                title="Samsung
Galaxy J7(2016)
720 * 1280 (320DPI)
API: 23">j7xeltektt</a>
                                        <br> <a
                                            onclick="window.open('?view=memberList&type=search&searchType=device&query=j7xeltektt')"
                                            target="_blank" style="cursor: pointer">[기기검색]</a>
                                    </td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        2018-04-12 23:33:20</td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        2018-04-12 23:34:25<br>103.234.7.240
                                    </td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        2018-04-13 06:06:53</td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;"
                                        class="bgRed"
                                        title="APA91bFX-cCXuQb22WVa--apD-HOMp61FP3oAHcoNT8ZQDyOXoRy0Ku2FtQg_EROcj_-jOXK291_nvYrRwexgTaYCs_cpJXhM5OL4rh9OH4wKCghhPJixihNaibXdCag3HvHr71z0nY3">
                                        APA91bFX-c</td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;"
                                        title="정상">정상</td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        <a href="#"
                                           onclick="adminManager('changeNickname','27920','0');return false;">[닉네임수정요청]</a><br>
                                        <a href="#"
                                           onclick="adminManager('block','27920','4');return false;">[1일]</a>
                                        <a href="#"
                                           onclick="adminManager('block','27920','6');return false;">[7일]</a>
                                        <a href="#"
                                           onclick="adminManager('block','27920','8');return false;">[365일]</a><br>
                                        <a href="#"
                                           onclick="adminManager('withdraw','27920','0');return false;">[탈퇴]</a>
                                        <a href="#"
                                           onclick="adminManager('adminWithdraw','27920','0');return false;">[강제탈퇴]</a>
                                    </td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        <span style="color: #FF0000">미인증</span><br>
                                        <a href="#"
                                           onclick="memberManager('deviceConfirm','27920');return false;">[인증
                                            재시도]</a>
                                    </td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        정기권 없음 <br> <a href="#"
                                                       onclick="requestGrantMembership('27920', '1DAY');return false;">[1일권]</a>
                                        <a href="#"
                                           onclick="requestGrantMembership('27920', '7DAYS');return false;">[7일권]</a>
                                        <a href="#"
                                           onclick="requestGrantMembership('27920', '30DAYS');return false;">[30일권]</a><br>
                                        <a href="#"
                                           onclick="requestGrantMembership('27920', '90DAYS');return false;">[90일권]</a>
                                    </td>
                                </tr>

                                <tr
                                        onmouseover="this.style.backgroundColor='#f2f7f2'"
                                        onmouseout="this.style.backgroundColor='#FFFFFF'"
                                        bgcolor="#FFFFFF"
                                        style="background-color: rgb(255, 255, 255);">
                                    <td height="40" align="center" class="LoginText2 bgGray"><input
                                            type="checkbox" name="userid[]" value="27919"
                                            class="useridCheckBox"></td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;"
                                        class="LoginText2 bgGray">24730</td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        27919<br>(352160080622372)<br> <a
                                            onclick="window.open('?view=memberList&type=search&searchType=email&query=woosun2619@gmail.com')"
                                            target="_blank" style="cursor: pointer">woosun2619@gmail.com</a>
                                    </td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;"
                                        class="bgSky">에어컨<br> M<br> <a
                                            onclick="window.open('?view=memberList&type=search&searchType=version&query=178')"
                                            target="_blank" style="cursor: pointer">178</a> N
                                    </td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;"
                                        class=""></td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        0</td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        <a
                                                href="http://m.map.naver.com/map.nhn?lng=127.01959086775&lat=37.252499514504&dlevel=11"
                                                target="_blank">위치</a>
                                    </td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        (LGT)<br>010-3955-2619<br>
                                        <a
                                                href="?view=androidDevices&type=search&searchType=deviceName&query=elsa_lgu_kr"
                                                target="_blank">elsa_lgu_kr</a> <br> <a
                                            onclick="window.open('?view=memberList&type=search&searchType=device&query=elsa_lgu_kr')"
                                            target="_blank" style="cursor: pointer">[기기검색]</a>
                                    </td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        2018-04-12 22:12:45</td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        2018-04-13 05:50:03<br>117.111.26.130
                                    </td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        2018-04-13 09:35:48</td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;"
                                        class="bgSky"
                                        title="APA91bEJzP7iLVlU-lvgLA4zWtUJ1uEnuM_G4KRvFURb3e4F07tjpGoz3tThYoKO-0mf44JT4y3aIOaBoYSfQyAzNc_u2e4sFcQyBykT9fCMBN611NDnCfF2Jw0ar1fn68Q33B_Dfl53">
                                        APA91bEJzP</td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;"
                                        title="정상">정상</td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        <a href="#"
                                           onclick="adminManager('changeNickname','27919','0');return false;">[닉네임수정요청]</a><br>
                                        <a href="#"
                                           onclick="adminManager('block','27919','4');return false;">[1일]</a>
                                        <a href="#"
                                           onclick="adminManager('block','27919','6');return false;">[7일]</a>
                                        <a href="#"
                                           onclick="adminManager('block','27919','8');return false;">[365일]</a><br>
                                        <a href="#"
                                           onclick="adminManager('withdraw','27919','0');return false;">[탈퇴]</a>
                                        <a href="#"
                                           onclick="adminManager('adminWithdraw','27919','0');return false;">[강제탈퇴]</a>
                                    </td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        <span style="color: #0000FF">인증완료</span><br>2018-04-12
                                        22:13:07
                                    </td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        정기권 없음 <br> <a href="#"
                                                       onclick="requestGrantMembership('27919', '1DAY');return false;">[1일권]</a>
                                        <a href="#"
                                           onclick="requestGrantMembership('27919', '7DAYS');return false;">[7일권]</a>
                                        <a href="#"
                                           onclick="requestGrantMembership('27919', '30DAYS');return false;">[30일권]</a><br>
                                        <a href="#"
                                           onclick="requestGrantMembership('27919', '90DAYS');return false;">[90일권]</a>
                                    </td>
                                </tr>

                                <tr
                                        onmouseover="this.style.backgroundColor='#f2f7f2'"
                                        onmouseout="this.style.backgroundColor='#FFFFFF'"
                                        bgcolor="#FFFFFF"
                                        style="background-color: rgb(255, 255, 255);">
                                    <td height="40" align="center" class="LoginText2 bgGray"><input
                                            type="checkbox" name="userid[]" value="27918"
                                            class="useridCheckBox"></td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;"
                                        class="LoginText2 bgGray">24729</td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        27918<br>(352260058099494)<br> <a
                                            onclick="window.open('?view=memberList&type=search&searchType=email&query=mmpp4918@gmail.com')"
                                            target="_blank" style="cursor: pointer">mmpp4918@gmail.com</a>
                                    </td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;"
                                        class="bgSky">화이팅<br> M<br> <a
                                            onclick="window.open('?view=memberList&type=search&searchType=version&query=178')"
                                            target="_blank" style="cursor: pointer">178</a> Y
                                    </td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;"
                                        class=""></td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        50</td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        <a
                                                href="http://m.map.naver.com/map.nhn?lng=126.5333768&lat=33.4612793&dlevel=11"
                                                target="_blank">위치</a>
                                    </td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        <br>
                                        <br>
                                        <a
                                                href="?view=androidDevices&type=search&searchType=deviceName&query=c1skt"
                                                style="color: #00AA00" target="_blank"
                                                title="Samsung
Galaxy S3
720 * 1280 (320DPI)
API: 15">c1skt</a>
                                        <br> <a
                                            onclick="window.open('?view=memberList&type=search&searchType=device&query=c1skt')"
                                            target="_blank" style="cursor: pointer">[기기검색]</a>
                                    </td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        2018-04-12 19:58:57</td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        2018-04-12 19:59:32<br>222.116.4.93
                                    </td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        2018-04-12 21:18:02</td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;"
                                        class="bgRed"
                                        title="APA91bFDPEYeE0HRZCDQsW55_jml6DB1RWSrDlhTWsly1NrtFXIGBZxTiaw2WNISJhVAz17kqMQIgQy55LNoMuXd-_rbOb5iQteaqZBCyd26Z1yy1dqRVsTLJJWOz4YjJrNcinAHO6Ll">
                                        APA91bFDPE</td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;"
                                        title="정상">정상</td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        <a href="#"
                                           onclick="adminManager('changeNickname','27918','0');return false;">[닉네임수정요청]</a><br>
                                        <a href="#"
                                           onclick="adminManager('block','27918','4');return false;">[1일]</a>
                                        <a href="#"
                                           onclick="adminManager('block','27918','6');return false;">[7일]</a>
                                        <a href="#"
                                           onclick="adminManager('block','27918','8');return false;">[365일]</a><br>
                                        <a href="#"
                                           onclick="adminManager('withdraw','27918','0');return false;">[탈퇴]</a>
                                        <a href="#"
                                           onclick="adminManager('adminWithdraw','27918','0');return false;">[강제탈퇴]</a>
                                    </td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        <span style="color: #0000FF">인증완료</span><br>2018-04-12
                                        19:59:34
                                    </td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        정기권 없음 <br> <a href="#"
                                                       onclick="requestGrantMembership('27918', '1DAY');return false;">[1일권]</a>
                                        <a href="#"
                                           onclick="requestGrantMembership('27918', '7DAYS');return false;">[7일권]</a>
                                        <a href="#"
                                           onclick="requestGrantMembership('27918', '30DAYS');return false;">[30일권]</a><br>
                                        <a href="#"
                                           onclick="requestGrantMembership('27918', '90DAYS');return false;">[90일권]</a>
                                    </td>
                                </tr>

                                <tr
                                        onmouseover="this.style.backgroundColor='#f2f7f2'"
                                        onmouseout="this.style.backgroundColor='#FFFFFF'"
                                        bgcolor="#FFFFFF">
                                    <td height="40" align="center" class="LoginText2 bgGray"><input
                                            type="checkbox" name="userid[]" value="27917"
                                            class="useridCheckBox"></td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;"
                                        class="LoginText2 bgGray">24728</td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        27917<br>(351903080108103)<br> <a
                                            onclick="window.open('?view=memberList&type=search&searchType=email&query=rkdtl10112@gmail.com')"
                                            target="_blank" style="cursor: pointer">rkdtl10112@gmail.com</a>
                                    </td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;"
                                        class="bgSky">로이<br> M<br> <a
                                            onclick="window.open('?view=memberList&type=search&searchType=version&query=178')"
                                            target="_blank" style="cursor: pointer">178</a> Y
                                    </td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;"
                                        class=""></td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        0</td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        <a
                                                href="http://m.map.naver.com/map.nhn?lng=0&lat=0&dlevel=11"
                                                target="_blank">위치</a>
                                    </td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        (SKT)<br>010-3144-6863<br>
                                        <a
                                                href="?view=androidDevices&type=search&searchType=deviceName&query=T-1000"
                                                target="_blank">T-1000</a> <br> <a
                                            onclick="window.open('?view=memberList&type=search&searchType=device&query=T-1000')"
                                            target="_blank" style="cursor: pointer">[기기검색]</a>
                                    </td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        2018-04-12 17:01:24</td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        2018-04-12 17:02:01<br>218.148.123.201
                                    </td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        2018-04-13 07:39:21</td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;"
                                        class="bgRed"
                                        title="APA91bGkemU53TDI-qcu9BkIzNOic3z-m5TigzjFRgXqEmFCzxUBw_u3WUat5L-aOY8tdW0uEOlfVM5y6JeRp4oMmdI6iWwuwpXKr7Hcp88wpkji7OY3B0AAET1bPkMFrGuvXhCR8RC8">
                                        APA91bGkem</td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;"
                                        title="정상">정상</td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        <a href="#"
                                           onclick="adminManager('changeNickname','27917','0');return false;">[닉네임수정요청]</a><br>
                                        <a href="#"
                                           onclick="adminManager('block','27917','4');return false;">[1일]</a>
                                        <a href="#"
                                           onclick="adminManager('block','27917','6');return false;">[7일]</a>
                                        <a href="#"
                                           onclick="adminManager('block','27917','8');return false;">[365일]</a><br>
                                        <a href="#"
                                           onclick="adminManager('withdraw','27917','0');return false;">[탈퇴]</a>
                                        <a href="#"
                                           onclick="adminManager('adminWithdraw','27917','0');return false;">[강제탈퇴]</a>
                                    </td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        <span style="color: #0000FF">인증완료</span><br>2018-04-12
                                        17:02:01
                                    </td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        정기권 없음 <br> <a href="#"
                                                       onclick="requestGrantMembership('27917', '1DAY');return false;">[1일권]</a>
                                        <a href="#"
                                           onclick="requestGrantMembership('27917', '7DAYS');return false;">[7일권]</a>
                                        <a href="#"
                                           onclick="requestGrantMembership('27917', '30DAYS');return false;">[30일권]</a><br>
                                        <a href="#"
                                           onclick="requestGrantMembership('27917', '90DAYS');return false;">[90일권]</a>
                                    </td>
                                </tr>

                                <tr
                                        onmouseover="this.style.backgroundColor='#f2f7f2'"
                                        onmouseout="this.style.backgroundColor='#FFFFFF'"
                                        bgcolor="#FFFFFF"
                                        style="background-color: rgb(255, 255, 255);">
                                    <td height="40" align="center" class="LoginText2 bgGray"><input
                                            type="checkbox" name="userid[]" value="27916"
                                            class="useridCheckBox"></td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;"
                                        class="LoginText2 bgGray">24727</td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        27916<br>(351932060318424)<br> <a
                                            onclick="window.open('?view=memberList&type=search&searchType=email&query=lishengyu1978@gmail.com')"
                                            target="_blank" style="cursor: pointer">lishengyu1978@gmail.com</a>
                                    </td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;"
                                        class="bgSky">축구의 달인<br> M<br> <a
                                            onclick="window.open('?view=memberList&type=search&searchType=version&query=178')"
                                            target="_blank" style="cursor: pointer">178</a> Y
                                    </td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;"
                                        class=""></td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        0</td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        <a
                                                href="http://m.map.naver.com/map.nhn?lng=0&lat=0&dlevel=11"
                                                target="_blank">위치</a>
                                    </td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        <br>
                                        <br>
                                        <a
                                                href="?view=androidDevices&type=search&searchType=deviceName&query=klteskt"
                                                style="color: #00AA00" target="_blank"
                                                title="Samsung
Galaxy S5
1080 * 1920 (480DPI)
API: 15">klteskt</a>
                                        <br> <a
                                            onclick="window.open('?view=memberList&type=search&searchType=device&query=klteskt')"
                                            target="_blank" style="cursor: pointer">[기기검색]</a>
                                    </td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        2018-04-12 16:22:25</td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        2018-04-12 16:25:38<br>163.172.251.111
                                    </td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        2018-04-12 17:51:03</td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;"
                                        class="bgRed"
                                        title="APA91bG_1aWjfZTwG6pA1yOYDetB9z9x8OupKX6QX5U8-Faf-6HE0l0v2r4HadcB5FAZQNJIHxDCoZdHxrTNNHFVyNmYzevw0erMoCKNW3zim1DoI90urJJ79pUHk4QiXhRHdrXPCVRH">
                                        APA91bG_1a</td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;"
                                        title="정상">정상</td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        <a href="#"
                                           onclick="adminManager('changeNickname','27916','0');return false;">[닉네임수정요청]</a><br>
                                        <a href="#"
                                           onclick="adminManager('block','27916','4');return false;">[1일]</a>
                                        <a href="#"
                                           onclick="adminManager('block','27916','6');return false;">[7일]</a>
                                        <a href="#"
                                           onclick="adminManager('block','27916','8');return false;">[365일]</a><br>
                                        <a href="#"
                                           onclick="adminManager('withdraw','27916','0');return false;">[탈퇴]</a>
                                        <a href="#"
                                           onclick="adminManager('adminWithdraw','27916','0');return false;">[강제탈퇴]</a>
                                    </td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        <span style="color: #0000FF">인증완료</span><br>2018-04-12
                                        16:25:40
                                    </td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        정기권 없음 <br> <a href="#"
                                                       onclick="requestGrantMembership('27916', '1DAY');return false;">[1일권]</a>
                                        <a href="#"
                                           onclick="requestGrantMembership('27916', '7DAYS');return false;">[7일권]</a>
                                        <a href="#"
                                           onclick="requestGrantMembership('27916', '30DAYS');return false;">[30일권]</a><br>
                                        <a href="#"
                                           onclick="requestGrantMembership('27916', '90DAYS');return false;">[90일권]</a>
                                    </td>
                                </tr>

                                <tr
                                        onmouseover="this.style.backgroundColor='#f2f7f2'"
                                        onmouseout="this.style.backgroundColor='#FFFFFF'"
                                        bgcolor="#FFFFFF"
                                        style="background-color: rgb(255, 255, 255);">
                                    <td height="40" align="center" class="LoginText2 bgGray"><input
                                            type="checkbox" name="userid[]" value="27915"
                                            class="useridCheckBox"></td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;"
                                        class="LoginText2 bgGray">24726</td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        27915<br>(357146071633267)<br> <a
                                            onclick="window.open('?view=memberList&type=search&searchType=email&query=k01042125581@gmail.com')"
                                            target="_blank" style="cursor: pointer">k01042125581@gmail.com</a>
                                    </td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;"
                                        class=""><br> <br> <a
                                            onclick="window.open('?view=memberList&type=search&searchType=version&query=178')"
                                            target="_blank" style="cursor: pointer">178</a> Y</td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;"
                                        class=""></td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        0</td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        <a
                                                href="http://m.map.naver.com/map.nhn?lng=126.8591634&lat=37.5544142&dlevel=11"
                                                target="_blank">위치</a>
                                    </td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        (LGT)<br>010-4212-5581<br>
                                        <a
                                                href="?view=androidDevices&type=search&searchType=deviceName&query=h1_lgu_kr"
                                                target="_blank">h1_lgu_kr</a> <br> <a
                                            onclick="window.open('?view=memberList&type=search&searchType=device&query=h1_lgu_kr')"
                                            target="_blank" style="cursor: pointer">[기기검색]</a>
                                    </td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        2018-04-12 16:04:40</td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        2018-04-12 16:04:40<br>220.86.32.225
                                    </td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        2018-04-13 07:39:21</td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;"
                                        class="bgRed"
                                        title="APA91bFiHkmIMRT1nLRkK_t130XraZM4Iya66YqyXM9t0tiWiwbrPOxNBQqjiOfESGoXwQqcXpS9twxJlHrASs9snMzO1X6VFiYkkVaMx7XAGCoisyK02GV7fw6bO3aGXfjDc-Uixwjx">
                                        APA91bFiHk</td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;"
                                        title="정상">정상</td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        <a href="#"
                                           onclick="adminManager('changeNickname','27915','0');return false;">[닉네임수정요청]</a><br>
                                        <a href="#"
                                           onclick="adminManager('block','27915','4');return false;">[1일]</a>
                                        <a href="#"
                                           onclick="adminManager('block','27915','6');return false;">[7일]</a>
                                        <a href="#"
                                           onclick="adminManager('block','27915','8');return false;">[365일]</a><br>
                                        <a href="#"
                                           onclick="adminManager('withdraw','27915','0');return false;">[탈퇴]</a>
                                        <a href="#"
                                           onclick="adminManager('adminWithdraw','27915','0');return false;">[강제탈퇴]</a>
                                    </td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        <span style="color: #FF0000">미인증</span><br>
                                        <a href="#"
                                           onclick="memberManager('deviceConfirm','27915');return false;">[인증
                                            재시도]</a>
                                    </td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        정기권 없음 <br> <a href="#"
                                                       onclick="requestGrantMembership('27915', '1DAY');return false;">[1일권]</a>
                                        <a href="#"
                                           onclick="requestGrantMembership('27915', '7DAYS');return false;">[7일권]</a>
                                        <a href="#"
                                           onclick="requestGrantMembership('27915', '30DAYS');return false;">[30일권]</a><br>
                                        <a href="#"
                                           onclick="requestGrantMembership('27915', '90DAYS');return false;">[90일권]</a>
                                    </td>
                                </tr>

                                <tr
                                        onmouseover="this.style.backgroundColor='#f2f7f2'"
                                        onmouseout="this.style.backgroundColor='#FFFFFF'"
                                        bgcolor="#FFFFFF"
                                        style="background-color: rgb(255, 255, 255);">
                                    <td height="40" align="center" class="LoginText2 bgGray"><input
                                            type="checkbox" name="userid[]" value="27914"
                                            class="useridCheckBox"></td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;"
                                        class="LoginText2 bgGray">24725</td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        27914<br>
                                        <span style="color: red">(b34780346243afb)</span><br> <a
                                            onclick="window.open('?view=memberList&type=search&searchType=email&query=wiywiy0219@gmail.com')"
                                            target="_blank" style="cursor: pointer">wiywiy0219@gmail.com</a>
                                    </td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;"
                                        class="bgSky">면장<br> M<br> <a
                                            onclick="window.open('?view=memberList&type=search&searchType=version&query=178')"
                                            target="_blank" style="cursor: pointer">178</a> Y
                                    </td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;"
                                        class=""></td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        0</td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        <a
                                                href="http://m.map.naver.com/map.nhn?lng=127.0579764&lat=37.7311704&dlevel=11"
                                                target="_blank">위치</a>
                                    </td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        <br>
                                        <br>
                                        <a
                                                href="?view=androidDevices&type=search&searchType=deviceName&query=SHW-M305W"
                                                style="color: #00AA00" target="_blank"
                                                title="Samsung
Galaxy Tab 8.9
1280 * 752 (160DPI)
API: 13">SHW-M305W</a>
                                        <br> <a
                                            onclick="window.open('?view=memberList&type=search&searchType=device&query=SHW-M305W')"
                                            target="_blank" style="cursor: pointer">[기기검색]</a>
                                    </td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        2018-04-12 12:13:01</td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        2018-04-12 12:14:04<br>175.225.52.129
                                    </td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        2018-04-12 22:11:06</td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;"
                                        class="bgRed"
                                        title="APA91bEn_l6r5us-eJSoPo3hF4DMaUqSSEs9t2_nUIqS0sXINQ-GS8Vnm-0fk_OKpxMhAOzagmHnr4IIt2j-rz7-WlRkt4prTo5snbJNJtmwh4YiVDQkNA3EDGqfaVP11_KjDQbTVNPG">
                                        APA91bEn_l</td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;"
                                        title="정상">정상</td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        <a href="#"
                                           onclick="adminManager('changeNickname','27914','0');return false;">[닉네임수정요청]</a><br>
                                        <a href="#"
                                           onclick="adminManager('block','27914','4');return false;">[1일]</a>
                                        <a href="#"
                                           onclick="adminManager('block','27914','6');return false;">[7일]</a>
                                        <a href="#"
                                           onclick="adminManager('block','27914','8');return false;">[365일]</a><br>
                                        <a href="#"
                                           onclick="adminManager('withdraw','27914','0');return false;">[탈퇴]</a>
                                        <a href="#"
                                           onclick="adminManager('adminWithdraw','27914','0');return false;">[강제탈퇴]</a>
                                    </td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        <span style="color: #0000FF">인증완료</span><br>2018-04-12
                                        12:13:31
                                    </td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        정기권 없음 <br> <a href="#"
                                                       onclick="requestGrantMembership('27914', '1DAY');return false;">[1일권]</a>
                                        <a href="#"
                                           onclick="requestGrantMembership('27914', '7DAYS');return false;">[7일권]</a>
                                        <a href="#"
                                           onclick="requestGrantMembership('27914', '30DAYS');return false;">[30일권]</a><br>
                                        <a href="#"
                                           onclick="requestGrantMembership('27914', '90DAYS');return false;">[90일권]</a>
                                    </td>
                                </tr>

                                <tr
                                        onmouseover="this.style.backgroundColor='#f2f7f2'"
                                        onmouseout="this.style.backgroundColor='#FFFFFF'"
                                        bgcolor="#FFFFFF"
                                        style="background-color: rgb(255, 255, 255);">
                                    <td height="40" align="center" class="LoginText2 bgGray"><input
                                            type="checkbox" name="userid[]" value="27913"
                                            class="useridCheckBox"></td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;"
                                        class="LoginText2 bgGray">24724</td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        27913<br>(354730030044568)<br> <a
                                            onclick="window.open('?view=memberList&type=search&searchType=email&query=rlawlstn4894@gmail.com')"
                                            target="_blank" style="cursor: pointer">rlawlstn4894@gmail.com</a>
                                        <br>
                                        <a
                                                onclick="window.open('?view=memberList&type=samePersonY&sIdx=27913')"
                                                target="_blank"
                                                style="cursor: pointer; color: red; font-weight: bold;">동일회원
                                            1건</a>
                                    </td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;"
                                        class="bgSky">BEST<br> M<br> <a
                                            onclick="window.open('?view=memberList&type=search&searchType=version&query=178')"
                                            target="_blank" style="cursor: pointer">178</a> N
                                    </td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;"
                                        class=""></td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        50</td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        <a
                                                href="http://m.map.naver.com/map.nhn?lng=0&lat=0&dlevel=11"
                                                target="_blank">위치</a>
                                    </td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        (KT)<br>001010020946<br>
                                        <a
                                                href="?view=androidDevices&type=search&searchType=deviceName&query=SM-G955N"
                                                target="_blank">SM-G955N</a> <br> <a
                                            onclick="window.open('?view=memberList&type=search&searchType=device&query=SM-G955N')"
                                            target="_blank" style="cursor: pointer">[기기검색]</a>
                                    </td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        2018-04-12 11:15:21</td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        2018-04-12 11:15:29<br>123.142.117.153
                                    </td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        2018-04-13 08:00:23</td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;"
                                        class="bgSky"
                                        title="APA91bEaYuaLiRla6zZbAiFEo12DwGZrZWWfAiTMB3-Y90cALwlJqBXKepBtLi3u6Dwk2UddvlxsddJvuMk-E0WorP6YZiYFje8hptFZKU4o6_iln-OOnTbBYd6L-c59vzZaYSV-b3SE">
                                        APA91bEaYu</td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;"
                                        title="정상">정상</td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        <a href="#"
                                           onclick="adminManager('changeNickname','27913','0');return false;">[닉네임수정요청]</a><br>
                                        <a href="#"
                                           onclick="adminManager('block','27913','4');return false;">[1일]</a>
                                        <a href="#"
                                           onclick="adminManager('block','27913','6');return false;">[7일]</a>
                                        <a href="#"
                                           onclick="adminManager('block','27913','8');return false;">[365일]</a><br>
                                        <a href="#"
                                           onclick="adminManager('withdraw','27913','0');return false;">[탈퇴]</a>
                                        <a href="#"
                                           onclick="adminManager('adminWithdraw','27913','0');return false;">[강제탈퇴]</a>
                                    </td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        <span style="color: #0000FF">인증완료</span><br>2018-04-12
                                        11:15:30
                                    </td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        정기권 없음 <br> <a href="#"
                                                       onclick="requestGrantMembership('27913', '1DAY');return false;">[1일권]</a>
                                        <a href="#"
                                           onclick="requestGrantMembership('27913', '7DAYS');return false;">[7일권]</a>
                                        <a href="#"
                                           onclick="requestGrantMembership('27913', '30DAYS');return false;">[30일권]</a><br>
                                        <a href="#"
                                           onclick="requestGrantMembership('27913', '90DAYS');return false;">[90일권]</a>
                                    </td>
                                </tr>

                                <tr
                                        onmouseover="this.style.backgroundColor='#f2f7f2'"
                                        onmouseout="this.style.backgroundColor='#FFFFFF'"
                                        bgcolor="#FFFFFF">
                                    <td height="40" align="center" class="LoginText2 bgGray"><input
                                            type="checkbox" name="userid[]" value="27912"
                                            class="useridCheckBox"></td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;"
                                        class="LoginText2 bgGray">24723</td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        27912<br>(358490072938666)<br> <a
                                            onclick="window.open('?view=memberList&type=search&searchType=email&query=yanggyun65@gmail.com')"
                                            target="_blank" style="cursor: pointer">yanggyun65@gmail.com</a>
                                    </td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;"
                                        class=""><br> <br> <a
                                            onclick="window.open('?view=memberList&type=search&searchType=version&query=178')"
                                            target="_blank" style="cursor: pointer">178</a> Y</td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;"
                                        class=""></td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        0</td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        <a
                                                href="http://m.map.naver.com/map.nhn?lng=126.8589361&lat=37.3336348&dlevel=11"
                                                target="_blank">위치</a>
                                    </td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        (KT)<br>010-7237-1783<br>
                                        <a
                                                href="?view=androidDevices&type=search&searchType=deviceName&query=j7xeltektt"
                                                style="color: #00AA00" target="_blank"
                                                title="Samsung
Galaxy J7(2016)
720 * 1280 (320DPI)
API: 23">j7xeltektt</a>
                                        <br> <a
                                            onclick="window.open('?view=memberList&type=search&searchType=device&query=j7xeltektt')"
                                            target="_blank" style="cursor: pointer">[기기검색]</a>
                                    </td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        2018-04-12 10:16:15</td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        2018-04-12 10:16:57<br>175.212.165.8
                                    </td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        2018-04-12 16:08:54</td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;"
                                        class="bgRed"
                                        title="APA91bF7nDpI2KM9ZKFDoGKaZggFKWY_FJzab3lCspF-30AqqXnHHd31Jh0FDqOdh0KP0unF9BdwNt4IZSjzQvw7lEMUsqbb1b34fMSt53PMlPMw0ffNOK8iDo2QwvcKXXR6tHoFibHy">
                                        APA91bF7nD</td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;"
                                        title="정상">정상</td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        <a href="#"
                                           onclick="adminManager('changeNickname','27912','0');return false;">[닉네임수정요청]</a><br>
                                        <a href="#"
                                           onclick="adminManager('block','27912','4');return false;">[1일]</a>
                                        <a href="#"
                                           onclick="adminManager('block','27912','6');return false;">[7일]</a>
                                        <a href="#"
                                           onclick="adminManager('block','27912','8');return false;">[365일]</a><br>
                                        <a href="#"
                                           onclick="adminManager('withdraw','27912','0');return false;">[탈퇴]</a>
                                        <a href="#"
                                           onclick="adminManager('adminWithdraw','27912','0');return false;">[강제탈퇴]</a>
                                    </td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        <span style="color: #FF0000">미인증</span><br>
                                        <a href="#"
                                           onclick="memberManager('deviceConfirm','27912');return false;">[인증
                                            재시도]</a>
                                    </td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        정기권 없음 <br> <a href="#"
                                                       onclick="requestGrantMembership('27912', '1DAY');return false;">[1일권]</a>
                                        <a href="#"
                                           onclick="requestGrantMembership('27912', '7DAYS');return false;">[7일권]</a>
                                        <a href="#"
                                           onclick="requestGrantMembership('27912', '30DAYS');return false;">[30일권]</a><br>
                                        <a href="#"
                                           onclick="requestGrantMembership('27912', '90DAYS');return false;">[90일권]</a>
                                    </td>
                                </tr>

                                <tr
                                        onmouseover="this.style.backgroundColor='#f2f7f2'"
                                        onmouseout="this.style.backgroundColor='#FFFFFF'"
                                        bgcolor="#FFFFFF">
                                    <td height="40" align="center" class="LoginText2 bgGray"><input
                                            type="checkbox" name="userid[]" value="27911"
                                            class="useridCheckBox"></td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;"
                                        class="LoginText2 bgGray">24722</td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        27911<br>(358334083579434)<br> <a
                                            onclick="window.open('?view=memberList&type=search&searchType=email&query=parkhaeun0814@gmail.com')"
                                            target="_blank" style="cursor: pointer">parkhaeun0814@gmail.com</a>
                                    </td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;"
                                        class="bgSky">lindo<br> M<br> <a
                                            onclick="window.open('?view=memberList&type=search&searchType=version&query=178')"
                                            target="_blank" style="cursor: pointer">178</a> Y
                                    </td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;"
                                        class=""></td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        0</td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        <a
                                                href="http://m.map.naver.com/map.nhn?lng=-38.5108516&lat=-3.7241593&dlevel=11"
                                                target="_blank">위치</a>
                                    </td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        (KT)<br>010-5851-9999<br>
                                        <a
                                                href="?view=androidDevices&type=search&searchType=deviceName&query=greatlteks"
                                                target="_blank">greatlteks</a> <br> <a
                                            onclick="window.open('?view=memberList&type=search&searchType=device&query=greatlteks')"
                                            target="_blank" style="cursor: pointer">[기기검색]</a>
                                    </td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        2018-04-12 02:41:14</td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        2018-04-12 02:45:34<br>189.45.89.70
                                    </td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        2018-04-12 12:28:22</td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;"
                                        class="bgRed"
                                        title="APA91bFGNzfyvRzFgM5cxnedi3hl8XMFatoVqliFJQQbq1l_xnTSSZPmYmolgJd9UGlkF-5pblKFrqVkiPVrJmpZqCqI6BMCqghY3Q6oLzatbd8xRQoclnzU0-G6Km47KTxRCJqe0KFg">
                                        APA91bFGNz</td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;"
                                        title="정상">정상</td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        <a href="#"
                                           onclick="adminManager('changeNickname','27911','0');return false;">[닉네임수정요청]</a><br>
                                        <a href="#"
                                           onclick="adminManager('block','27911','4');return false;">[1일]</a>
                                        <a href="#"
                                           onclick="adminManager('block','27911','6');return false;">[7일]</a>
                                        <a href="#"
                                           onclick="adminManager('block','27911','8');return false;">[365일]</a><br>
                                        <a href="#"
                                           onclick="adminManager('withdraw','27911','0');return false;">[탈퇴]</a>
                                        <a href="#"
                                           onclick="adminManager('adminWithdraw','27911','0');return false;">[강제탈퇴]</a>
                                    </td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        <span style="color: #0000FF">인증완료</span><br>2018-04-12
                                        02:41:57
                                    </td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        정기권 없음 <br> <a href="#"
                                                       onclick="requestGrantMembership('27911', '1DAY');return false;">[1일권]</a>
                                        <a href="#"
                                           onclick="requestGrantMembership('27911', '7DAYS');return false;">[7일권]</a>
                                        <a href="#"
                                           onclick="requestGrantMembership('27911', '30DAYS');return false;">[30일권]</a><br>
                                        <a href="#"
                                           onclick="requestGrantMembership('27911', '90DAYS');return false;">[90일권]</a>
                                    </td>
                                </tr>

                                <tr
                                        onmouseover="this.style.backgroundColor='#f2f7f2'"
                                        onmouseout="this.style.backgroundColor='#FFFFFF'"
                                        bgcolor="#FFFFFF"
                                        style="background-color: rgb(255, 255, 255);">
                                    <td height="40" align="center" class="LoginText2 bgGray"><input
                                            type="checkbox" name="userid[]" value="27910"
                                            class="useridCheckBox"></td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;"
                                        class="LoginText2 bgGray">24721</td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        27910<br>(359936075169070)<br> <a
                                            onclick="window.open('?view=memberList&type=search&searchType=email&query=uysuhg@gmail.com')"
                                            target="_blank" style="cursor: pointer">uysuhg@gmail.com</a>
                                    </td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;"
                                        class=""><br> <br> <a
                                            onclick="window.open('?view=memberList&type=search&searchType=version&query=178')"
                                            target="_blank" style="cursor: pointer">178</a> Y</td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;"
                                        class=""></td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        0</td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        <a
                                                href="http://m.map.naver.com/map.nhn?lng=126.7760779&lat=37.7620205&dlevel=11"
                                                target="_blank">위치</a>
                                    </td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        (SKT)<br>010-5420-7908<br>
                                        <a
                                                href="?view=androidDevices&type=search&searchType=deviceName&query=on7nlteskt"
                                                style="color: #00AA00" target="_blank"
                                                title="Samsung
Galaxy On7
720 * 1280 (320DPI)
API: 23">on7nlteskt</a>
                                        <br> <a
                                            onclick="window.open('?view=memberList&type=search&searchType=device&query=on7nlteskt')"
                                            target="_blank" style="cursor: pointer">[기기검색]</a>
                                    </td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        2018-04-12 00:01:26</td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        2018-04-12 00:01:26<br>223.62.22.56
                                    </td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        2018-04-12 07:30:56</td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;"
                                        class="bgRed"
                                        title="APA91bFjwmFOB0TKx8IS4g1GI0PnFeGYmR7R3vSYXN1d6KM_W3YPYVFRMXas_Sf2R19nEUYKuu7iul9RC-NhqOLj5Bot91Kw-nvV09NXedmhqZuvZm1Qsavy3tOVC2-frq4-F5ge6YO9">
                                        APA91bFjwm</td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;"
                                        title="정상">정상</td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        <a href="#"
                                           onclick="adminManager('changeNickname','27910','0');return false;">[닉네임수정요청]</a><br>
                                        <a href="#"
                                           onclick="adminManager('block','27910','4');return false;">[1일]</a>
                                        <a href="#"
                                           onclick="adminManager('block','27910','6');return false;">[7일]</a>
                                        <a href="#"
                                           onclick="adminManager('block','27910','8');return false;">[365일]</a><br>
                                        <a href="#"
                                           onclick="adminManager('withdraw','27910','0');return false;">[탈퇴]</a>
                                        <a href="#"
                                           onclick="adminManager('adminWithdraw','27910','0');return false;">[강제탈퇴]</a>
                                    </td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        <span style="color: #FF0000">미인증</span><br>
                                        <a href="#"
                                           onclick="memberManager('deviceConfirm','27910');return false;">[인증
                                            재시도]</a>
                                    </td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        정기권 없음 <br> <a href="#"
                                                       onclick="requestGrantMembership('27910', '1DAY');return false;">[1일권]</a>
                                        <a href="#"
                                           onclick="requestGrantMembership('27910', '7DAYS');return false;">[7일권]</a>
                                        <a href="#"
                                           onclick="requestGrantMembership('27910', '30DAYS');return false;">[30일권]</a><br>
                                        <a href="#"
                                           onclick="requestGrantMembership('27910', '90DAYS');return false;">[90일권]</a>
                                    </td>
                                </tr>

                                <tr
                                        onmouseover="this.style.backgroundColor='#f2f7f2'"
                                        onmouseout="this.style.backgroundColor='#FFFFFF'"
                                        bgcolor="#FFFFFF">
                                    <td height="40" align="center" class="LoginText2 bgGray"><input
                                            type="checkbox" name="userid[]" value="27909"
                                            class="useridCheckBox"></td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;"
                                        class="LoginText2 bgGray">24720</td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        27909<br>(354908082247301)<br> <a
                                            onclick="window.open('?view=memberList&type=search&searchType=email&query=ssin95056@gmail.com')"
                                            target="_blank" style="cursor: pointer">ssin95056@gmail.com</a>
                                    </td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;"
                                        class="bgSky">피파괘법<br> M<br> <a
                                            onclick="window.open('?view=memberList&type=search&searchType=version&query=178')"
                                            target="_blank" style="cursor: pointer">178</a> Y
                                    </td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;"
                                        class=""></td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        0</td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        <a
                                                href="http://m.map.naver.com/map.nhn?lng=0&lat=0&dlevel=11"
                                                target="_blank">위치</a>
                                    </td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        (SKT)<br>010-9274-3391<br>
                                        <a
                                                href="?view=androidDevices&type=search&searchType=deviceName&query=a5y17lteskt"
                                                target="_blank">a5y17lteskt</a> <br> <a
                                            onclick="window.open('?view=memberList&type=search&searchType=device&query=a5y17lteskt')"
                                            target="_blank" style="cursor: pointer">[기기검색]</a>
                                    </td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        2018-04-11 22:15:56</td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        2018-04-11 22:16:20<br>211.213.199.124
                                    </td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        2018-04-12 12:07:17</td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;"
                                        class="bgRed"
                                        title="APA91bFcHa_a-H26TBj2b89rWk-UKffyStmlGd26uer1XeS6r4_tnw1R7tJ6bPM2vJ6nMbWtAy8qYerr01iY6Kr9d7-yCQL5IpOOu9WQzav0XL8uTFtDTSOrwJN7kt2BgdV-4K1FA0Bd">
                                        APA91bFcHa</td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;"
                                        title="정상">정상</td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        <a href="#"
                                           onclick="adminManager('changeNickname','27909','0');return false;">[닉네임수정요청]</a><br>
                                        <a href="#"
                                           onclick="adminManager('block','27909','4');return false;">[1일]</a>
                                        <a href="#"
                                           onclick="adminManager('block','27909','6');return false;">[7일]</a>
                                        <a href="#"
                                           onclick="adminManager('block','27909','8');return false;">[365일]</a><br>
                                        <a href="#"
                                           onclick="adminManager('withdraw','27909','0');return false;">[탈퇴]</a>
                                        <a href="#"
                                           onclick="adminManager('adminWithdraw','27909','0');return false;">[강제탈퇴]</a>
                                    </td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        <span style="color: #0000FF">인증완료</span><br>2018-04-11
                                        22:16:20
                                    </td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        정기권 없음 <br> <a href="#"
                                                       onclick="requestGrantMembership('27909', '1DAY');return false;">[1일권]</a>
                                        <a href="#"
                                           onclick="requestGrantMembership('27909', '7DAYS');return false;">[7일권]</a>
                                        <a href="#"
                                           onclick="requestGrantMembership('27909', '30DAYS');return false;">[30일권]</a><br>
                                        <a href="#"
                                           onclick="requestGrantMembership('27909', '90DAYS');return false;">[90일권]</a>
                                    </td>
                                </tr>

                                <tr
                                        onmouseover="this.style.backgroundColor='#f2f7f2'"
                                        onmouseout="this.style.backgroundColor='#FFFFFF'"
                                        bgcolor="#FFFFFF">
                                    <td height="40" align="center" class="LoginText2 bgGray"><input
                                            type="checkbox" name="userid[]" value="27908"
                                            class="useridCheckBox"></td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;"
                                        class="LoginText2 bgGray">24719</td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        27908<br>(358172070222299)<br> <a
                                            onclick="window.open('?view=memberList&type=search&searchType=email&query=l01029395601@gmail.com')"
                                            target="_blank" style="cursor: pointer">l01029395601@gmail.com</a>
                                    </td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;"
                                        class="bgSky">노용석<br> M<br> <a
                                            onclick="window.open('?view=memberList&type=search&searchType=version&query=178')"
                                            target="_blank" style="cursor: pointer">178</a> N
                                    </td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;"
                                        class=""></td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        0</td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        <a
                                                href="http://m.map.naver.com/map.nhn?lng=126.9085267&lat=37.5665871&dlevel=11"
                                                target="_blank">위치</a>
                                    </td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        (KT)<br>010-2977-5605<br>
                                        <a
                                                href="?view=androidDevices&type=search&searchType=deviceName&query=j5xnltektt"
                                                style="color: #00AA00" target="_blank"
                                                title="Samsung
Galaxy J5(2016)
720 * 1280 (320DPI)
API: 23">j5xnltektt</a>
                                        <br> <a
                                            onclick="window.open('?view=memberList&type=search&searchType=device&query=j5xnltektt')"
                                            target="_blank" style="cursor: pointer">[기기검색]</a>
                                    </td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        2018-04-11 21:51:29</td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        2018-04-13 06:43:50<br>39.7.28.9
                                    </td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        2018-04-13 09:33:02</td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;"
                                        class="bgSky"
                                        title="APA91bH3BJ1tmK60mEeHsiqxfNRxg8rkRX0KcmDwmwRtFsvfXy3eJd89GRCkAoACLCHWA67Af7fB-r2a9N4X5xRZNZTrei6wqUuLUrYfUOeBy8zI2XjSGkYJBSCuII3JKtJn34vRuiId">
                                        APA91bH3BJ</td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;"
                                        title="정상">정상</td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        <a href="#"
                                           onclick="adminManager('changeNickname','27908','0');return false;">[닉네임수정요청]</a><br>
                                        <a href="#"
                                           onclick="adminManager('block','27908','4');return false;">[1일]</a>
                                        <a href="#"
                                           onclick="adminManager('block','27908','6');return false;">[7일]</a>
                                        <a href="#"
                                           onclick="adminManager('block','27908','8');return false;">[365일]</a><br>
                                        <a href="#"
                                           onclick="adminManager('withdraw','27908','0');return false;">[탈퇴]</a>
                                        <a href="#"
                                           onclick="adminManager('adminWithdraw','27908','0');return false;">[강제탈퇴]</a>
                                    </td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        <span style="color: #0000FF">인증완료</span><br>2018-04-12
                                        04:51:36
                                    </td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        정기권 없음 <br> <a href="#"
                                                       onclick="requestGrantMembership('27908', '1DAY');return false;">[1일권]</a>
                                        <a href="#"
                                           onclick="requestGrantMembership('27908', '7DAYS');return false;">[7일권]</a>
                                        <a href="#"
                                           onclick="requestGrantMembership('27908', '30DAYS');return false;">[30일권]</a><br>
                                        <a href="#"
                                           onclick="requestGrantMembership('27908', '90DAYS');return false;">[90일권]</a>
                                    </td>
                                </tr>

                                <tr
                                        onmouseover="this.style.backgroundColor='#f2f7f2'"
                                        onmouseout="this.style.backgroundColor='#FFFFFF'"
                                        bgcolor="#FFFFFF"
                                        style="background-color: rgb(255, 255, 255);">
                                    <td height="40" align="center" class="LoginText2 bgGray"><input
                                            type="checkbox" name="userid[]" value="27907"
                                            class="useridCheckBox"></td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;"
                                        class="LoginText2 bgGray">24718</td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        27907<br>(355500079724688)<br> <a
                                            onclick="window.open('?view=memberList&type=search&searchType=email&query=a45511961@gmail.com')"
                                            target="_blank" style="cursor: pointer">a45511961@gmail.com</a>
                                    </td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;"
                                        class="bgSky">떨거지<br> M<br> <a
                                            onclick="window.open('?view=memberList&type=search&searchType=version&query=178')"
                                            target="_blank" style="cursor: pointer">178</a> N
                                    </td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;"
                                        class=""></td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        0</td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        <a
                                                href="http://m.map.naver.com/map.nhn?lng=0&lat=0&dlevel=11"
                                                target="_blank">위치</a>
                                    </td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        (SKT)<br>010-4551-1961<br>
                                        <a
                                                href="?view=androidDevices&type=search&searchType=deviceName&query=herolteskt"
                                                style="color: #FF6600" target="_blank"
                                                title="Samsung
Galaxy S7 
1440 * 2560 (640DPI)
API: 23">herolteskt</a>
                                        <br> <a
                                            onclick="window.open('?view=memberList&type=search&searchType=device&query=herolteskt')"
                                            target="_blank" style="cursor: pointer">[기기검색]</a>
                                    </td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        2018-04-11 18:32:36</td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        2018-04-12 14:06:43<br>223.39.149.186
                                    </td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        2018-04-13 09:24:10</td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;"
                                        class="bgSky"
                                        title="APA91bHQIESNS0obUEZ0o0dam5P7HR-ZgzYiJW_Op8LKgf6Vxs99hnZgi8WqRCK6UeP8h8Fa3DclN8dLcHnnH5vxPOOQ2YUe4tFbWVMbLr1Mbq9e8mkbzC0VqbsCjpeOlYG2D1RNTKH-">
                                        APA91bHQIE</td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;"
                                        title="정상">정상</td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        <a href="#"
                                           onclick="adminManager('changeNickname','27907','0');return false;">[닉네임수정요청]</a><br>
                                        <a href="#"
                                           onclick="adminManager('block','27907','4');return false;">[1일]</a>
                                        <a href="#"
                                           onclick="adminManager('block','27907','6');return false;">[7일]</a>
                                        <a href="#"
                                           onclick="adminManager('block','27907','8');return false;">[365일]</a><br>
                                        <a href="#"
                                           onclick="adminManager('withdraw','27907','0');return false;">[탈퇴]</a>
                                        <a href="#"
                                           onclick="adminManager('adminWithdraw','27907','0');return false;">[강제탈퇴]</a>
                                    </td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        <span style="color: #0000FF">인증완료</span><br>2018-04-11
                                        18:33:24
                                    </td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        정기권 없음 <br> <a href="#"
                                                       onclick="requestGrantMembership('27907', '1DAY');return false;">[1일권]</a>
                                        <a href="#"
                                           onclick="requestGrantMembership('27907', '7DAYS');return false;">[7일권]</a>
                                        <a href="#"
                                           onclick="requestGrantMembership('27907', '30DAYS');return false;">[30일권]</a><br>
                                        <a href="#"
                                           onclick="requestGrantMembership('27907', '90DAYS');return false;">[90일권]</a>
                                    </td>
                                </tr>

                                <tr
                                        onmouseover="this.style.backgroundColor='#f2f7f2'"
                                        onmouseout="this.style.backgroundColor='#FFFFFF'"
                                        bgcolor="#FFFFFF"
                                        style="background-color: rgb(255, 255, 255);">
                                    <td height="40" align="center" class="LoginText2 bgGray"><input
                                            type="checkbox" name="userid[]" value="27906"
                                            class="useridCheckBox"></td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;"
                                        class="LoginText2 bgGray">24717</td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        27906<br>(359936075709750)<br> <a
                                            onclick="window.open('?view=memberList&type=search&searchType=email&query=limtj0609@gmail.com')"
                                            target="_blank" style="cursor: pointer">limtj0609@gmail.com</a>
                                    </td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;"
                                        class="bgSky">만딩고<br> M<br> <a
                                            onclick="window.open('?view=memberList&type=search&searchType=version&query=178')"
                                            target="_blank" style="cursor: pointer">178</a> N
                                    </td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;"
                                        class=""></td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        0</td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        <a
                                                href="http://m.map.naver.com/map.nhn?lng=126.7067683&lat=37.4163327&dlevel=11"
                                                target="_blank">위치</a>
                                    </td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        (SKT)<br>010-8698-4101<br>
                                        <a
                                                href="?view=androidDevices&type=search&searchType=deviceName&query=on7nlteskt"
                                                style="color: #00AA00" target="_blank"
                                                title="Samsung
Galaxy On7
720 * 1280 (320DPI)
API: 23">on7nlteskt</a>
                                        <br> <a
                                            onclick="window.open('?view=memberList&type=search&searchType=device&query=on7nlteskt')"
                                            target="_blank" style="cursor: pointer">[기기검색]</a>
                                    </td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        2018-04-11 17:42:26</td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        2018-04-13 10:15:20<br>223.62.204.201
                                    </td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        2018-04-13 09:24:10</td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;"
                                        class="bgSky"
                                        title="APA91bFzmzVAnw27XM6zrIVQd-ak6XOPQtQqSagJXk-XokEfEBYydyTycjUlW-cSuXzQbuBPUYloB-WkXXCqork8IQzzpK0p3dnDzksmagbrqpIqNfFJVzX9PcS2UEOe0NpNt-yS3RgN">
                                        APA91bFzmz</td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;"
                                        title="정상">정상</td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        <a href="#"
                                           onclick="adminManager('changeNickname','27906','0');return false;">[닉네임수정요청]</a><br>
                                        <a href="#"
                                           onclick="adminManager('block','27906','4');return false;">[1일]</a>
                                        <a href="#"
                                           onclick="adminManager('block','27906','6');return false;">[7일]</a>
                                        <a href="#"
                                           onclick="adminManager('block','27906','8');return false;">[365일]</a><br>
                                        <a href="#"
                                           onclick="adminManager('withdraw','27906','0');return false;">[탈퇴]</a>
                                        <a href="#"
                                           onclick="adminManager('adminWithdraw','27906','0');return false;">[강제탈퇴]</a>
                                    </td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        <span style="color: #0000FF">인증완료</span><br>2018-04-11
                                        17:43:35
                                    </td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        정기권 없음 <br> <a href="#"
                                                       onclick="requestGrantMembership('27906', '1DAY');return false;">[1일권]</a>
                                        <a href="#"
                                           onclick="requestGrantMembership('27906', '7DAYS');return false;">[7일권]</a>
                                        <a href="#"
                                           onclick="requestGrantMembership('27906', '30DAYS');return false;">[30일권]</a><br>
                                        <a href="#"
                                           onclick="requestGrantMembership('27906', '90DAYS');return false;">[90일권]</a>
                                    </td>
                                </tr>

                                <tr
                                        onmouseover="this.style.backgroundColor='#f2f7f2'"
                                        onmouseout="this.style.backgroundColor='#FFFFFF'"
                                        bgcolor="#FFFFFF">
                                    <td height="40" align="center" class="LoginText2 bgGray"><input
                                            type="checkbox" name="userid[]" value="27905"
                                            class="useridCheckBox"></td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;"
                                        class="LoginText2 bgGray">24716</td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        27905<br>
                                        <span style="color: red">(241416889554878)</span><br> <a
                                            onclick="window.open('?view=memberList&type=search&searchType=email&query=fatexseed@gmail.com')"
                                            target="_blank" style="cursor: pointer">fatexseed@gmail.com</a>
                                        <br>
                                        <a
                                                onclick="window.open('?view=memberList&type=samePersonY&sIdx=27905')"
                                                target="_blank"
                                                style="cursor: pointer; color: red; font-weight: bold;">동일회원
                                            1건</a>
                                    </td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;"
                                        class="bgSky">T사랑님T<br> M<br> <a
                                            onclick="window.open('?view=memberList&type=search&searchType=version&query=178')"
                                            target="_blank" style="cursor: pointer">178</a> N
                                    </td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;"
                                        class="bgSky"><a
                                            onclick="window.open('?view=memberList&type=search&searchType=idx&query=27825')"
                                            target="_blank" style="cursor: pointer">추천인 : 27825</a></td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        0</td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        <a
                                                href="http://m.map.naver.com/map.nhn?lng=127.138868&lat=37.444917&dlevel=11"
                                                target="_blank">위치</a>
                                    </td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        (KT)<br>
                                        <br>
                                        <a
                                                href="?view=androidDevices&type=search&searchType=deviceName&query=ghost_retasia"
                                                target="_blank">ghost_retasia</a> <br> <a
                                            onclick="window.open('?view=memberList&type=search&searchType=device&query=ghost_retasia')"
                                            target="_blank" style="cursor: pointer">[기기검색]</a>
                                    </td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        2018-04-11 16:29:12</td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        2018-04-11 16:29:48<br>49.167.27.248
                                    </td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        2018-04-13 08:00:23</td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;"
                                        class="bgSky"
                                        title="APA91bHgnZkzHl4OfnD5yMnbNHvLsaiXx4PR3_6OreDC3jiLGWjLA1dIu8n6WyC0D4lFsek6sL0H1tMsmE9ZR-apOB9u102OzCfsVf_Bhknm5QliRVaa_Q7YsawBWjMEJcrixrkGdhZs">
                                        APA91bHgnZ</td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;"
                                        title="정상">정상</td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        <a href="#"
                                           onclick="adminManager('changeNickname','27905','0');return false;">[닉네임수정요청]</a><br>
                                        <a href="#"
                                           onclick="adminManager('block','27905','4');return false;">[1일]</a>
                                        <a href="#"
                                           onclick="adminManager('block','27905','6');return false;">[7일]</a>
                                        <a href="#"
                                           onclick="adminManager('block','27905','8');return false;">[365일]</a><br>
                                        <a href="#"
                                           onclick="adminManager('withdraw','27905','0');return false;">[탈퇴]</a>
                                        <a href="#"
                                           onclick="adminManager('adminWithdraw','27905','0');return false;">[강제탈퇴]</a>
                                    </td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        <span style="color: #0000FF">인증완료</span><br>2018-04-11
                                        16:29:48
                                    </td>
                                    <td align="center"
                                        style="line-height: 1.3em; padding-top: 2px; padding-bottom: 2px;">
                                        정기권 없음 <br> <a href="#"
                                                       onclick="requestGrantMembership('27905', '1DAY');return false;">[1일권]</a>
                                        <a href="#"
                                           onclick="requestGrantMembership('27905', '7DAYS');return false;">[7일권]</a>
                                        <a href="#"
                                           onclick="requestGrantMembership('27905', '30DAYS');return false;">[30일권]</a><br>
                                        <a href="#"
                                           onclick="requestGrantMembership('27905', '90DAYS');return false;">[90일권]</a>
                                    </td>
                                </tr>


                                </tbody>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td height="30"><input type="button" value="수정요청"
                                               onclick="adminManagerSync('changeNickname','');"> <input
                                type="button" value="1일"
                                onclick="adminManagerSync('block','4');"> <input
                                type="button" value="7일"
                                onclick="adminManagerSync('block','6');"> <input
                                type="button" value="365일"
                                onclick="adminManagerSync('block','8');"> <input
                                type="button" value="탈퇴"
                                onclick="adminManagerSync('withdraw','');"> <input
                                type="button" value="강제탈퇴"
                                onclick="adminManagerSync('adminWithdraw','');"></td>
                    </tr>
                    <tr>
                        <td height="30" align="center">
                            <table border="0" cellspacing="0" cellpadding="0">
                                <tbody>
                                <tr>
                                    <td align="left"></td>
                                    <td align="center" style="padding: 0 5px 0 5px">
                                        <table border="0" cellspacing="0" cellpadding="0">
                                            <tbody>
                                            <tr>
                                                <td align="center"
                                                    style="padding: 2px 10px 0 10px; cursor: pointer;"
                                                    bgcolor="#EDEDED"
                                                    onclick="location.href='?view=memberList&type=&searchType=&query=&page=1';">
                                                    <a
                                                            href="?view=memberList&type=&searchType=&query=&page=1"
                                                            class="page_link2">1</a>
                                                </td>
                                                <td width="1"><img src="<c:url value='/res/img/' />page_line1.gif"
                                                                   alt=""></td>
                                                <td align="center"
                                                    style="padding: 2px 10px 0 10px; cursor: pointer;"
                                                    onmouseover="this.style.backgroundColor='#EDEDED';childNodes[0].style.color='#FF3600';"
                                                    onmouseout="this.style.backgroundColor='#FFFFFF';childNodes[0].style.color='#3A3A3A';"
                                                    onclick="location.href='?view=memberList&type=&searchType=&query=&page=2';">
                                                    <a
                                                            href="?view=memberList&type=&searchType=&query=&page=2"
                                                            class="page_link1">2</a>
                                                </td>
                                                <td width="1"><img src="<c:url value='/res/img/' />page_line1.gif"
                                                                   alt=""></td>
                                                <td align="center"
                                                    style="padding: 2px 10px 0 10px; cursor: pointer;"
                                                    onmouseover="this.style.backgroundColor='#EDEDED';childNodes[0].style.color='#FF3600';"
                                                    onmouseout="this.style.backgroundColor='#FFFFFF';childNodes[0].style.color='#3A3A3A';"
                                                    onclick="location.href='?view=memberList&type=&searchType=&query=&page=3';">
                                                    <a
                                                            href="?view=memberList&type=&searchType=&query=&page=3"
                                                            class="page_link1">3</a>
                                                </td>
                                                <td width="1"><img src="<c:url value='/res/img/' />page_line1.gif"
                                                                   alt=""></td>
                                                <td align="center"
                                                    style="padding: 2px 10px 0 10px; cursor: pointer;"
                                                    onmouseover="this.style.backgroundColor='#EDEDED';childNodes[0].style.color='#FF3600';"
                                                    onmouseout="this.style.backgroundColor='#FFFFFF';childNodes[0].style.color='#3A3A3A';"
                                                    onclick="location.href='?view=memberList&type=&searchType=&query=&page=4';">
                                                    <a
                                                            href="?view=memberList&type=&searchType=&query=&page=4"
                                                            class="page_link1">4</a>
                                                </td>
                                                <td width="1"><img src="<c:url value='/res/img/' />page_line1.gif"
                                                                   alt=""></td>
                                                <td align="center"
                                                    style="padding: 2px 10px 0 10px; cursor: pointer;"
                                                    onmouseover="this.style.backgroundColor='#EDEDED';childNodes[0].style.color='#FF3600';"
                                                    onmouseout="this.style.backgroundColor='#FFFFFF';childNodes[0].style.color='#3A3A3A';"
                                                    onclick="location.href='?view=memberList&type=&searchType=&query=&page=5';">
                                                    <a
                                                            href="?view=memberList&type=&searchType=&query=&page=5"
                                                            class="page_link1">5</a>
                                                </td>
                                                <td width="1"><img src="<c:url value='/res/img/' />page_line1.gif"
                                                                   alt=""></td>
                                                <td align="center"
                                                    style="padding: 2px 10px 0 10px; cursor: pointer;"
                                                    onmouseover="this.style.backgroundColor='#EDEDED';childNodes[0].style.color='#FF3600';"
                                                    onmouseout="this.style.backgroundColor='#FFFFFF';childNodes[0].style.color='#3A3A3A';"
                                                    onclick="location.href='?view=memberList&type=&searchType=&query=&page=6';">
                                                    <a
                                                            href="?view=memberList&type=&searchType=&query=&page=6"
                                                            class="page_link1">6</a>
                                                </td>
                                                <td width="1"><img src="<c:url value='/res/img/' />page_line1.gif"
                                                                   alt=""></td>
                                                <td align="center"
                                                    style="padding: 2px 10px 0 10px; cursor: pointer;"
                                                    onmouseover="this.style.backgroundColor='#EDEDED';childNodes[0].style.color='#FF3600';"
                                                    onmouseout="this.style.backgroundColor='#FFFFFF';childNodes[0].style.color='#3A3A3A';"
                                                    onclick="location.href='?view=memberList&type=&searchType=&query=&page=7';">
                                                    <a
                                                            href="?view=memberList&type=&searchType=&query=&page=7"
                                                            class="page_link1">7</a>
                                                </td>
                                                <td width="1"><img src="<c:url value='/res/img/' />page_line1.gif"
                                                                   alt=""></td>
                                                <td align="center"
                                                    style="padding: 2px 10px 0 10px; cursor: pointer;"
                                                    onmouseover="this.style.backgroundColor='#EDEDED';childNodes[0].style.color='#FF3600';"
                                                    onmouseout="this.style.backgroundColor='#FFFFFF';childNodes[0].style.color='#3A3A3A';"
                                                    onclick="location.href='?view=memberList&type=&searchType=&query=&page=8';">
                                                    <a
                                                            href="?view=memberList&type=&searchType=&query=&page=8"
                                                            class="page_link1">8</a>
                                                </td>
                                                <td width="1"><img src="<c:url value='/res/img/' />page_line1.gif"
                                                                   alt=""></td>
                                                <td align="center"
                                                    style="padding: 2px 10px 0 10px; cursor: pointer;"
                                                    onmouseover="this.style.backgroundColor='#EDEDED';childNodes[0].style.color='#FF3600';"
                                                    onmouseout="this.style.backgroundColor='#FFFFFF';childNodes[0].style.color='#3A3A3A';"
                                                    onclick="location.href='?view=memberList&type=&searchType=&query=&page=9';">
                                                    <a
                                                            href="?view=memberList&type=&searchType=&query=&page=9"
                                                            class="page_link1">9</a>
                                                </td>
                                                <td width="1"><img src="<c:url value='/res/img/' />page_line1.gif"
                                                                   alt=""></td>
                                                <td align="center"
                                                    style="padding: 2px 10px 0 10px; cursor: pointer;"
                                                    onmouseover="this.style.backgroundColor='#EDEDED';childNodes[0].style.color='#FF3600';"
                                                    onmouseout="this.style.backgroundColor='#FFFFFF';childNodes[0].style.color='#3A3A3A';"
                                                    onclick="location.href='?view=memberList&type=&searchType=&query=&page=10';">
                                                    <a
                                                            href="?view=memberList&type=&searchType=&query=&page=10"
                                                            class="page_link1">10</a>
                                                </td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </td>
                                    <td align="right"><a
                                            href="?view=memberList&type=&searchType=&query=&page=11"><img
                                            src="<c:url value='/res/img/' />page_but_next.gif" alt=""></a> <a
                                            href="?view=memberList&type=&searchType=&query=&page=1237"><img
                                            src="<c:url value='/res/img/' />page_but_end.gif" alt=""></a></td>
                                </tr>
                                </tbody>
                            </table>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </td>
        </tr>
        </tbody>
    </table>

</form>
<script>

    //<![CDATA[
    function requestGrantMembership(member_idx, membershipType) {
        var membershipTypeTitle = '';
        switch (membershipType) {
            case '1DAY':
                membershipTypeTitle = "1일 정기권";
                break;
            case '7DAYS':
                membershipTypeTitle = "7일 정기권";
                break;
            case '30DAYS':
                membershipTypeTitle = "30일 정기권";
                break;
            case '90DAYS':
                membershipTypeTitle = "90일 정기권";
                break;
        }

        if (!confirm('[' + member_idx + "] 회원에게 " + membershipTypeTitle + "을 부여하시겠습니까?\n이미 정기권을 이용 중이면 해지된 후 기간이 시작됩니다.")) {
            return;
        }

        $.ajax({
            type: 'POST',
            url: '?view=action&action=membership&actionType=grant&member_idx=' + member_idx + '&membershipType=' + membershipType,
            dataType: 'html',
            success: function (html, textStatus) {
                alert(html);
                location.reload();
            },
            error: function (xhr, textStatus, errorThrown) {
                alert('error' + (errorThrown ? errorThrown : xhr.status));
            }
        });
    }

    function requestCancelMembership(member_idx) {
        if (!confirm('[' + member_idx + '] 회원의 정기권을 해지하시겠습니까?')) {
            return;
        }

        $.ajax({
            type: 'POST',
            url: '?view=action&action=membership&actionType=cancel&member_idx=' + member_idx,
            dataType: 'html',
            success: function (html, textStatus) {
                alert(html);
                location.reload();
            },
            error: function (xhr, textStatus, errorThrown) {
                alert('error' + (errorThrown ? errorThrown : xhr.status));
            }
        });
    }

    function adminManager(type, userid, accessLevel) {
        if (type == 'changeNickname') {
            if (!confirm('[ ' + userid + ' ] 회원의 닉네임을 수정 요청하시겠습니까?')) {
                return false;
            }
        }
        else if (type == 'withdraw') {
            if (!confirm('[ ' + userid + ' ] 회원을 탈퇴시키겠습니까?')) {
                return false;
            }
        }
        else if (type == 'adminWithdraw') {
            if (!confirm('[ ' + userid + ' ] 회원을 강제탈퇴시키겠습니까?')) {
                return false;
            }
        }
        else {
            if (!confirm('[ ' + userid + ' ] 회원을 제재하시겠습니까?')) {
                return false;
            }
        }

        $.ajax({
            type: 'POST',
            url: '?view=action&action=adminManager&actionType=' + type + '&userid=' + userid + '&accessLevel=' + accessLevel,
            dataType: 'html',
            success: function (html, textStatus) {
                alert(html);
            },
            error: function (xhr, textStatus, errorThrown) {
                //alert('error'+(errorThrown?errorThrown:xhr.status));
            }
        });
    }

    function memberManager(actionType, targetid) {
        if (actionType == 'sexChange') {
            typeView = '성별 변경';
        }
        else if (actionType == 'nicknameChange') {
            typeView = '닉네임 수정요청';
        }
        else if (actionType == 'deviceConfirm') {
            typeView = '인증 재시도';
        }

        if (confirm('[ ' + targetid + ' ] ' + typeView + ' 시키겠습니까?')) {
            $.ajax({
                type: 'POST',
                url: '?view=action&action=memberManager&actionType=' + actionType + '&targetid=' + targetid,
                dataType: 'html',
                success: function (html, textStatus) {
                    alert(html);
                },
                error: function (xhr, textStatus, errorThrown) {
                    //alert('error'+(errorThrown?errorThrown:xhr.status));
                }
            });
        }
    }

    function adminManagerSync(actionType, accessLevel) {
        var checkedCount = $('.useridCheckBox:checked').length;
        var msg = '';

        if (actionType == 'changeNickname') {
            msg = '[ ' + checkedCount + ' ] 명의 회원의 닉네임을 수정 요청하시겠습니까?';
        }
        else if (actionType == 'deleteProfilePhoto') {
            msg = '[ ' + checkedCount + ' ] 명의 회원의 프로필 사진을 삭제 시키겠습니까?';
        }
        else if (actionType == 'withdraw') {
            msg = '[ ' + checkedCount + ' ] 명의 회원을 탈퇴시키겠습니까?';
        }
        else if (actionType == 'adminWithdraw') {
            msg = '[ ' + checkedCount + ' ] 명의 회원을 강제탈퇴시키겠습니까?';
        }
        else if (actionType == 'samePersonCntReset') {
            msg = '[ ' + checkedCount + ' ] 명의 회원을 목록에서 삭제하시겠습니까?';
        }
        else {
            msg = '[ ' + checkedCount + ' ] 명의 회원을 제재하시겠습니까?';
        }

        if (checkedCount == 0) {
            alert('선택된 회원이 없습니다.');

            return false;
        }

        if (confirm(msg)) {
            var fn = document.manageForm;

            fn.actionType.value = actionType;
            fn.accessLevel.value = accessLevel;

            fn.submit();
        }
    }

    $(function () {
        $('#manageCheckBox').click(function () {
            if ($(this).is(':checked')) {
                $('.useridCheckBox').attr('checked', true);
            }
            else {
                $('.useridCheckBox').attr('checked', false);
            }
        });
    });

    //]]>
</script>
