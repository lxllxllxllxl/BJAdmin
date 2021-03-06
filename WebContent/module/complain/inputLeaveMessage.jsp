<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" class="app">
<head>
<meta charset="utf-8" />
<title>毕加数据</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
<link rel="stylesheet" href="../../css/app.v2.css" type="text/css" />
<link rel="stylesheet" href="../../js/calendar/bootstrap_calendar.css" type="text/css" cache="false" />
<script src="../../js/app.v2.js"></script>
<script src="../../resources/js/jquery.validate.min.js"></script>
</head>
<body>
	<%@ include file="../../navHead.jsp" %>
	<div class="col-lg-7">
	<h3>客户留言录入</h3>
	<br>
	<form id="complain" action="insert" method="post" sytle="display:"> 
		

		<div class="form-group">
			<label >客户名称</label>
			<input class="form-control {required:true,minlength:5,,messages:{required:'请输入客户名称'}" 
			 id="name1" placeholder="请输入客户名称"  name="complain.customerName" />
		</div>
		<div class="form-group">
			<label>电话</label>
			<input class="form-control" placeholder="请输入电话" name="complain.phone">
		</div>
		<div class="form-group">
			<label>地址</label>
			<input class="form-control" placeholder="请输入地址" name="complain.address">
		</div>
		<div class="form-group">
			<label for="Select">处理状态</label>
			<select id="disabledSelect" class="form-control" name="complain.status">
				<option>已处理</option>
				<option>正在处理</option>
			</select>
		</div>
		<div class="form-group">
			<label>反馈信息</label>
			<textarea class="form-control" name="complain.msg" rows="3"></textarea>
		</div>
  		<br>
	  	<button type="submit" class="btn btn-large btn-success">提交</button>
	</form>
	  	<!--弹出显示框-->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		    <div class="modal-dialog">
		        <div class="modal-content">
		            <div class="modal-header">
		                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		                <h4 class="modal-title" id="myModalLabel">提示</h4>
		            </div>
		            <div class="modal-body">
		           		<div id="result"></div>
		            </div>
		            <div class="modal-footer">
							 <button  onclick="javascript:window.location.href='../../mainPage.jsp'"
									type="button" class="btn btn-default"
									data-dismiss="modal">关闭</button>
		            </div>
		        </div>
		        <!-- /.modal-content -->
		    </div>
		</div>

	</div>
	
	
	<script>

	$().ready(function() {	
		// validate signup form on keyup and submit
		$("#complain").validate({
			rules: {
				
			},
			messages: {
				
			},
			submitHandler:function(){
    		    var txtHtml;
    			$.ajax({
    				url:'insert',
    				data:$('#complain').serialize(),
    				type:"POST",
    				success:function(data2){
    					var data;
     					 try {
     						  data = $.parseJSON(data2);
     						}   catch  (e)   {
     						    alert("网络异常 请重新登陆");
     						} 
     						
       	                if(data.resultcode == "200"){
       	                	txtHtml="<p class='text-info'>客户 " + data.customerName + " 的反馈信息插入成功</p>";
       	                }else{
       	                	txtHtml="<p class='text-warning'>插入失败 </p>";
       	                }
   	                $("#result").html(txtHtml);
       				$("#myModal").modal("show");
    	            }
    			});
	        }
		});
	});
	</script>
	<%@ include file="../../navTail.jsp" %>
</body>
</html>