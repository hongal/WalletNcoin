   	<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
	<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
	<script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
	
	
	
   			<h2 class="display_none">main</h2>
			<div class="list-box">
				<article class="signin-box">
					<div class="signin">
						<h2 class="tit-signin">회원가입</h2>
						<form action="${pageContext.request.contextPath}/join" id="joinform" onsubmit="return validateformcheck(this)">
						<input type="hidden" id="emailChk">
						<input type="hidden" id="passwordChk">
						<input type="hidden" id="passwordConfirmChk">
						<input type="hidden" id="phoneConfirmChk">
						<input type="hidden" id="agreementChk">
						
						<table>
							<colgroup>
								<col class="s-col">
								<col>
							</colgroup>
							<thead>
								<tr>
									<th colspan="2">※모든 항목은 필수 입력입니다</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td class="tit-name">아이디</td>
									<td>
										<input class="s-basic-txt" type="text" value="이메일을 입력하세요" name="id" id="id"> <input class="s-basic-btn" id="checkbtn" type="button" onclick="emailDuplCheck();" value="중복검사">
									</td>
								</tr>
								<tr>
									<td class="tit-name">비밀번호</td>
									<td>
										<input class="s-basic-txt" id="password" name="password" type="password" value="비밀번호를 입력하세요" onblur="checkPassword();">
										<p class="s-red">- 비밀번호는 8자리이상(특수문자 포함) 12자리 이하로 만드셔야 합니다.<br />
														- 포털 사이트나 타 거래소 등 타 사이트와 동일하거나 비슷한 암호를 설정하지 마세요.<br />
														   <em>타 사이트에서 암호가 유출될 경우 제3자가 회원님의 계정에 접근할 위험이 있습니다.</em><br />
														- 영문(대/소문자), 숫자, 특수 문자를 조합해서 작성해주세요.
										</p>
										<p class="s-red" id="passwordsetMessage"></p>
									</td>
								</tr>
								<tr>
									<td class="tit-name">비밀번호 확인</td>
									<td>
										<input class="s-basic-txt" id="passwordConfirm" type="password" value="" onblur="checkPasswordEqual();">
									
										<p class="s-red" id="passwordConfirmMessage"></p>
									</td>
								</tr>
								<tr>
									<td class="tit-name">국가</td>
									<td>
										<select class="s-basic-sel" name="country">
											<option value="대한민국" >대한민국</option>
										</select>
									</td>
								</tr>
								<tr>
									<td class="tit-name">휴대폰번호</td>
									<td>
										<input class="s-basic-txt" type="text" value="" name="phone"> <input class="s-basic-btn" type="submit" value="SMS 인증요청">
										<p class="s-black">휴대폰번호는 비밀번호, KRW 출금/BTC 출금 등 SMS가 발송되오니 정확히 입력해 주세요.<br />
														* 해외 거주자의 국가코드는 자동으로 등록되므로 추가로 입력하실 필요는 없습니다.</p>
									</td>
								</tr>
								<tr>
									<td class="tit-name">휴대폰인증 번호</td>
									<td>
										<input class="s-basic-txt" type="text" value="">
										<p class="s-black">휴대폰으로 전송받으신 인증번호를 입력해 주세요.</p>
									</td>
								</tr>
								<tr>
									<td class="tit-name"></td>
									<td>
										<img src="<c:url value='/resources/img/' />robot.png" alt="">
									</td>
								</tr>
							</tbody>
						</table>
						
						<div class="signin-btn">
						
							<div class="signin-btn-menu">
								<input class="sign" type="submit" value="가입하기">
								<span><a href="#">취소하기</a></span>
							</div>
						</div>
						</form>
					</div>
				</article>			
			</div>
			<script src='<c:url value="/resources/js/joinvalidation.js"></c:url>'></script>
			