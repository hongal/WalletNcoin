/**
 *<pre>
 *
 * /res/js/jquery.blockUI.js 와 종속관계가 있으며 
 * /res/js/jquery.blockUI.js 보다 아래에 선언 되어야함
 *
 * sample)
 * 
 * 	callWizAjax({
			url : "./login.json"
			,data : null
			,error : function( jqXHR, textStatus, errorThrown) {
			}
			,success : function(data) {
			}
			,complete : function() {
			}
	});
 * 
 * ajax 를 사용하기 위해 사용하는 함수
 * 
 * http://api.jquery.com/jquery.ajax/ 를 그대로 사용한다
 * 
 *  추가옵션:
 *  	isLock 
 *      isLock 의 옵션에 따라 화면의 락여부를 결정 한다
 *
 *var defaultOption={
		isLock : true
		,async :true
		,dataType :"json"
		,url : ""
		,method:"post"
		,data : null
		,error : function(error) {
			alert("Error!");
		}
		,success : function(data) {
			alert("success!");
			console.log(deata);
		}
		,complete : function() {
			console.log("beforeSend:function");
		}
		,beforeSend:function(){
			console.log("beforeSend:function");
		}
		
	};	
	
	sample_
 * 
 * </pre>
 * @param option
 * @returns
 */
function callWizAjax(option){
	var defaultOption={
		isLock : true
		,async :true
		,dataType :"json"
		,url : ""
		,method:"post"
		,data : null
		,error : function(error) {
			console.log("error::");
			console.log(error);
			if(error && error.errMsg){
				alert(error.errMsg);
			}
		}
		,success : function(data) {
			alert("success!");
		}
		,complete : function() {
			console.log("complete:function");
		}
		,beforeSend:function(){
			console.log("beforeSend:function");
		}
		
	};	
	var optionOveride = $.extend(defaultOption, option);
	var exoptionOveride = {
			beforeSend:function(){
				optionOveride.beforeSend();
				console.log('before?');
				if(optionOveride.isLock){
					$.blockUI({ css: { 
						border: 'none', 
						padding: '15px', 
						backgroundColor: '#000', 
							'-webkit-border-radius': '10px', 
							'-moz-border-radius': '10px', 
						opacity: .5, 
						color: '#fff' 
						}}); 
				}
				
			}
			,method:optionOveride.method
			,dataType:optionOveride.dataType
			,async:optionOveride.async
			,url:optionOveride.url
			,data:optionOveride.data
			,error:optionOveride.error
			,success:function(data){
				if(data.stateCode==200)
					optionOveride.success(data);
				else
					optionOveride.error(data);
			}
			,complete : function(){
				if(optionOveride.isLock){
					$.unblockUI();
				}
				optionOveride.complete();
			}
	};
	$.ajax(exoptionOveride);
	
}