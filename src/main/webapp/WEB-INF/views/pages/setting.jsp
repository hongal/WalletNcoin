<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<% String tableWidth = "800px"; %>
<% String target = request.getParameter("target") != null ? request.getParameter("target") : ""; %>

<div class="node-search-title" style="padding-bottom:3px;">
	<img src="<c:url value='/res/img/' />MarketReadIcon3.gif" alt="" width="4" height="5" style="padding-bottom: 3px">
	<span class="CopyText2">일반설정</span>
</div>

<div class="admin-page-search-table bgGreen" style="width:<%=tableWidth%>;">
	<span class="admin-page-input-table-title MyMoneyText1" style="padding-bottom:10px;">수수료(XRP)</span>
	
	<span class="admin-page-search-table-content" style="padding-bottom:10px;">
		<input id="fee" type="text" class="v_align_middle admin-page-input-table-inputText">
	</span>
</div>

<div class="admin-page-search-table bgGreen" style="border-top:none; width:<%=tableWidth%>;">	
	<span class="admin-page-search-table-button align_center">
		<button class="greenBtn v_align_middle pointer" style="width: 70px;" onclick="saveSetting()">저장하기</button>
	</span>
</div>
<br>

<div class="node-search-title" style="padding-bottom:3px;">
	<img src="<c:url value='/res/img/' />MarketReadIcon3.gif" alt="" width="4" height="5" style="padding-bottom: 3px">
	<span class="CopyText2">config</span>
</div>

<div id="viewSetting"></div>

<script>
	getFee();
	getSetting();
	
	function getSetting() {
		
		var descriptions = [
			{"key"			: "port_ws_public",
			 "description"	: "웹소켓 통신 포트 설정"},
			{"key"			: "protocol",
			 "description"	: "통신 프로토콜"},
			{"key"			: "port",
			 "description"	: "포트 "},
			{"key"			: "ip",
			 "description"	: "ip 주소"},
			{"key"			: "port_rpc_admin_local",
			 "description"	: "rpc 통신(관리자) 포트 설정"},
			{"key"			: "port_peer",
			 "description"	: "피어 포트 설정(ncoind consensus logic 관련)"},
			{"key"			: "port_ws_admin_local",
			 "description"	: "웹소켓 통신(관리자) 포트 설정"},
			{"key"			: "database_path",
			 "description"	: "데이터베이스 경로"},
			{"key"			: "ssl_verify",
			 "description"	: "ssl 설정값 (0 -> 설정 안함)"},
			{"key"			: "validation_seed",
			 "description"	: "밸리데이션 시드값"},
			{"key"			: "rpc_startup",
			 "description"	: "rpc 시작시 설정"},
			{"key"			: "severity",
			 "description"	: "정도값(debug, info, trace, fatal 등등)"},
			{"key"			: "command",
			 "description"	: "실행할 커맨드"},
			{"key"			: "validation_quorum",
			 "description"	: "정족수"},
			{"key"			: "ips",
			 "description"	: "peer 프로토콜 ip들"},
			{"key"			: "debug_logfile",
			 "description"	: "로그 파일"},
			{"key"			: "sntp_servers",
			 "description"	: "타임 서버"},
			{"key"			: "strip_servers",
			 "description"	: ""},
			{"key"			: "validation_file",
			 "description"	: "validation key가 들어있는 파일"},
			{"key"			: "node_db",
			 "description"	: "db 설정"},
		];
		
		callWizAjax({
				url : "<c:url value='/getSetting.json' />"
				,data : {
				}
				,success : function(data) {
					console.log(data);

		            var datas = [];
		            datas.key = [];
		            datas.value = [];
		            datas.depth = [];
		            
					// 0
                    $.each(data, function(key, value) {
                    	datas.key.push(key);
                    	datas.value.push(value);
                    	datas.depth.push(0);

                    	if (jQuery.isPlainObject(value)) {
        					// 1
                            $.each(value, function(key1, value1) {   
                            	datas.key.push(key1);
                            	datas.value.push(value1);
                            	datas.depth.push(1);
                            	
                            	if (jQuery.isPlainObject(value1)) {
                					// 2
	                                $.each(value1, function(key2, value2) {	 
	                                	datas.key.push(key2);
	                                	datas.value.push(value2);
	                                	datas.depth.push(2);
	                                	
	                                	if (jQuery.isPlainObject(value2)) {
	                                    	// 3
	    	                                $.each(value2, function(key3, value3) {
	    	                                	datas.key.push(key3);
	    	                                	datas.value.push(value3);
	    	                                	datas.depth.push(3);
	    	                                });
	                                	}
	                                });
                            	}
                            });
                    	}
                    });
		            
					
					var echo_string = "";
					
					for (var i=0; i<datas.key.length; i++)
					{
						// div style
						var addStyle = addStyle = i == 0 ? '' : datas.depth[i] == 0 ? ' margin-top: 7px;' : ' border-top: none;';

						// div open
						echo_string += '<div class="admin-page-search-table bgGreen" style="width:<%=tableWidth%>;' + addStyle + '">';

						// title div open
						echo_string += '<div class="setting-conf-table-title">';
						
						// title tab size
						var tab_size = datas.depth[i] * 15;
						var key_tab_size = tab_size ? tab_size + 'px' : '0';
						var des_tab_size = tab_size ? (tab_size + 8) + 'px' : '0';
						
						// title head mark
						var head_mark = datas.depth[i] > 0 ? '- ' : '';
						
						// title (key)
						echo_string += '<div class="MyMoneyText1" style="margin-left:' + key_tab_size + ';">' + head_mark + datas.key[i] + '</div>';
						
						
						// title (description)
						for (var j=0; j<descriptions.length; j++) {
							if (descriptions[j].key == datas.key[i]) {
								echo_string += '<div style="margin-top: 2px; margin-left:' + des_tab_size + '; font-weight: normal;">' + descriptions[j].description + '</div>';
								break;
							}
						}
						
						// title div close
						echo_string += '</div>';
						
						// content div (if value is not object)
						echo_string += jQuery.isPlainObject(datas.value[i])
									 ? '' : '<div class="setting-conf-table-content">' + datas.value[i] + '</div>';
						
							 	 
						// div close
						echo_string += '</div>';
					}
                    
					$('#viewSetting').html(echo_string);
				}
				,complete : function() {
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
					$('#fee')[0].value = (data.fee/1000000).toFixed(6) ;
				 
				}
				,complete : function() {
				}
		});
		
	}

	function saveSetting() {
    	var fee = $('#fee')[0];
    	

     	if (!fee || fee == '')
   		{
     		fee.focus();
    		alert('송금받을 지갑 주소 미입력');
   			return false;
   		}
     	
    	if (confirm(fee.value + '로' +  ' 저장하시겠습니까?'))
		{			
        	callWizAjax({
     			url : "<c:url value='/saveSetting.json' />"
  				,data : {
  					fee:fee.value * 1000000
  				}
  				,success : function(data) {
  					console.log(data);
  					alert("성공");
  					var curUrl = "<c:url value='/setting.do' />";
  					<%=target != "" ? "location.href = curUrl;" : "" %> 
  				}
  				,complete : function() {
  				}
        	});
		}
	}


</script>