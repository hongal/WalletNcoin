<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<% String tableWidth = "900px"; %>
<% String target = request.getParameter("target") != null ? request.getParameter("target") : ""; %>

<div class="trade-list-title" style="padding-bottom:3px;">
	<img src="<c:url value='/res/img/' />MarketReadIcon3.gif" alt="" width="4" height="5" style="padding-bottom: 3px">
	<span class="CopyText2">트랜잭션 상세 조회</span>
</div>

<div id="contentDiv"></div>
<script>
	var array = [
		["account", "${result.account}"],
		["amount", (parseInt("${result.amount}")/1000000).toFixed(6)],
		["destination", "${result.destination}"],
		["fee", (parseInt("${result.fee}")/1000000).toFixed(6)],
		["flags", "${result.flags}"],
		["memos", "${result.memos}"],
		["signingPubKey", "${result.signingPubKey}"],
		["sequence", "${result.sequence}"],
		["transactionType", "${result.transactionType}"],
		["txnSignature", "${result.txnSignature}"],
		["date", "${result.date}"],
		["hash", "${result.hash}"],
		["inLedger", "${result.inLedger}"],
		["ledger_index", "${result.ledger_index}"],
		["status", "${result.status}"]
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
			document.getElementById('contentDiv').innerHTML += 
				'<div class="admin-page-search-table bgGreen" style="border-top:none; width:<%=tableWidth%>;">'
					+ '<span class="admin-detail-table-title MyMoneyText1">' + array[i][0] + '</span>'
					+ '<span class="admin-detail-table-content">' + array[i][1] + '</span>'
			 	+ '</div>';
		}
	}
</script>
