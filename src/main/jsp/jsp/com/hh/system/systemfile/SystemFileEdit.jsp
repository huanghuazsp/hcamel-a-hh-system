<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.hh.system.util.BaseSystemUtil"%>
<%@page import="com.hh.system.util.Convert"%>
<%=BaseSystemUtil.getBaseDoctype()%>

<html>
<head>
<title>数据编辑</title>
<%=BaseSystemUtil.getBaseJs("checkform","date")%>

<script type="text/javascript">
	var params = $.hh.getIframeParams();
	var width = 600;
	var height = 450;

	var objectid = '<%=Convert.toString(request.getParameter("id"))%>';

	function save() {
		$.hh.validation.check('form', function(formData) {
			Request.request('system-SystemFile-save', {
				data : formData,
				callback : function(result) {
					if (result.success!=false) {
						params.callback(formData);
						Dialog.close();
					}
				}
			});
		});
	}

	function findData() {
		if (objectid) {
			Request.request('system-SystemFile-findObjectById', {
				data : {
					id : objectid
				},
				callback : function(result) {
					$('#form').setValue(result);
				}
			});
		}
	}

	function init() {
		findData();
	}
</script>
</head>
<body>
	<div xtype="hh_content">
		<form id="form" xtype="form" class="form">
			<span xtype="text" config=" hidden:true,name : 'id'"></span>
			<table xtype="form">
				
				
					<tr>
						<td xtype="label">fileSize：</td>
						<td><span xtype="text" config=" name : 'fileSize' "></span></td>
					</tr>
				
					<tr>
						<td xtype="label">path：</td>
						<td><span xtype="text" config=" name : 'path' "></span></td>
					</tr>
				
					<tr>
						<td xtype="label">type：</td>
						<td><span xtype="text" config=" name : 'type' "></span></td>
					</tr>
				
					<tr>
						<td xtype="label">fileType：</td>
						<td><span xtype="text" config=" name : 'fileType' "></span></td>
					</tr>
				
					<tr>
						<td xtype="label">text：</td>
						<td><span xtype="text" config=" name : 'text' "></span></td>
					</tr>
				
					<tr>
						<td xtype="label">serviceId：</td>
						<td><span xtype="text" config=" name : 'serviceId' "></span></td>
					</tr>
				
					<tr>
						<td xtype="label">parentServiceId：</td>
						<td><span xtype="text" config=" name : 'parentServiceId' "></span></td>
					</tr>
				
			</table>
		</form>
	</div>
	<div xtype="toolbar">
		<span xtype="button" config="text:'保存' , onClick : save "></span> <span
			xtype="button" config="text:'取消' , onClick : Dialog.close "></span>
	</div>
</body>
</html>

 
 