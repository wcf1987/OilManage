		$().ready(function(){
			$('#hydraulic_tab,#input-container,#output-container').easytabs({
				animate: false
			});	
			$('#importExcel').uploadify({
				'swf' : 'js/upload/uploadify.swf',				
				'cancelImg'   : 'js/upload/cancel.png',
				'uploader' : 'uploadExcel.action',
				'queueID' : 'fileQueue',
				'auto' : true,
				'multi' : false,
				'buttonText' : '导入Excel',
				'fileSizeLimit' : '5MB',
				'fileObjName' : 'excelImport',
				'onUploadSuccess' : uploadComplete,
				'method' : 'post',
				'fileTypeDesc' : '请选择xls xlsx文件',
			    'fileTypeExts' : '*.xls; *.xlsx;',
			    'onUploadStart': function (file) { 		
			    	$("#importExcel").uploadify("settings", "formData",
			    			{ 'proID':$("#proID").val(),'algID':$("#curAlgID").val(),'InOrOut':"In" });  
			    }
 			
			});
			}); 
		function uploadComplete(file, data, response) {
			var tempJson = jQuery.parseJSON(data);
			if(tempJson['msg']==null||tempJson['msg']==''){
				alert("上传成功！");
				//openProject($("#proID").val());
				var sheetDiv = "#sheet";
				var inputSheetNum=$("#inputSheetNum").val();
				for(var i=0;i<inputSheetNum;i++){//刷新5个表格
			    	$(sheetDiv+i).trigger("reloadGrid");
			    }
			}else{
				alert(tempJson['msg']);
			}
		}

		function saveExcel(){
			$.ajax({
				type:'post',
				url:'saveExcel.action',
				data:{
					proID:$("#proID").val(),
					algID:$("#curAlgID").val(),
					InOrOut:"In"
				},
				dataType:'json',
				success:function(data){
					alert("保存成功！");
					var sheetGrid=new SheetGrid();
					sheetGrid.reloadGrid();
				},
				error:function(msg){
					alert(msg);
				}
			});
		}
		var intervalID;
		function runAlg(){
			$.ajax({
				type:'post',
				url:'runAlgPro.action',
				data:{
					ID:$("#proID").val()
				},
				dataType:'json',
			    beforeSend:function(XMLHttpRequest){
			    	$("#outputarea").text("");
			    	intervalID=setInterval ("listLog()", 5000);//每隔一段时间去请求日志信息
			    	location.href=window.location.pathname+"#run_tab";
			    	//location.href = "pages/simulate_hydraulic.jsp#run_tab";
			    	$("#isRunning").css({display:"block",top:"20%",left:"40%",position:"absolute"});
			    },
				success:function(data){				
					//$("#isRunning").hide();		
					if(data.msg==null||data.msg==""){
						//alert("运行结束！")
					}else{
						alert(data.msg);
					}					
				},
				error:function(msg){						
					alert(msg);	
				}
			});
		}
		function exportInputExcel(){
			$.ajax({
				type:'post',
				url:'exportFile.action',
				data:{
					proID:$("#proID").val(),
					algID:$("#curAlgID").val(),
					InOrOut:"In"
				},
				dataType:'json',
				success:function(data){
					location.href=data.filePath;
				},
				error:function(msg){
					alert(msg);
				}
			});
		}
		
		function listLog()
		{
			$.ajax({
				type:'post',
				url:'listLog.action',
				data:{
					ID:$("#proID").val()
				},
				dataType:'json',
				success:function(data){
					if(data.status!=1){//如果算法运行结束，则停止日志刷新程序
						window.clearInterval(intervalID);
						$("#isRunning").hide();	
					}			
					$.each(data.loginfo,function(index,log){
						if(log!=null&&log!=""){
							$("#outputarea").text(log.logTime.replace("T"," ")+" "+log.info+"\n\r");
						}	 	
					});
					
				
				},
				error:function(msg){
					$("#outputarea").append("通信失败！\n\r");
					
				}
			});

		}
		function loadOutput(){
			location.href=window.location.pathname+"#output_tab";
			//location.href="pages/simulate_hydraulic.jsp#output_tab";
			var proid=$("#proID").val();
			var sid = 1;
			var algid = $("#curAlgID").val();
			var outputSheetNum=$("#outputSheetNum").val();
			//var inOrOut="In";
			var inOrOut="Out";
			var sheetDiv = "#output_sheet";
			var pageDiv = "#output_pager";
			var delID="output_delsheet";
			for(var i=0;i<outputSheetNum;i++){
				var sheetgrid = new SheetGrid();
				sheetgrid.GetDynamicCols(i, algid,inOrOut);
				sheetgrid.creategrid(proid, sheetDiv+i, pageDiv+i,delID+i);				
			}
		}
		function exportOutputExcel(){
			$.ajax({
				type:'post',
				url:'exportFile.action',
				data:{
					proID:$("#proID").val(),
					algID:$("#curAlgID").val(),
					InOrOut:"Out"
				},
				dataType:'json',
				success:function(data){
					location.href=data.filePath;
				},
				error:function(msg){
					alert(msg);
				}
			});
		}
		function openProjectModal(){
			$('#add_project_modal').modal();
			$('#load_modal').modal('hide');
			createNewProject();
		}

		function listProjectModal(){
			$('#list_project_modal>.modal-dialog').css({
				 'margin-top': function () {
				            return ($(window).height())/2-this.height/2;
				        },
				 'margin-right':function () {
				            return 800;
				            //(($(window).width())/2-this.width/2);
				        }
				});
			$('#list_project_modal').modal();
			$('#load_modal').modal('hide');
		}
