<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<% String tableWidth = "1360px"; %>

<div class="block-search-title" style="padding-bottom:3px;">
	<img src="<c:url value='/res/img/' />MarketReadIcon3.gif" alt="" width="4" height="5" style="padding-bottom: 3px">
	<span class="CopyText2">블록 검색</span>
</div>
<div class="admin-page-search-table bgGreen" style="box-sizing:border-box; width:<%=tableWidth%>;">
	<span class="admin-page-search-table-title MyMoneyText1">검색</span>
	
	<span class="admin-page-search-table-content">
	
		<select id="searchType" class="v_align_middle" onchange="toggleSearchType(this.value);">
			<option value="block_hash">블록해쉬</option>
			<option value="parent_hash">부모해쉬</option>
			<option value="transaction_count">트랜젝션 개수</option>
			<option value="reg_date">생성일</option>
		</select>
		
		
		<input id="query" type="text" autocomplete="off" class="v_align_middle datetimepicker">
		
		<span id="rangeQuery" style="display: none;">
			~ <input id="query2" type="text" autocomplete="off" class="v_align_middle datetimepicker">
		</span>
		
		<script>
			function toggleSearchType(searchType) {
				// 일반검색 or 범위검색
				if (searchType == 'block_hash' || searchType == 'parent_hash') {
					// 일반검색
					$('#rangeQuery')[0].style.display = 'none';
					
				} else {
					// 범위검색
					$('#rangeQuery')[0].style.display = '';
				}
				
				// 달력 on or off
				if (searchType == 'reg_date') {					
					// datetimepicker on
					$('.datetimepicker').datetimepicker({
						validateOnBlur: false,
						openOnFocus: true,
						lang: 'ko',
						format: 'Y-m-d H:i:00',
						defaultTime: '00:00',
						step: 60
					});
					
				} else {
					// datetimepicker off
					$('.datetimepicker').datetimepicker({
						validateOnBlur: false,
						openOnFocus: false
					});
				}
			}
		</script>
		
		<button class="greenBtn v_align_middle pointer" onclick="setAndShowTable()">조회</button>
	</span>
</div>

<div class="block-list-title" style="padding-bottom:3px; margin-top:15px;">
	<img src="<c:url value='/res/img/' />MarketReadIcon3.gif" alt="" width="4" height="5" style="padding-bottom: 3px">
	<span class="CopyText2">블록 목록</span>
</div>
<div id="block-list-table" style="width:<%=tableWidth%>;"></div>
<script>
    function showTable(page, limit, type, searchType, query, query2) {
	
		type = type || null;
		searchType = searchType || null;
		query = query || null;
		query2 = query2 || null;
		
        var options = {
            "type":"table",
            "table": {"class": "table_templete_admin","attrs":"cellspacing=\"0\""},
            "header": {"class": "MyMoneyText1 bgGreen"},
            "columns": [
                {
                    "name": "row_num",
                    "readableName": "번호",
                    "style": "width:60px;"
                },
                {
                    "name": "block_hash",
                    "readableName": "블록해쉬",
                    "style": "width:520px;",
                    "content": "<a class=\"pointer\" onclick=\"window.location.replace('<c:url value='showLedgerDetail.do' />?target={{block_hash}}')\">{{block_hash}}</a>"
                },
                {
                    "name": "parent_hash",
                    "readableName": "부모해쉬",
                    "style": "width:520px;",
                    "content": "<a class=\"pointer\" onclick=\"window.location.replace('<c:url value='showLedgerDetail.do' />?target={{parent_hash}}')\">{{parent_hash}}</a>"
                },
                {
                    "name": "transaction_count",
                    "readableName": "트랜젝션 개수",
                    "style": "width:120px;"
                },
                {
                    "name": "reg_date",
                    "readableName": "생성일",
                    "style": "width:140px;",
                    "content": "{{convd_reg_date}}",
                    "variables": {"convd_reg_date":"timestampToDateTime({{reg_date}})"}
                }
            ],
            "paging": {
                "size": 10,
                "class": "paging_templete_admin",
                "onclick": function (event) {
                    page = event.data.page;
                    showTable(page, limit, type, searchType, query, query2);
                }
            }
        };
        
        var addUrl = "?pageNo=" + page + "&limit=" + limit;
    	addUrl += type == null ? '' : "&type=" + type;
    	addUrl += searchType == null ? '' : "&searchType=" + searchType;
    	addUrl += query == null ? '' : "&query=" + query;
    	addUrl += query2 == null ? '' : "&query2=" + query2;
    	
    	console.log(addUrl);

        $.ajax({
            url: "<c:url value='ledgerList.json' />" + addUrl,
            dataType: "json"
        }).done(function (data) {
            new ListingTable(data, options).show('#block-list-table');
        });
    }

    $(document).ready(function () {
        showTable(1, 100);
    });
    
    function setAndShowTable() {
    	var searchType = $('#searchType')[0].value;
    	var query = $('#query')[0].value;

       	var query2 = $('#rangeQuery')[0].style.display == 'none' ? null : $('#query2')[0].value;
       	
        showTable(1, 100, "search", searchType, query, query2);
    }
</script>
