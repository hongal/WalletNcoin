   	<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
	<script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src='<c:url value="/resources/js/joinvalidation.js"></c:url>'></script>
	<style>
		#openNavBtn{
			display: none;
		}
	</style>
	<div class="primary_container">
		<div class="primary_content_column">
			<div class="primary_content_row" style="align-items: center">
				<input id="id" class="primary_input" placeholder="회원아이디" type="text" style="flex-grow: 1"
				onclick="idChanged()">
				<button class="button_dark" style="width: auto;" onclick="idDuplicateChk()">중복확인</button>
			</div>
			<p id="idUnChked" style="color: red; font-size: 17px; padding-left: 10px; display: none;">
				중복체크를 진행해주세요!
			</p>
<%--			<p id="idChked" style="color: red; font-size: 17px; padding-left: 10px; display: none;">
				사용가능한 id 입니다!
			</p>--%>

			<input id="password" class="primary_input" placeholder="비밀번호" type="password">
			<input id="chk_password" class="primary_input" placeholder="비밀번호 확인" type="password">
			<select id="country">
				<option style="display: none" value="0"> 국가</option>
				<option value="1">한국</option>
				<option value="2">미국</option>
				<option value="3">일본</option>
				<option value="4">중국</option>
			</select>
			<div class="primary_content_row" style="align-items: center">
				<input id="phone" class="primary_input" placeholder="휴대폰번호" style="flex-grow: 1">
				<button class="button_dark" style="width: auto" onclick="chkHpDuplicated()">중복확인</button>
			</div>
			<button class="button_primary" onclick="sendSms()">인증번호 전송</button>
			<p style="color: #bbb; font-size: 17px; padding-left: 10px">
				-를 제외한 숫자만 입력해 주세요.<br>
				EX)01012345678
			</p>
			<div class="primary_content_row" id="sms_container">
				<input id="sms_code" class="primary_input" placeholder="인증번호" style="flex-grow: 1" >
				<button id="auth_btn" class="button_dark" style="width: auto" onclick="checkCode()" >인증</button>
			</div>
			<p id="sms_chked" style="color: red; font-size: 17px; padding-left: 10px; display: none;">
				인증되었습니다!
			</p>

			<button class="button_primary" style="width: auto; margin-top: 12px" onclick="addCustomer()">회원가입</button>

		</div>
	</div>

	
