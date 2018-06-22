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
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>거래내역</title>
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

	</script>
	<style>
		#openNavBtn{
			display: none;
		}
	</style>

</head>
<body>
<div class="primary_container">

	<form class="primary_content_column" name='f' action='/login' method='POST' style="align-content: space-between">
		<img src="/resources/img/favicon.png" alt="" style="max-width: 296px; margin: 0px auto;">
		<input class="primary_input" type='text' name='username' value=''
			   placeholder="아이디">
		<input class="primary_input" type='password' name='password'
			   placeholder="비밀번호">
		<button class="button_primary" name="submit" type="submit" value="로그인">로그인</button>
	</form>
	<div class="primary_content_row" >
		<button class="button_dark" style="margin-right: 12px">비밀번호 찾기</button>
		<button class="button_dark" onclick="location.href='/signin'">회원가입</button>
	</div>
</div>
</body>
</html>