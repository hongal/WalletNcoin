<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	String tableWidth = "840px";
	String mode = request.getParameter("mode") != null ? request.getParameter("mode") : "";
%>

<div class="wallet-search-title" style="padding-bottom:3px;">
	<img src="<c:url value='/res/img/' />MarketReadIcon3.gif" alt="" width="4" height="5" style="padding-bottom: 3px">
	<span class="CopyText2">지갑 검색</span>
</div>
<div class="admin-page-search-table bgGreen" style="box-sizing:border-box; width:<%=tableWidth%>;">
	<span class="admin-page-search-table-title MyMoneyText1">검색</span>
	
	<span class="admin-page-search-table-content">
		<select id="searchType" class="v_align_middle">
			<option value="address">주소</option>
		</select>
		<input id="query" type="text" class="v_align_middle">
		<button class="greenBtn v_align_middle pointer" onclick="setAndShowTable()">조회</button>
	</span>
	
	<span class="admin-page-search-table-content" style="width:70px; text-align:center;">
		<button onclick="makeAddress();">지갑생성</button>
	</span>
</div>

<div class="wallet-list-title" style="padding-bottom:3px; margin-top:15px;">
	<img src="<c:url value='/res/img/' />MarketReadIcon3.gif" alt="" width="4" height="5" style="padding-bottom: 3px">
	<span class="CopyText2">지갑 목록</span>
</div>
<div id="wallet-list-table" style="width:<%=tableWidth%>;"></div>
<script>
    function showTable(page, limit, mode, type, searchType, query) {
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
                    "name": "address",
                    "readableName": "주소",
                    "style": "width:280px;",
                    "content": "<a class=\"pointer\" onclick=\"window.open('<c:url value='sendMoney.do' />?target={{address}}')\">{{address}}</a>"
                },
                {
                    "name": "amount",
                    "readableName": "소유금액(acoin)",
                    "style": "width:180px;",
                    "content": "{{amountToFormat}}",
                    "variables": {
                        "amountToFormat": "(new BigNumber('{{amount}}')).div(1000000).toFormat(6)"
                    },
                },
                {
                    "name": "update_date",
                    "readableName": "마지막 트랜젝션 발생일",
                    "style": "width:160px;",
                    "content": "{{convd_update_date}}",
                    "variables": {
						"convd_update_date": "timestampToDateTime({{update_date}})"
					}
                },
                {
                    "name": "reg_date",
                    "readableName": "등록일(최신생성순)",
                    "style": "width:160px;",
                    "content": "{{convd_reg_date}}",
                    "variables": {
						"convd_reg_date": "timestampToDateTime({{reg_date}})"
					}
                }
            ],
            "paging": {
                "size": 10,
                "class": "paging_templete_admin",
                "onclick": function (event) {
                    page = event.data.page;
                    showTable(page, limit, mode, type, searchType, query);
                }
            }
        };

        $.ajax({
            url: "<c:url value='walletList.json' />?pageNo=" + page + "&limit=" + limit + "&mode=" + mode + "&type=" + type + "&searchType=" + searchType + "&query=" + query,
            dataType: "json"
        }).done(function (data) {
            new ListingTable(data, options).show('#wallet-list-table');
        });
    }
    

    $(document).ready(function () {
        showTable(1, 100, "<%=mode%>");
    });
    
    function setAndShowTable() {
    	var searchType = $('#searchType')[0].value;
    	var query = $('#query')[0].value;
    	
        showTable(1, 100, "<%=mode%>", "search", searchType, query);
    }

    
    function makeAddress(){
    	callWizAjax({
 			url : "<c:url value='/makeNewAddres.json' />"
				,data : {
				}
				,success : function(data) {
					if(data.status=='error'){
						alert(data.error+"\t"+data.errMsg);
						return;
					}
					console.log(data);
					alert("ID:["+data.id
					+"]\nseed:["+data.seed+"]"		
					);
				}
				,complete : function() {
				}
    	});
    	
    }
</script>
