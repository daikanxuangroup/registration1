<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'booktable.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="jquery-3.2.1.js"></script>
	<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="easyui/locale/easyui-lang-zh_CN.js"></script>
	<link rel="stylesheet" type="text/css" href="easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">
	<script type="text/javascript" src="yypb/bookable.js"></script>
  </head>
  
  <body>
    <div class="easyui-layout" style="width:100%;height:100%">
    	<div data-options="region:'north',title:'按周查询排班情况'" style="width:100%;height:80px;padding:10px">
    		选择科室：
    		<select id="cc" class="easyui-combobox" name="dept" style="width:100px;">   
   		 		 
			</select>
			 &nbsp;&nbsp;&nbsp;
    		<input id="dd" type="text" class="easyui-datebox" required="required"></input>  
    		
    		<button class="easyui-linkbutton" iconCls="icon-search"  onclick="searchbook()">查询该周排班</button>&nbsp;
    		<button class="easyui-linkbutton" iconCls="icon-add"  onclick="addbook()">自动按周排班</button>
    	</div>
    	<div data-options="region:'center',fit:true">
    		<table id="dg_bookable" title="周排班表" iconCls="icon-save">
	    		
    		</table>
    		<div id=bTool>
    			<button class="easyui-linkbutton" iconCls="icon-cut" plain="true"  onclick="removeBkb()">删除该周排班</button>
    		</div>
    	</div>
    </div>
  </body>
</html>
