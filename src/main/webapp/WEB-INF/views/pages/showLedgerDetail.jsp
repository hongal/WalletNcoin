<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<% String tableWidth = "900px"; %>
<% String target = request.getParameter("target") != null ? request.getParameter("target") : ""; %>


<div class="trade-list-title" style="padding-bottom:3px;">
	<img src="<c:url value='/res/img/' />MarketReadIcon3.gif" alt="" width="4" height="5" style="padding-bottom: 3px">
	<span class="CopyText2">레져 상세 조회</span>
</div>

<div id="contentDiv"></div>
<p id= "transactions"></p>

<script>
var tarray = new Array();
<c:forEach items="${result.transactions}" var="em">
var eachElement = new Array();
eachElement["account"] = "${em.account}";
eachElement["amount"]="${em.amount}";
eachElement["destination"]="${em.destination}";
eachElement["fee"]="${em.fee}";
eachElement["flags"]="${em.flags}";
eachElement["memos"]="${em.memos}";
eachElement["sequence"]="${em.sequence}";
eachElement["signingPubKey"]="${em.signingPubKey}";
eachElement["transactionType"] = "${em.transactionType}";
tarray.push(eachElement);
</c:forEach>
	var data = "${result.transactions}";
	console.log(data);
	var array = [
		["acccount_hash", "${result.account_hash}"],
		["accepted", "${result.accepted}"],
		["close_time_human", "${result.close_time_human}"],
		["closed", "${result.closed}"],
		["hash", "${result.hash}"],
		["ledger_index", "${result.ledger_index}"],
		["parent_hash", "${result.parent_hash}"],
		["seqNum", "${result.seqNum}"],
		["transaction_hash", "${result.transaction_hash}"],
		["transactions", "${result.transactions}"]
	];
	
	for(var i=0; i<array.length; i++)
	{
		if (i == 0)
		{
			document.getElementById('contentDiv').innerHTML += 
				'<div class="admin-page-search-table bgGreen" style="width:<%=tableWidth%>;">'
					+ '<span class="admin-detail-table-title MyMoneyText1">' + array[i][0] + '</span>'
					+ '<span class="admin-detail-table-content">' + array[i][1] + '</span>'
			 	+ '</div>';
		}
		else
		{
			if (array[i][0] == "transaction_hash") {
			
				var transaction_hash_value = array[i][1];
				document.getElementById('contentDiv').innerHTML += 
					'<div class="admin-page-search-table bgGreen" style="border-top:none; width:<%=tableWidth%>;">'
						+ '<span class="admin-detail-table-title MyMoneyText1">' + array[i][0] + '</span>'
						+ '<span class="admin-detail-table-content MyMoneyText1 pointer" onclick="window.location.replace(\'showTransaction.do?target=\' + transaction_hash_value)">' + array[i][1] + '</span>'
				 	+ '</div>';
			}
			else if (array[i][0] == "transactions") {

				document.getElementById('contentDiv').innerHTML += 
					'<div class="admin-page-search-table bgGreen" style="border-top:none; width:<%=tableWidth%>;">'
						+ '<span class="admin-detail-table-title MyMoneyText1">' + array[i][0] + '</span>'
						+ '<span id="transactionsDiv" class="admin-detail-table-content"></span></div>';
					
				for(var j = 0; j < tarray.length; j++) {
					document.getElementById('transactionsDiv').innerHTML +=  
						"transaction" + j + '<br/>'
						+ "account :  " + tarray[j]["account"] + '<br/>'
						+ "amount : " + tarray[j]["amount"] + '<br/>'
						+ "destination : " + tarray[j]["destination"] + '<br/>'
						+ "fee : " + tarray[j]["fee"] + '<br/>'
						+ "flags : " + tarray[j]["flags"] + '<br/>'
						+ "Memos : " + tarray[j]["memos"] + '<br/>'
						+ "sequence : " + tarray[j]["sequence"] + '<br/>'
						+ "signingPubKey : " + tarray[j]["signingPubKey"] + '<br/>'
						+ "transactionType : " + tarray[j]["transactionType"] + '<br/>'
						+ '<br/><br/>'							
				}
			}
			else
			{
				document.getElementById('contentDiv').innerHTML += 
					'<div class="admin-page-search-table bgGreen" style="border-top:none; width:<%=tableWidth%>;">'
						+ '<span class="admin-detail-table-title MyMoneyText1">' + array[i][0] + '</span>'
						+ '<span class="admin-detail-table-content">' + array[i][1] + '</span>'
				 	+ '</div>';
			}
		}
	}
</script>