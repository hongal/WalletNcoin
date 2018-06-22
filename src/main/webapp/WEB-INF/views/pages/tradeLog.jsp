<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	String mode = request.getParameter("mode") != null ? request.getParameter("mode") : "";
%>

<div class="primary_container">
	<h3>거래내역</h3>
	<div class="primary_content_row">
		<button class="button_primary" id="receive_transactions" onclick="showreceive()">받은내역</button>
		<button class="button_dark" id="send_transactions" onclick="showsend()">보낸내역</button>
	</div>

	<div class="trade-list-title" style="padding-bottom:3px; margin-top:15px;">
		<img src="<c:url value='/res/img/' />MarketReadIcon3.gif" alt="" width="4" height="5" style="padding-bottom: 3px">
		<span class="CopyText2">송금 로그 목록</span>
	</div>
	<div id="trade-list-table"></div>
</div>





<script>

	
	function showreceive() {
		var searchType = "aaa";
		var query = "bbb";
		showTable(1, 100, "receive", searchType, query);
	}
	
	function showsend() {
		var searchType = "aaa";
		var query = "bbb";
		showTable(1, 100, "send", searchType, query);
	}


    function showTable(page, limit, type, searchType, query) {
        var options = {
            "type":"table",
            "table": {"class": "table_templete_admin", "attrs": "cellspacing=\"0\""},
            "header": {"class": "MyMoneyText1 bgGreen"},
            "columns": [
                {
                    "name": "row_num",
                    "readableName": "번호",
                    "style": "width:60px;"
                },
                {
                    "name": "account",
                    "readableName": "송신자",
                    "style": "width:280px;",
                    "content": "<a class=\"pointer\" onclick=\"window.open('<c:url value='sendMoney.do' />?target={{account}}')\">{{account}}</a>"
                },
                {
                    "name": "destination",
                    "readableName": "수신자",
                    "style": "width:280px;",
                    "content": "<a class=\"pointer\" onclick=\"window.open('<c:url value='sendMoney.do' />?target={{destination}}')\">{{destination}}</a>"
                },
                {
                    "name": "amount",
                    "style": "width:160px;",
                    "readableName": "송금량(drop)",
                    "content": "{{amountToFormat}}",
                    "variables": {
                        "amountToFormat": "(new BigNumber('{{amount}}')).div(1000000).toFormat(6)"
					}
                },
                {
                    "name": "transaction_hash",
                    "style": "width:520px;",
                    "readableName": "트랜잭션해쉬",
                    "content": "<a class=\"pointer\" onclick=\"window.location.replace('<c:url value='showTransaction.do' />?target={{transaction_hash}}')\">{{transaction_hash}}</a>"
                    
                },
                {
                    "name": "update_time",
                    "readableName": "체결날짜",
                    "style": "width:140px;",
                    "content": "{{convd_update_time}}",
                    "variables": {
						"convd_update_time": "timestampToDateTime({{update_time}})"
					}
                }
            ],
            "paging": {
                "size": 10,
                "class": "paging_templete_admin",
                "onclick": function (event) {
                    page = event.data.page;
                    showTable(page, limit, type, searchType, query);
                }
            }
        };

        $.ajax({
            url: "<c:url value='tradeLog.json' />?pageNo=" + page + "&limit=" + limit + "&mode=admin" + "&type=" + type + "&searchType=" + searchType + "&query=" + query,
            dataType: "json"
        }).done(function (data) {
            new ListingTable(data, options).show('#trade-list-table');
        });
    }

    $(document).ready(function () {
        showTable(1, 100);
    });
    
    function setAndShowTable() {
    	var searchType = $('#searchType')[0].value;
    	var query = $('#query')[0].value;
    	
        showTable(1, 100, "search", searchType, query);
    }
</script>