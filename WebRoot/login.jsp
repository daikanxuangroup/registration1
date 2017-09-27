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
    
    <title>My JSP 'login.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->	
	 <script type="text/javascript" src="${pageContext.request.contextPath }/resources/easyui/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/easyui/locale/easyui-lang-zh_CN.js"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/easyui/themes/icon.css">
	<link href="${pageContext.request.contextPath }/resources/css/nk_login.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/style.css">
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/departs.js"></script>
	    
    <link rel="stylesheet" type="text/css" 
	href="${pageContext.request.contextPath }/resources/static/h-ui/css/H-ui.min.css" />
	<link rel="stylesheet" type="text/css"
	 href="${pageContext.request.contextPath }/resources/static/h-ui.admin/css/H-ui.admin.css" />
	<link rel="stylesheet" type="text/css"
	 href="${pageContext.request.contextPath }/resources/lib/Hui-iconfont/1.0.8/iconfont.css" />
	<link rel="stylesheet" type="text/css"
	 href="${pageContext.request.contextPath }/resources/static/h-ui.admin/skin/default/skin.css" id="skin" />
	<link rel="stylesheet" type="text/css" 
	href="${pageContext.request.contextPath }/resources/static/h-ui.admin/css/style.css" />
	
		
		<script type="text/javascript">
		function submitForm(){
			$('#ff').submit();  	
		}
		$(function(){
			$(".easyui-textbox").each(function(i){
				var span = $(this).siblings("span")[0];
				var targetInput = $(span).find("input:first");
				if(targetInput){
				  $(targetInput).attr("placeholder", $(this).attr("placeholder"));
				}
			});
		});
		
		function change(){
			var time = new Date();
			var timestamp = time.getSeconds();
			$("#Verify").attr("src","${pageContext.request.contextPath}/imagecode.html?timestamp="+timestamp);			
		}
		
		

	</script>
	

  </head>
  
  <body>

<div id="header">

	<div class="top">
	
		<div class="top_right">
			<div class="welcome">您好，欢迎来到湖南省统一预约挂号服务平台！&nbsp;&nbsp;&nbsp;&nbsp;</div>
             	
            <div class="fr">	
			    <c:choose>
            <c:when test="${patients eq null }">
            <span id="logheader"> <a href="login.jsp" >登录</a></span>
            |<a href="register.jsp" target="_parent">注册</a> 
            </c:when>
            <c:when test="${patients ne null }"> 
          <span class="gray">用户名：</span> <span class="green">${patients.pname}</span> &nbsp;<span class="gray">
            | <a id="exitSystem" href="patients_zuxiao" >注销</a>  |   </span>  
            </c:when>           
            </c:choose>       		
			 	<div class="bookingorder_div fr" id="userTop">
			 <c:if test="${patients.pname != null }"> 
            <a class="bookingorder_a layout" href="javascript:persons(${patients.pid})">我的预约挂号 <i class="g_icon g_down"></i></a>
            </c:if>        
                </div>	
			</div>
                
			<!--end add advise function module by liqin at 2015-05-08-->
           
		</div>
	</div>
	<div class="big_width clearfix">
		<div class="logo">
			<img src="${pageContext.request.contextPath }/resources/image/logo.png">
		</div>

		<div class="top_bg"></div>
	</div>
	<div id="nav">

		<div class="bg_middle">
			<div class="lanmu">
				<ul class="clearfix">
					<li><a href="index.jsp" target="_parent" class="white1">
							首页 </a></li>

					<li><a href="javascript:persons(${patients.pid})" target="_parent" class="white1">个人中心</a>
					</li>

					<!--<li><a href="payMentManages.action?pattern=1.action" target="_parent"  class="white1">充值卡购买</a></li>-->
				<!-- 	<li><a href="http://www.hnyygh.com/querty.action?pattern=1" target="_parent" class="white1">预约排名</a>
					</li> -->
				</ul>
			</div>
		</div>		
	</div>
</div>

<div class="regis_main clearfix">
		<form id="ff" action="login"  method="post">
			<input type="hidden" name="token" value="126573af-0f0b-4b91-b5fc-9039f882ea02">
			<div class="join_b1">
				<span>用户登录</span>
			</div>
			<div class="join_b2">
				<div class="join_nr">
					<div class="yhm">
						<div class="yhm_left_name">用户名：</div>
						<div class="yhm_left_input">
							<input value="" maxlength="18" size="20" type="text" class="join_in" id="userName" name="temp" >
						</div>
						<div class="yhm_left_prompt">
							<span id="userAliasErrores">
							
								<div class="zhushi" id="userNameErrorDiv">
									<font class="red">*</font> 请输入手机或身份证
								</div>
							</span>
							 <span id="userAliasError" style="color: red; font-size: 14px; font-weight: bold; display: none; width: 100%; height: 100%; position: absolute; left: 0; top: 0; z-index: 1000; background: #fff;"></span>
						</div>
					</div>
					<div class="yhm">
						<div class="yhm_left_name">密  码：</div>
						<div class="yhm_left_input">
							<input id="userPassword" name="pwd" type="password" class="join_in" maxlength="16" size="16">
						</div>
						<div class="yhm_left_prompt">
							<div class="zhushi" id="userPasswordErrorDiv">
								<font class="red">*</font> 请输密码
							</div>
							<span id="userPasswordError" style="color: red; font-size: 12px; font-weight: bold; display: none; width: 100%; height: 100%; position: absolute; left: 0; top: 0; z-index: 1000; background: #fff;"></span>
						</div>
					</div>			 
					<div class="yhm">
						<div class="yhm_left_name">验&nbsp;证&nbsp;码&nbsp;&nbsp;：</div>
						<div class="yhm_left_input">
							<input name="verifyCode" id="code" maxlength="4" size="4" type="text" class="join_yz" > 
							<img  id="Verify" onclick="change()" src="${pageContext.request.contextPath}/imagecode.html"  width="80" height="35"  >
						</div>
						
						
						<div class="yhm_left_prompt">
							<div class="zhushi" id="userCertCodeErrorDiv">
							<a onclick="change()" id="Verify" style="font-size: 15px;">换一张</a>
							</div>
							<span id="userCertCodeError" style="color: red; font-size: 12px; font-weight: bold; display: none; width: 100%; height: 100%; position: absolute; left: 0; top: 0; z-index: 1000; background: #fff;"></span>
						</div>
						<input id="userBd" name="orderwebUserBd" type="hidden">
					</div>

					</div>
					
					<div class="join_zhuce">
					
						<span class="anniu">
						<a id="zhuce" onclick="submitForm()" class="white">登录</a>
					<!-- 	<INPUT id="btnLogin"  type="submit" value="登 录 "> -->
						 </span><span class="anniu"><a  class="white" href="index.jsp">返回</a> </span>
								<span class="anniu"><a id="zhuce" href="register.jsp" class="white">注册新用户</a></span>
								<br><br>
									<span style="font-size: 20px;color: red">${param.message==0?'验证码错误!':param.message==1?'用户名或密码错误!':'' }</span>		
					</div>
	
				
				</div>
			</form></div>
<div id="bottom">
  <div class="bottom">
    <div class="bottom_left">
      <p>湖南省统一预约挂号服务平台</p>
      <p>
        <a href="http://www.hnyygh.com/getArticleList_guide.action?articleId=About_us&amp;channelId=105&amp;contentPath=" target="_parent" style="white-space: nowrap; width: 50px">关于我们</a>
        |
        <a href="http://www.hnyygh.com/getArticleList_guide.action?articleId=Customer_service&amp;channelId=105&amp;contentPath=" target="_parent" style="white-space: nowrap; width: 50px">客户服务</a>
        |
        <a href="http://www.hnyygh.com/getArticleList_guide.action?articleId=461&amp;channelId=105&amp;contentPath=&amp;pattern=1" target="_parent">使用帮助 </a>
        |
        <a href="http://www.hnyygh.com/getArticleList_guide.action?articleId=Contact_us&amp;channelId=105&amp;contentPath=" target="_parent" style="white-space: nowrap; width: 50px">联系我们</a>
      </p>
      <p>技术支持：湖南凯歌医疗信息技术有限公司</p>
      <p>联系电话：<font color="red"><strong>400 9918 580</strong></font> &nbsp;&nbsp;&nbsp;&nbsp; 湘ICP备14005311号-1</p>
    </div>
  </div>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/static/h-ui/js/H-ui.min.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/lib/My97DatePicker/4.8/WdatePicker.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/lib/datatables/1.10.0/jquery.dataTables.min.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/lib/laypage/1.2/laypage.js"></script>
  </body>
</html>
