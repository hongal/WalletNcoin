<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<% String tableWidth = "840px"; %>

<div class="node-search-title" style="padding-bottom:3px;">
	<img src="<c:url value='/res/img/' />MarketReadIcon3.gif" alt="" width="4" height="5" style="padding-bottom: 3px">
	<span class="CopyText2">노드 검색</span>
</div>
<div class="admin-page-search-table bgGreen" style="box-sizing:border-box; width:<%=tableWidth%>;">
	<span class="admin-page-search-table-title MyMoneyText1">검색</span>
	
	<span class="admin-page-search-table-content">
		<select id="searchType" class="v_align_middle" onchange="toggleSearchType(this.value);">
			<option value="address">어드레스</option>
			<option value="complete_ledgers">마지막 레져</option>
			<option value="uptime">가동시간</option>
			<option value="latency">지연시간</option>
			<option value="version">버전</option>
		</select>
		
		<input id="query" type="text" autocomplete="off" class="v_align_middle datetimepicker">
		
		<span id="rangeQuery" style="display: none;">
			~ <input id="query2" type="text" autocomplete="off" class="v_align_middle datetimepicker">
		</span>
		
		<script>
			function toggleSearchType(searchType) {
				// 일반검색 or 범위검색
				if (searchType == 'address' || searchType == 'complete_ledgers' || searchType == 'version') {
					// 일반검색
					$('#rangeQuery')[0].style.display = 'none';
					
				} else {
					// 범위검색
					$('#rangeQuery')[0].style.display = '';
				}
				
				// 달력 on or off
				if (searchType == 'uptime' || searchType == 'latency') {					
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

<div class="node-list-title" style="padding-bottom:3px; margin-top:15px;">
	<img src="<c:url value='/res/img/' />MarketReadIcon3.gif" alt="" width="4" height="5" style="padding-bottom: 3px">
	<span class="CopyText2">노드 목록</span>
</div>
<div id="node-list-table" style="width:<%=tableWidth%>;"></div>
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
                    "name": "num",
                    "readableName": "공개키",
                    "style": "width:60px;"
                },
                {
                    "name": "address",
                    "readableName": "어드레스",
                    "style": "width:240px;"
                },
                {
                    "name": "complete_ledgers",
                    "readableName": "마지막 레져",
                    "style": "width:240px;"
                },
                {
                    "name": "uptime",
                    "readableName": "가동시간",
                    "style": "width:100px;"
                },
                {
                    "name": "latency",
                    "readableName": "지연시간",
                    "style": "width:100px;"
                },
                {
                    "name": "version",
                    "readableName": "버전",
                    "style": "width:100px;"
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
            url: "<c:url value='nodeList.json' />" + addUrl,
            dataType: "json"
        }).done(function (data) {
        	console.log(data);
            new ListingTable(data, options).show('#node-list-table');
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
