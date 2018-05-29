<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<% String tableWidth = "640px"; %>
<% String target = request.getParameter("target") != null ? request.getParameter("target") : ""; %>

<div class="node-search-title" style="padding-bottom:3px;">
	<img src="<c:url value='/res/img/' />MarketReadIcon3.gif" alt="" width="4" height="5" style="padding-bottom: 3px">
	<span class="CopyText2">송금하기</span>
</div>

<div class="admin-page-search-table bgGreen" style="border-bottom:none; width:<%=tableWidth%>;">
	<span class="admin-page-input-table-title MyMoneyText1" style="padding-top:10px;">송금받을 지갑 주소</span>
	
	<span class="admin-page-search-table-content" style="padding-top:10px;">
		<input id="recipient_address" type="text" class="v_align_middle admin-page-input-table-inputText" style="width: 90%;" value="<%=target%>">
		<button class="greenBtn v_align_middle pointer" style="margin-left: 2px;" onclick="getLedgerInfo()">조회</button>
	</span>
</div>

<div class="admin-page-search-table bgGreen" style="border-bottom:none; border-top:none; width:<%=tableWidth%>;">
	<span class="admin-page-input-table-title MyMoneyText1" style="padding-bottom:10px;">데스티네이션 태그</span>
	
	<span class="admin-page-search-table-content" style="padding-bottom:10px;">
		<input id="tag" type="text" class="v_align_middle admin-page-input-table-inputText">
	</span>
</div>

<div class="admin-page-search-table bgGreen" style="border-bottom:none; border-top:none; width:<%=tableWidth%>;">
	<span class="admin-page-input-table-title MyMoneyText1" style="padding-bottom:10px;">송금할 코인 수</span>
	
	<span class="admin-page-search-table-content" style="padding-bottom:10px;">
		<input id="send_amount" type="text" class="v_align_middle admin-page-input-table-inputText" onblur="setTotal();">
	</span>
</div>

<div class="admin-page-search-table bgGreen" style="border-bottom:none; border-top:none; width:<%=tableWidth%>;">
	<span class="admin-page-input-table-title MyMoneyText1" style="padding-bottom:10px;">수수료(XRP)</span>
	
	<span class="admin-page-search-table-content" style="padding-bottom:10px;">
		<input id="fee" type="text" class="v_align_middle admin-page-input-table-inputText">
	</span>
</div>

<div class="admin-page-search-table bgGreen" style="border-bottom:none; border-top:none; width:<%=tableWidth%>;">
	<span class="admin-page-input-table-title MyMoneyText1" style="padding-bottom:10px;">총 소요 코인 수</span>
	
	<span class="admin-page-search-table-content" style="padding-bottom:10px;">
		<input id="total_amount" type="text" class="v_align_middle admin-page-input-table-inputText">
	</span>
</div>

<div class="admin-page-search-table bgGreen" style="border-bottom:none; border-top:none; width:<%=tableWidth%>;">
	<span class="admin-page-input-table-title MyMoneyText1" style="padding-bottom:10px;">보내는 지갑 주소</span>
	
	<span class="admin-page-search-table-content" style="padding-bottom:10px;">
		<input id="sender_address" type="text" class="v_align_middle admin-page-input-table-inputText">
	</span>
</div>

<div class="admin-page-search-table bgGreen" style="border-top:none; width:<%=tableWidth%>;">
	<span class="admin-page-input-table-title MyMoneyText1" style="padding-bottom:10px;">보내는 시크릿키</span>
	
	<span class="admin-page-search-table-content" style="padding-bottom:10px;">
		<input id="secret_key" type="text" class="v_align_middle admin-page-input-table-inputText">
	</span>
</div>

<div class="admin-page-search-table bgGreen" style="border-top:none; width:<%=tableWidth%>;">	
	<span class="admin-page-search-table-button align_center">
		<button class="greenBtn v_align_middle pointer" style="width: 70px;" onclick="sendMoney()">송금하기</button>
	</span>
</div>


<div id="ledger_info_div" style="display: none;">
	<div class="node-search-title" style="padding-bottom:3px; padding-top: 15px;">
		<img src="<c:url value='/res/img/' />MarketReadIcon3.gif" alt="" width="4" height="5" style="padding-bottom: 3px">
		<span class="CopyText2">ledger_info</span>
	</div>
	
	<div class="admin-page-search-table bgGreen" style="width:<%=tableWidth%>;">
		<span class="search-table-title-default MyMoneyText1" style="height: 30px;">account</span>
		
		<span id="ledger_info_account" class="search-table-content-default" style="height: 30px;"></span>
	</div>
	
	<div class="admin-page-search-table bgGreen" style="border-top:none; width:<%=tableWidth%>;">
		<span class="search-table-title-default MyMoneyText1" style="height: 30px;">status</span>
		
		<span id="ledger_info_state" class="search-table-content-default" style="height: 30px;"></span>
	</div>
</div>


<div id="transaction_list_div"></div>


<script>
	getFee();
	setSenderAddress();
	
	function setSenderAddress() {
		$('#sender_address')[0].value = "${address}";
	}
	
	if ($('#recipient_address')[0].value != "") {
		getLedgerInfo();
		
	}
	function setTotal() {
		$('#total_amount')[0].value = $('#fee')[0].value * 1 + $('#send_amount')[0].value * 1;
	}
	
	function getLedgerInfo() {
		
		var recipient_address = $('#recipient_address')[0];
		
		callWizAjax({
 			url : "<c:url value='/getLedgerInfo.json' />",
			data : {
				recipient_address:recipient_address.value
			},
			success : function(data) {
				console.log(data);

				// ledger_info
				$('#ledger_info_account').html(data.result.result.account);
				$('#ledger_info_state').html(data.result.result.status);
				$('#ledger_info_div')[0].style.display = '';
				
				console.log('check');

				$('#transaction_list_div').html('');
				for (var i in data.result.result.transactions) {
					var eachobject =data.result.result.transactions[i];
					
					var text = "<div class=\"node-search-title\" style=\"padding-bottom:3px; padding-top: 10px;\">"
							+ "<img src=\"<c:url value='/res/img/' />MarketReadIcon3.gif\" alt=\"\" width=\"4\" height=\"5\" style=\"padding-bottom: 3px\">"
							+ "<span class=\"CopyText2\">Transaction" + i + "</span>"
						+ "</div>"
						+ "<div class=\"admin-page-search-table bgGreen\" style=\"width:<%=tableWidth%>;\">"
							+ "<span class=\"search-table-title-default MyMoneyText1\" style=\"height: 30px;\">account</span>"
							+ "<span class=\"search-table-content-default\" style=\"height: 30px;\">" + eachobject.tx.account + "</span>"
						+ "</div>"
						+ "<div class=\"admin-page-search-table bgGreen\" style=\"border-top: none; width:<%=tableWidth%>;\">"
							+ "<span class=\"search-table-title-default MyMoneyText1\" style=\"height: 30px;\">amount</span>"
							+ "<span class=\"search-table-content-default\" style=\"height: 30px;\">" + eachobject.tx.amount + "</span>"
						+ "</div>"
						+ "<div class=\"admin-page-search-table bgGreen\" style=\"border-top: none; width:<%=tableWidth%>;\">"
							+ "<span class=\"search-table-title-default MyMoneyText1\" style=\"height: 30px;\">date</span>"
							+ "<span class=\"search-table-content-default\" style=\"height: 30px;\">" + eachobject.tx.date + "</span>"
						+ "</div>"
						+ "<div class=\"admin-page-search-table bgGreen\" style=\"border-top: none; width:<%=tableWidth%>;\">"
							+ "<span class=\"search-table-title-default MyMoneyText1\" style=\"height: 30px;\">fee</span>"
							+ "<span class=\"search-table-content-default\" style=\"height: 30px;\">" + eachobject.tx.fee + "</span>"
						+ "</div>"
						+ "<div class=\"admin-page-search-table bgGreen\" style=\"border-top: none; width:<%=tableWidth%>;\">"
							+ "<span class=\"search-table-title-default MyMoneyText1\" style=\"height: 30px;\">flags</span>"
							+ "<span class=\"search-table-content-default\" style=\"height: 30px;\">" + eachobject.tx.flags + "</span>"
						+ "</div>"
						+ "<div class=\"admin-page-search-table bgGreen\" style=\"border-top: none; width:<%=tableWidth%>;\">"
							+ "<span class=\"search-table-title-default MyMoneyText1\" style=\"height: 30px;\">hash</span>"
							+ "<span class=\"search-table-content-default\" style=\"height: 30px;\">" + eachobject.tx.hash + "</span>"
						+ "</div>"
						+ "<div class=\"admin-page-search-table bgGreen\" style=\"border-top: none; width:<%=tableWidth%>;\">"
							+ "<span class=\"search-table-title-default MyMoneyText1\" style=\"height: 30px;\">transactionType</span>"
							+ "<span class=\"search-table-content-default\" style=\"height: 30px;\">" + eachobject.tx.transactionType + "</span>"
						+ "</div>";
						
					$(text).appendTo($('#transaction_list_div'));
				}
			 
			},
			complete : function() {
			}
    	});
		
	}
	
	function getFee() {
		callWizAjax({
 			url : "<c:url value='/getFee.json' />"
				,data : {
				}
				,success : function(data) {
					console.log(data);
					$('#fee')[0].value = (new BigNumber(data.fee)).div(1000000).toFormat(6);
				 
				}
				,complete : function() {
				}
    	});
		
	}
	
	$.fn.multiline = function(text){
	    this.text(text);
	    this.html(this.html().replace(/\n/g,'<br/>'));
	    return this;
	}
	

    function sendMoney() {

    	var recipient_address = $('#recipient_address')[0];
    	var tag 				= $('#tag')[0];
    	var sendAmountObj		 = $('#send_amount')[0];
    	var fee 				= $('#fee')[0];
    	
    	var sender_address 			= $('#sender_address')[0];
    	var secret_key 				= $('#secret_key')[0];

     	if (!recipient_address.value || recipient_address.value == '')
   		{
     		recipient_address.focus();
    		alert('송금받을 지갑 주소 미입력');
   			return false;
   		}
     	if (!sendAmountObj.value || isNaN(parseInt(sendAmountObj.value)) || sendAmountObj.value == 0)
   		{
     		sendAmountObj.focus();
    		alert('송금할 금액 미입력');
   			return false;
   		}
     	/**
     		TODO: more  validate ..calculator total coin
     	*/
    	if (confirm(recipient_address.value + ' 에게 ' + sendAmountObj.value + ' 송금 하시겠습니까?'))
		{			
        	callWizAjax({
     			url : "<c:url value='/sendCoinWithMsg.json' />"
  				,data : {
  					recipient_address:recipient_address.value
  					,tag:tag.value
  					,sendAmount:sendAmountObj.value * 1000000
  					,fee:fee.value * 1000000
  					,sender_address:sender_address.value
  					,secret_key:secret_key.value
  				}
  				,success : function(data) {
					if(data.sendState.jsonRPCSubmitResultDto.status=='error'){
						alert(data.sendState.result.error+"\t"+data.sendState.result.error_message);
						return;
					}
  					console.log(data);
  					alert("성공");
  					var curUrl = "<c:url value='/send' />";
  					<%=target != "" ? "location.href = curUrl;" : "" %> 
  				}
  				,complete : function() {
  				}
        	});
		}
    }
</script>