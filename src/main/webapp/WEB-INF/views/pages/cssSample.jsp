<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="comp1-title" style="padding-bottom:3px;">
	<img src="<c:url value='/res/img/' />MarketReadIcon3.gif" alt="" width="4" height="5" style="padding-bottom: 3px">
	<span class="CopyText2">테스트</span>
</div>
<div id="comp1" style="width:600px;"></div>
<script>
    function showTable(page, limit) {
        var options = {
            "table": {"class": "table_templete_admin"},
            "header": {"class": "MyMoneyText1 bgGreen"},
            "columns": [
                {
                    "name": "seq",
                    "readableName": "번호",
                    "class": "help_seq",
                    "style": "width:60px;"
                },
                {
                    "name": "title",
                    "readableName": "제목",
                    "class": "help_title",
                    "style": "width:400px;",
                    "content": "{{ title }}"
                },
                {
                    "name": "reg_date",
                    "readableName": "등록일",
                    "class": "reg_date",
                    "style": "width:140px;",
                    "content": "{{converted_reg_date}}",
                    "variables": {"converted_reg_date":"timestampToDateTime({{reg_date}})"}
                }
            ],
            "paging": {
                "size": 10,
                "class": "paging_templete_admin",
                "onclick": function (event) {
                    page = event.data.page;
                    showTable(page, limit);
                }
            }
        };

        $.ajax({
            url: "http://localhost:8080/cssSample.json?pageNo=" + page + "&limit=" + limit,
            dataType: "json"
        }).done(function (data) {
            new ListingTable(data, options).show('#comp1');
        });
    }

    $(document).ready(function () {
        showTable(1, 10);
    });
</script>