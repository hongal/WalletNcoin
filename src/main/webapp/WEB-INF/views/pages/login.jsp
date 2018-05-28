<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<style>
.layout-header {
	display: none;
}
</style>
<script type="text/javascript">
$(document).ready(function() { 

}); 

var errMsg={
		"500501":"wrong pwd"
		,"500502":"not found user"
};

		
function test() {
	callWizAjax({
			url : "./loginProcess.json"
			,data : {
				admin_id:$("#userid").val()
				,admin_pass:$("#passwd").val()
			}
			,success : function(data) {
				console.log(data);
				if(data.detailCode!=200){
					alert(errMsg[data.detailCode]);
					return;
				}
				alert('로그인 성공');
				location.href=rootContext+"nodeList.do";
			}
			,complete : function() {
				console.log('compleage');
			}
	});
}
<!--

//-->
</script>
<!-- 
	<div id="login" class="loginForm">
		<span class="title">※관리자 로그인</span>
		<div class="userid">
			<span class="label">아이디</span> <input type="text" id="userid" name="userid">
		</div>
		<div class="passwd">
			<span class="label">비밀번호</span> <input type="password" id="passwd" name="passwd">
		</div>
		<div class="submit">
		<input type="button" onclick="test();" value="로그인">
	</div>
	</div>
	 -->
	<form class="loginForm" name='f' action='/login' method='POST'>
		<span class="title">※관리자 로그인</span>
		<table>
			<tr><td>아이디:</td><td><input type='text' name='username' value=''></td></tr>
			<tr><td>비밀번호:</td><td><input type='password' name='password'/></td></tr>
			<tr><td colspan='2'><input name="submit" type="submit" value="로그인"/></td></tr>
		</table>
	</form>
	
	
	
