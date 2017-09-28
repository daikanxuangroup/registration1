<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'alter.jsp' starting page</title>
    
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
  </head>
  
  <body>
  
    
<div id="header">
	<div class="top">
		<div class="top_right">
			<div class="welcome">您好，欢迎来到301医院统一预约挂号服务平台！&nbsp;&nbsp;&nbsp;&nbsp;</div>          	
            <div class="fr"> 
           <c:choose>
            <c:when test="${patients eq null }">
            <span id="logheader"> <a href="login.jsp" >登录</a></span>
            |<a href="register.jsp" target="_parent">注册</a> 
            </c:when>
            <c:when test="${patients != null }"> 
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

				</ul>
			</div>
		</div>
		
	</div>
</div>

	<div class="regis_main clearfix">

		
			<input type="hidden" name="token" value="126573af-0f0b-4b91-b5fc-9039f882ea02">
			<div class="join_b1">
				<span>密码管理</span>
			</div>
			<div class="join_b2">
				<div class="join_nr">
				<div id="ypass1">
					<div class="yhm">
						<div class="yhm_left_name">请输入原密码：</div>
						<div class="yhm_left_input">
				
						<input id="pwd" name="patients.pwd" type="password" class="join_in" maxlength="16" size="16"  onblur="pass(${patients.pid})">
						<span id="userPass" style="color: red; font-size: 12px;  display: none;"></span>					
					
				
			
						</div>					
					</div>
				</div>				
				<div id="ypass2" style="display: none;"> 
					<div class="yhm">
						<div class="yhm_left_name">新密码：</div>
						<div class="yhm_left_input">
							<input id="userPassword" name="userPassword" type="password" class="join_in" maxlength="16" size="16" onblur="checkPassword()">
						</div>
						<div class="yhm_left_prompt">
							<div class="zhushi" id="userPasswordErrorDiv">
								<font class="red">*</font> 请输入6-16位字符，超过16位的按前16位计算
							</div>
							<span id="userPasswordError" style="color: red; font-size: 12px; font-weight: bold; display: none; width: 100%; height: 100%; position: absolute; left: 0; top: 0; z-index: 1000; background: #fff;"></span>
						</div>
					</div>
					<div class="yhm">
						<div class="yhm_left_name">密码确认：</div>
						<div class="yhm_left_input">
							<input id="userPassword1" name="patients.pwd1" type="password" class="join_in" maxlength="16" size="16" onblur="checkPasswordAgain()">
						</div>
						<div class="yhm_left_prompt">
							<div class="zhushi" id="userPassword1ErrorDiv">
								<font class="red">*</font> 请重复输入上面的密码
							</div>
							<span id="userPasswordError1" style="color: red; font-size: 12px; font-weight: bold; display: none; width: 100%; height: 100%; position: absolute; left: 0; top: 0; z-index: 1000; background: #fff;"></span>
						</div>
					</div>	
					<div class="join_zhuce" >
						<span class="anniu"><a  href="javascript:passpwd(${patients.pid})" class="white">提交</a> 
					</div>				
				</div>
			</div>				
			</div>			
			</div>


<div id="bottom">
  <div class="bottom">
    <div class="bottom_left">
      <p>301医院统一预约挂号服务平台</p>
      <p>
        <a href="http://www.hnyygh.com/getArticleList_guide.action?articleId=About_us&amp;channelId=105&amp;contentPath=" target="_parent" style="white-space: nowrap; width: 50px">关于我们</a>
        |
        <a href="http://www.hnyygh.com/getArticleList_guide.action?articleId=Customer_service&amp;channelId=105&amp;contentPath=" target="_parent" style="white-space: nowrap; width: 50px">客户服务</a>
        |
        <a href="http://www.hnyygh.com/getArticleList_guide.action?articleId=461&amp;channelId=105&amp;contentPath=&amp;pattern=1" target="_parent">使用帮助 </a>
        |
        <a href="http://www.hnyygh.com/getArticleList_guide.action?articleId=Contact_us&amp;channelId=105&amp;contentPath=" target="_parent" style="white-space: nowrap; width: 50px">联系我们</a>
      </p>
      <p>技术支持：湖南三零一医疗信息技术有限公司</p>
      <p>联系电话：<font color="red"><strong>400 9918 580</strong></font> &nbsp;&nbsp;&nbsp;&nbsp; 湘ICP备14005311号-1</p>
    </div>
</div>




<script language="javascript" type="text/javascript">

	function hiddenUserErrorInfo(thiz) {
		thiz.value = thiz.value.replace(/\d/, "");
	}

	function registerUser() {
		validateData();
	}

	function enterKeyEvents() {
		// 如果是回车键按下，则进行处理
		if (event.keyCode == 13) {
			validateData();
		}
	}

	function validateData() {
		var reg = /^([A-Za-z\u4E00-\u9FA5]{2,8})+$/;
		var idCard = /^\d{15}|\d{}18$/;
		var phone = /^([0-9]{11})?$/;

		// 取得登录用户名输入框对象
		var loginNameInputBox = $("#userName");

		// 取得密码输入框对象 
		var passwordInputBox = $("#userPassword");

		var passwordInputBox1 = $("#userPassword1");

		var userPhoneInputBox = $("#userPhone");

		var papersNumInputBox = $("#papersNum");
		
		var userEmailInputBox = $("#userEmail");

		var agreement = document.getElementById("agreement");

		var papersNumIsRegister = $("#papersNumIsRegister");

		var userPhoneIsRegister = $("#userPhoneIsRegister");
		
		var userEmailIsRegister = $("#userEmailIsRegister");

		var certCode = $("#certCode");

		var certCode1 = $("#randImage");

		// 如果用户名和密码都有输入，则提交登录信息
		if (loginNameInputBox.val().length == 0
				|| !reg.test(loginNameInputBox.val()))// 没有输入用户名，用户名输入框获取焦点
		{
			$("#userAliasError").html("&nbsp;用户名输入不合法，只能由2到8位字母或者汉字组成");
			document.getElementById('userAliasError').style.display = "";
		} else if (passwordInputBox.val().length == 0
				|| passwordInputBox.val().length < 6)// 没有输入密码，密码输入框获取焦点
		{
			$("#userPasswordError").html("&nbsp;密码输入不合法,至少输入6位");
			document.getElementById('userPasswordError').style.display = "";
		} else if (passwordInputBox1.val().length == 0
				|| passwordInputBox1.val().length < 6)// 没有输入密码，密码输入框获取焦点
		{
			$("#userPasswordError1").html("&nbsp;密码输入不合法,至少输入6位");
			document.getElementById('userPasswordError1').style.display = "";
		} else if (passwordInputBox.val() != passwordInputBox1.val())// 没有输入密码，密码输入框获取焦点
		{
			$("#userPasswordError").html("&nbsp;两次密码不一致");
			document.getElementById('userPasswordError').style.display = "";
		} else if (papersNumInputBox.val().length == 0
				|| !(idCard.test(papersNumInputBox.val()))) // 没有输入密码，密码输入框获取焦点
		{
			$("#papersNumError").html("&nbsp;身份证不合法");
			$('#papersNumError').css("color", "red");
			document.getElementById('papersNumError').style.display = "";
			
		} else if (papersNumIsRegister.val() == "true") {
			$("#papersNumError").html("&nbsp;此身份证己注册");
			$('#papersNumError').css("color", "red");
			document.getElementById('papersNumError').style.display = "";
		} else if (userPhoneInputBox.val().length == 0
				|| !(phone.test(userPhoneInputBox.val())))// 没有输入用户名，用户名输入框获取焦点
		{
			$("#userPhoneError").html("&nbsp;用户手机不合法");
			$('#userPhoneError').css("color", "red");
			document.getElementById('userPhoneError').style.display = "";
		} else if (userPhoneIsRegister.val() == "true") {
			$("#userPhoneError").html("&nbsp;此手机号码己注册");
			$('#userPhoneError').css("color", "red");
			document.getElementById('userPhoneError').style.display = "";
		}else if(userEmailInputBox.val().length>0 && userEmailIsRegister.val() == "true"){
			$("#userEmailError").html("&nbsp;此邮箱己注册");
			document.getElementById('userEmailError').style.display = "";
		} else if (!agreement.checked)// 没有勾选协议
		{
			agreement.focus();
			$('#userAgreeError').html("&nbsp;您尚未阅读注册协议！");
			document.getElementById('userAgreeError').style.display = "";
		}
		/*  else if(certCode.val().toUpperCase()!=certCode1.val()){
		 	$("#userCertCodeError").html("&nbsp;验证码不合法");
		 	document.getElementById('userCertCodeError').style.display="";
		 } */
		else if (loginNameInputBox.val().length > 0
				&& passwordInputBox.val().length > 0
				&& userPhoneInputBox.val().length > 0
				&& papersNumInputBox.val().length > 0
				&& agreement.checked
				&& papersNumIsRegister.val() == "false"
				&& (userPhoneIsRegister.val() == "false")
				&& ($("#papersNumError").val() == null || $("#papersNumError")
						.html().indexOf("可以注册") > -1)
				&& ($("#userEmailError").val() == null
						|| $("#userEmailError").val() == ""
						|| $("#userEmailError").html() == "" || $(
						"#userEmailError").html().indexOf("可以注册") > -1)) {
			cleanErrorData();
			document.getElementById('userPassword').value = encode64(passwordInputBox
					.val());
			document.getElementById('userPassword1').value = encode64(passwordInputBox1
					.val());
			document.getElementById('papersNum1').value = encode64(papersNumInputBox
					.val());
			document.getElementById('userPhone1').value = encode64(userPhoneInputBox
					.val());
			document.getElementById('registerInfo').submit();
			agreement.checked = false;
		}
	}
	function checkPassword() {
		var userPasswordBox = document.getElementById('userPassword').value;
		if (userPasswordBox == "" || userPasswordBox.length < 6) {
			$('#userPasswordErrorDiv').hide();
			$("#userPasswordError").html('&nbsp;密码输入不合法,至少输入6位');
			$("#userPasswordError").show();
			$('#userPasswordError').css("color", "red");

		}
		if (!checkValidInput(userPasswordBox)) {
			$('#userPasswordErrorDiv').hide();
			$("#userPasswordError").html('&nbsp;密码不能包含特殊字符,例如：！@#<)');
			$("#userPasswordError").show();
			$('#userPasswordError').css("color", "red");
			return;
		} else {
			$("#userPasswordError").html('');
			$("#userPasswordError").hide();
		}
		return;
	}
	function checkPasswordAgain() {
		var userPasswordBox = document.getElementById('userPassword').value;
		var userPasswordBox1 = document.getElementById('userPassword1').value;
		if (userPasswordBox != userPasswordBox1) {
			$("#userPasswordError1").html('&nbsp;两次输入的密码不一致');
			$("#userPasswordError1").show();
			$('#userPasswordError1').css("color", "red");
		} else {
			$("#userPasswordError1").html('');
			$("#userPasswordError1").hide();
		}
		return;
	}
</script>
   <!--_footer 作为公共模版分离出去-->
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
