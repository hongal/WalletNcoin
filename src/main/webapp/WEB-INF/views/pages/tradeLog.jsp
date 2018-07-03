<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	String mode = request.getParameter("mode") != null ? request.getParameter("mode") : "";
%>
<div class="primary_container">
	<h3>거래내역</h3>

    <div id="addressListContainer">
        <c:forEach var="address" items="${addressList}">
            <div id="addressRow" class="primary_content_row">
                <div id="address" style="cursor: pointer; width: auto; margin-bottom: 12px; padding: 7px 10px 7px 10px;">${address}</div>
            </div>
        </c:forEach>
    </div>

    <div id="tradeListContainer" class="primary_content_column">
        <div id="tradeList" class="primary_content_column" style="width: 100%;">

        </div>
        <div id="page_container" class="primary_content_row">

        </div>
    </div>
</div>
<script>
    var address;
    var countList = 5;//한페이지 게시물수
    var page = 0;//현재 페이지
    var totalCount;//총 게시물 수
    var totalPage;//총 페이지 수
    var startPage = 0;
    var startRow = 1;
    var array;

    $(document).ready(function(){

        $("#addressListContainer").on('click', "#address", function (event) {
            if(address != $( this ).text()) {
                address = $( this ).text();
                console.log('cl');
                getAddress();

            }
        });

        //받은내역 클릭
/*        $("#tradeLog_button_container").on('click', '#receive_transactions', function (event) {
            $('#receive_transactions').removeClass("button_primary").addClass("button_dark_fixed");
            $('#send_transactions').removeClass("button_dark_fixed").addClass("button_primary");
            $("#receive_transactions").prop('disabled', true);
            $("#send_transactions").prop('disabled', false);
            getTradeLog('receive');
            pageReset();
            //보낸내역 클릭
        }).on('click', '#send_transactions', function (event){
            $('#receive_transactions').removeClass("button_dark_fixed").addClass("button_primary");
            $('#send_transactions').removeClass("button_primary").addClass("button_dark_fixed");
            $("#send_transactions").prop('disabled', true);
            $("#receive_transactions").prop('disabled', false);
            getTradeLog('send');
            pageReset();
        });*/

        $('#page_container').on('click', 'span', function (event) {

            if(page + 1 != $(this).text()){
                page = $(this).text() -1;
            }

            showLog(array);


        });
    });
    
    function getAddress() {
        pageReset()
        getTradeLog();
    }

    function getTradeLog() {
        var data = {
            account: address,
        }
        $.ajax({
            url: '/api/getTradeLog',
            type: 'get',
            contentType : "application/json; charset=UTF-8",
            data: data,
            success: function (args) {
                console.log(args);
                if(args.length > 0){
                    array = args;

                    totalCount = array.length;//총 게시물수 구하기
                    //총 페이지수 구하기

                    totalPage = parseInt(totalCount / countList);

                    if (parseInt(totalCount % countList) > 0) {
                        totalPage++;
                    }
                    $('#tradeList').show();
                    showLog(array);
                }


            }
        });
    }

    function showLog(array){
        var table = '';
        startRow = (page) * 5 + 1;
        var endRow = startRow - 1 + countList;

        if(endRow > totalCount){
            endRow = totalCount;
        }
        for(var i = startRow - 1; i < endRow; i ++ ){
            console.log(i);
            console.log(array[i].destination);
            console.log(array[i].account);

            table += '<div class="primary_content_row" style="justify-content: space-between; align-items: center; margin-top: 12px" >' +
                '<div style="text-align: center;">' + array[i].reg_date + '</div>';
            //입금일경우
            if(array[i].destination == address){
                table += '<div class="primary_content_column"><span style="color: red">입금</span>'
                + '<span>' + array[i].account + '</span></div>';
                //송금일경우
            }else if(array[i].account == address){
                table += '<div class="primary_content_column"><span style="color: blue">송금</span>'
                    + '<span>' + array[i].destination + '</span></div>';
            }
            table += '<div>' + array[i].amount + '</div></div>';
        }

        $('#tradeList').empty();
        $('#tradeList').append(table);

        createPage();
    }

    function createPage(){
        var pageList = '';

        for(var i = startPage + 1; i <= totalPage; i ++){
            pageList += '<span>' + i  + '</span>';
        }

        $("#page_container").empty();
        $("#page_container").append(pageList);

    }
    
    function pageReset() {
        page = 0;
        startRow = 1;
        startPage = 0;
        array = '';
    }
/*
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
*/


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

    // $(document).ready(function () {
    //     showTable(1, 100);
    // });
    
    function setAndShowTable() {
    	var searchType = $('#searchType')[0].value;
    	var query = $('#query')[0].value;
    	
        showTable(1, 100, "search", searchType, query);
    }
</script>
<style>
    #page_container{
        justify-content: center;
        margin-top: 12px;

    }
    #page_container span{
        margin-right: 12px;
        cursor: pointer;
    }
</style>