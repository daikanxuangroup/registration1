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
    
    <title>My JSP 'register.jsp' starting page</title>
    
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
    <script type="text/javaScript" src="${pageContext.request.contextPath }/resources/js/inputValiad.js"></script>
    <script type="text/javaScript" src="${pageContext.request.contextPath }/resources/js/base64.js"></script> 
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
<!--     <script type="text/javascript" src="js/pop.js"></script> -->
  </head>
  
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

					
					<!-- <li><a href="http://www.hnyygh.com/querty.action?pattern=1" target="_parent" class="white1">预约排名</a>
					</li> -->

				</ul>
			</div>
		</div>
		
	</div>


</div>


<script language="javascript" type="text/javascript">

	function search() {
		//var textfield = document.getElementById('textfield').value;
		//parent.location.reload="search.action?textfield="+textfield;

		document.getElementById('searchParent').submit();

	}
	function noticeInfo(arcticleId, channelId, contentPath) {
		window.parent.window.location.href = "getArticleDetail_notice.action?articleId="
				+ arcticleId
				+ "&channelId="
				+ channelId
				+ "&contentPath="
				+ contentPath;
	}

</script>

<script language="javascript" type="text/javascript">
	function doUserLogin() {
		$("#randImage").attr("src","verifycode.xujie?id='+ Math.random();");
		messageBoxModal({
			content : $("#loginbox"),
			id : 'closeId',
			isCancel : true
		});
	}
	//--start add advise function module by liqin at 2015-05-08---
	function doUserAdvise() {
		$("#randImage1").attr("src","verifycode.xujie?id='+ Math.random();");
		messageBoxModal({
			content : $("#advisebox"),
			id : 'closeId',
			isCancel : true
		});
	}

	function submitAdivse() {
		//文本框获取焦点是将对应的提示信息隐藏
		$("#adviseContent")
				.focus(
						function() {
							document.getElementById("adviseContentError").style.display = "none";
						});
		$("#adviseEmail").focus(function() {
			document.getElementById("adviseEmailError").style.display = "none";
		});
		$("#adviseCode").focus(function() {
			document.getElementById("adviseCodeError").style.display = "none";
		});
		//校验：建议描述不为空，填写的邮箱合法性，校验码
		var flg = true;
		if ($("#adviseContent").val().length <= 0
				|| $("#adviseContent").val().length >= 500) {
			document.getElementById("adviseContentError").style.display = "block";
			flg = false;
		}
		if (verifyAdviseEmail()) {
			document.getElementById("adviseEmailError").style.display = "block";
			flg = false;
		}
		if ($("#adviseCode").val().length <= 0) {
			document.getElementById("adviseCodeError").style.display = "block";
			flg = false;
		}
		if (flg) {
			$.ajax({
				url : "addSave.action",
				type : "POST",
				cache : false,
				data : {
					"orderwebAdvise.adviseContent" : $("#adviseContent").val(),
					"orderwebAdvise.adviseEmail" : $("#adviseEmail").val(),
					"orderwebAdvise.advisePhone" : $("#advisePhone").val(),
					"certCode" : $("#adviseCode").val()
				},
				dateType : "json",
				error : function(data) {
					alert(data);
				},
				success : function(message) {
					if (message != "" && message != null) {

						if (message == 'certCodError') {
							alert("校验码输入错误");
							$("#randImage1").removeAttr('src').attr('src',
									"verifycode.xujie?id=" + Math.random());
						} else if (message == 'success') {
							alert("非常感谢您的宝贵建议，我们将尽快改进，为您提供更好的服务");
							onclose2();
						} else {
							alert(message);
						}
					}

				}
			})
		}

	}

	function checkCertCode() {
		var temp0 = document.getElementById("adviseCode").value.toUpperCase();
		if (temp0.length <= 0) {
			return true;
		}

		return false;
	}
	function verifyAdviseEmail() {
		var temp = document.getElementById("adviseEmail");
		if (temp.value == "") {
			return false;
		}
		//对电子邮件的验证
		var myreg = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
		if (!myreg.test(temp.value)) {
			return true;
		}
		return false;
	}
	function onclose2() {
		messageBoxClose('closeId');
		document.getElementById("adviseContent").value = "";
		document.getElementById("adviseEmail").value = "";
		document.getElementById("advisePhone").value = "";
		document.getElementById("adviseCode").value = "";
		$("#randImage1").removeAttr('src').attr('src',
				"verifycode.xujie?id=" + Math.random());
	}
	//--end add advise function module by liqin at 2015-05-08---

	function onclose1() {
		messageBoxClose('closeId');
		$("#randImage").removeAttr('src').attr('src',
				"verifycode.xujie?id=" + Math.random());
	}
	function onclose3() {
		messageBoxClose('closeId');
		$("#randImage").removeAttr('src').attr('src',
				"verifycode.xujie?id=" + Math.random());
	}
	
	
	function ok() {
		var username = $("#loginuserName").val();
		var password = $("#loginuserPassword").val();
		if (!checkValidInput(username) || !checkValidInput(password) || /^[\u4e00-\u9fa5]+$/.test(username) || /^[\u4e00-\u9fa5]+$/.test(password)) {
			alert("输入的用户名或者密码不合法");
			return;
		}
		userName =  encode64($("#loginuserName").val()); 
		password =  encode64($("#loginuserPassword").val()); 
		$
				.ajax({
					url : "loginAction!loginQuick.action",
					type : "POST",
					async : false,
					data : {
						"orderwebUser.userName" :userName,
						"userPassword" : password,
						"certCode" : $("#logincertCode").val()
					},
					dateType : "json",
					success : function(msg) {
						var errinfo = msg.split("-")[0];
						var username = msg.split("-")[1];
						if (errinfo == "") {
							$("#logheader")
									.html(
											"<span class=\"green\">"
													+ username
													+ " </span> &nbsp;<span class=\"gray\">				│ </span><a href=\"logoutAction.action\" target=\"_parent\">注销</a>");
							$("#sessionUserName").val(username);
							$("#userTop").show();
							onclose1();
						} else {
							alert(errinfo);
							$("#randImage").removeAttr('src').attr('src',
									"verifycode.xujie?id=" + Math.random());
						}
					}
				});
	}
	
</script>

	<div class="regis_main clearfix">

		<form id="ff" action="patients_add" enctype="multipart/form-data" method="post">
			<input type="hidden" name="token" value="126573af-0f0b-4b91-b5fc-9039f882ea02">
			<div class="join_b1">
				<span>实名注册</span>
			</div>
			<div class="join_b2">
				<div class="join_nr">
					<div class="yhm">
						<div class="yhm_left_name">真实姓名：</div>
						<div class="yhm_left_input">
				
							<input value="" maxlength="8" size="20" type="text" class="join_in" id="userName" name="pname" onblur="checkUsername()">
						</div>
						<div class="yhm_left_prompt">
							
								<div class="zhushi" id="userNameErrorDiv">
								<span id="userAliasErrores">
									<font class="red">*</font> 请输入您的真实姓名注册
									</span>
								</div>
							 <span id="userAliasError" style="color: red; font-size: 12px; font-weight: bold; display: none; width: 100%; height: 100%; position: absolute; left: 0; top: 0; z-index: 1000; background: #fff;"></span>
						</div>
					</div>
					<div class="yhm">
						<div class="yhm_left_name">密  码：</div>
						<div class="yhm_left_input">
							<input id="userPassword" name="pwd" type="password" class="join_in" maxlength="16" size="16" onblur="checkPassword()">
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
							<input id="userPassword1" name="pwd1" type="password" class="join_in" maxlength="16" size="16" onblur="checkPasswordAgain()">
						</div>
						<div class="yhm_left_prompt">
							<div class="zhushi" id="userPassword1ErrorDiv">
								<font class="red">*</font> 请重复输入上面的密码
							</div>
							<span id="userPasswordError1" style="color: red; font-size: 12px; font-weight: bold; display: none; width: 100%; height: 100%; position: absolute; left: 0; top: 0; z-index: 1000; background: #fff;"></span>
						</div>
					</div>
					<div class="yhm">
						<div class="yhm_left_name">身份证号：</div>
						<div class="yhm_left_input">
							<input id="papersNum" onblur="validId(this)" name="idcard" maxlength="18" size="18" type="text" class="join_in">
						</div>
						<div class="yhm_left_prompt">
							<div class="zhushi" id="papersNumErrorDiv">
								<font class="red">*</font> 请输入有效证件号码注册
							</div>
							<span id="papersNumError" style="color: red; font-size: 12px; font-weight: bold; display: none; width: 100%; height: 100%; position: absolute; left: 0; top: 0; z-index: 1000; background: #fff;"></span>
						</div>
					</div>
			
					<div class="yhm">
						<div class="yhm_left_name">手机号码：</div>
						<div class="yhm_left_input">
							<input id="userPhone" value=""  name="phone" onblur="regiterManage2() " maxlength="11" size="11" type="text" class="join_in">
		
						</div>
						<div class="yhm_left_prompt">
							<div class="zhushi" id="userPhoneErrorDiv">
								<font class="red">*</font> 请输入真实有效的手机号码注册
							</div>
							<span id="userPhoneError" style="color: red; font-size: 12px; font-weight: bold; display: none; width: 100%; height: 100%; position: absolute; left: 0; top: 0; z-index: 1000; background: #fff;"></span>
						</div>
					</div>
						<div  class="yhm">
						<div class="yhm_left_name">性  别：</div>
						<div class="yhm_left_input">
							<input id="userSex" name="sex" type="radio" value="男" checked="" >男 <input id="userSex" name="patients.sex" type="radio" value="女" >女
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
				</div>
					<div class="join_zhuce">
						<span class="anniu"><a  onclick="submitForm()" class="white">注册</a> </span><span class="anniu">
						<a href="index.jsp" class="white" >返回</a> </span>
								<br><br>
								<span style="color: red;">${mgs}</span>
					</div>
			</form>
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

	function cleanErrorData() {
		$('#userAliasError').html("");
		$('#userPasswordError').html("");
		$('#userPasswordError1').html("");
		$('#userPhoneError').html("");
		$('#papersNumError').html("");
		$('#userAgreeError').html("");
		$('#errorInfoField').html("");
	}

	function hiddenErrorInfos() {
		var errorInfoDiv = document.getElementById('errorInfoField');
		if (null != errorInfoDiv) {
			errorInfoDiv.style.display = 'none';
		}
	}

	var powers = new Array("7", "9", "10", "5", "8", "4", "2", "1", "6", "3",
			"7", "9", "10", "5", "8", "4", "2");
	var parityBit = new Array("1", "0", "X", "9", "8", "7", "6", "5", "4", "3",
			"2");
	var sex = "0";
	//校验身份证号码的主调用    

	function validId(obj) {
		var _id = obj.value;
		if (_id == "")
			return;
		var _valid = false;
		if (_id.length == 15) {
			_valid = validId15(_id);
		} else if (_id.length == 18) {
			_valid = validId18(_id);
		}
		if (!_valid) {
			
			document.getElementById('papersNumError').innerHTML = "&nbsp;身份证不合法";
			document.getElementById('papersNumError').style.display = "";
			$('#papersNumError').css("color", "red");
			//obj.focus();    
			$("#papersNum").focus(function() {
				$("#papersNumError").hide();
				$("#papersNumErrorDiv").show();
		
			});
					
			return;
		}else{
	
			$.ajax({
				url:'patients2_cardyz',
				type: 'POST',
				data:{"idcard":_id},
				success:function(data){
				
					if(data.suc){		
					document.getElementById('papersNumError').innerHTML = "&nbsp;身份证已注册";
					document.getElementById('papersNumError').style.display = "";
				 	$('#papersNumError').css("color", "red"); 
					$("#papersNum").focus(function() {
					$("#papersNumError").hide();
					$("#papersNumErrorDiv").show();	
			});					
					}					
				}		
			});
		
		
		}
				
				
				
				
				
				
		//设置性别    
	/* 	var tmpStr = "";
		var year = "";
		var month = "";
		var day = "";
		var iIdNo = document.getElementById('papersNum').value;

		if (iIdNo.length == 15) {
			var papersNumInputBox = document.getElementById('papersNum');
			papersNumInputBox.focus();
			document.getElementById('papersNumError').innerHTML = "&nbsp;请使用二代身份证";
			document.getElementById('papersNumError').style.display = "";
			$('#papersNumError').css("color", "red");
			//obj.focus();  
			$("#papersNum").focus(function() {
				$("#papersNumError").hide();
				$("#papersNumErrorDiv").show();
			});
			return;

		} else {
			tmpStr = iIdNo.substring(6, 14);
			year = tmpStr.substring(0, 4);
			month = tmpStr.substring(4, 6);
			day = tmpStr.substring(6);

			//document.getElementById('userYear').options[1].value=year;
			$("#userYear").empty();
			document.getElementById("userYear").options.add(new Option(year,
					year));
			//document.getElementById('userYear').options[1].selected = true
			$("#userMonth").empty();
			document.getElementById('userMonth').options.add(new Option(month,
					month));
			//document.getElementById('userMonth').options[1].selected = true
			$("#userDay").empty();
			document.getElementById("userDay").options
					.add(new Option(day, day));
			//document.getElementById('userDay').options[1].selected = true
			tmpStr = year + "-" + month + "-" + day;

			document.getElementById('userBd').value = tmpStr;
			document.getElementById('papersNumError').innerHTML = "";
			document.getElementById('papersNumError').style.display = "";

			regiterManage();
			
		}
	
 */
	}

	function getSexById(value) {
		if (value.length == 15) {
			return parseInt(value.substr(14, 1)) % 2 == 1 ? "0" : "1";
		} else if (value.length == 18) {
			return parseInt(value.substr(16, 1)) % 2 == 1 ? "0" : "1";
		} else {
			return "0";
		}
	}

	//校验18位的身份证号码    

	function validId18(_id) {
		_id = _id + "";
		var _num = _id.substr(0, 17);
		var _parityBit = _id.substr(17);
		var _power = 0;
		for (var i = 0; i < 17; i++) {
			//校验每一位的合法性    

			if (_num.charAt(i) < '0' || _num.charAt(i) > '9') {
				return false;
				break;
			} else {
				//加权    

				_power += parseInt(_num.charAt(i)) * parseInt(powers[i]);
				//设置性别    

				if (i == 16 && parseInt(_num.charAt(i)) % 2 == 0) {
					sex = "female";
				} else {
					sex = "male";
				}
			}
		}
		//取模    
		//add by liqin on 2015-07-21 验证最后一位必须只能是大小写x
		//var endChar = _id.substr(17,18);
		//if(endChar!='X' && endChar!='x'){
		//	return false;    
		//}
		//end add  验证最后一位必须只能是大小写x
		var mod = parseInt(_power) % 11;
		if (parityBit[mod] == _parityBit.toUpperCase()) {
			return true;
		} /* else{
		        	 _id=_id.substring(0, 6)+_id.substring(8, 17);
		        	 return validId15(_id);
		         }*/
		return false;
	}

	function validId15(idCardNo) {
		//15位身份证号码的基本校验
		var check = /^[1-9]\d{7}((0[1-9])|(1[0-2]))((0[1-9])|([1-2][0-9])|(3[0-1]))\d{3}$/
				.test(idCardNo);
		if (!check)
			return false;
		//校验地址码
		var addressCode = idCardNo.substring(0, 6);
		check = checkAddressCode(addressCode);
		if (!check)
			return false;
		var birDayCode = '19' + idCardNo.substring(6, 12);
		//校验日期码
		check = checkBirthDayCode(birDayCode);
		if (!check)
			return false;
		var sexBit = idCardNo.substr(14);
		if (sexBit % 2 == 0) {
			sex = "female";
		} else {
			sex = "male";
		}
		return true;
	}
	/*校验地址码*/
	function checkAddressCode(addressCode) {
		var check = /^[1-9]\d{5}$/.test(addressCode);
		if (!check)
			return false;
		if (provinceAndCitys[parseInt(addressCode.substring(0, 2))]) {
			return true;
		} else {
			return false;
		}
	}

	var provinceAndCitys = {
		11 : "北京",
		12 : "天津",
		13 : "河北",
		14 : "山西",
		15 : "内蒙古",
		21 : "辽宁",
		22 : "吉林",
		23 : "黑龙江",
		31 : "上海",
		32 : "江苏",
		33 : "浙江",
		34 : "安徽",
		35 : "福建",
		36 : "江西",
		37 : "山东",
		41 : "河南",
		42 : "湖北",
		43 : "湖南",
		44 : "广东",
		45 : "广西",
		46 : "海南",
		50 : "重庆",
		51 : "四川",
		52 : "贵州",
		53 : "云南",
		54 : "西藏",
		61 : "陕西",
		62 : "甘肃",
		63 : "青海",
		64 : "宁夏",
		65 : "新疆",
		71 : "台湾",
		81 : "香港",
		82 : "澳门",
		91 : "国外"
	}

	/*校验日期码*/
	function checkBirthDayCode(birDayCode) {
		var check = /^[1-9]\d{3}((0[1-9])|(1[0-2]))((0[1-9])|([1-2][0-9])|(3[0-1]))$/
				.test(birDayCode);
		if (!check)
			return false;
		var yyyy = parseInt(birDayCode.substring(0, 4), 10);
		var mm = parseInt(birDayCode.substring(4, 6), 10);
		var dd = parseInt(birDayCode.substring(6), 10);
		var xdata = new Date(yyyy, mm - 1, dd);
		if (xdata > new Date()) {
			return false;//生日不能大于当前日期
		} else if ((xdata.getFullYear() == yyyy)
				&& (xdata.getMonth() == mm - 1) && (xdata.getDate() == dd)) {
			return true;
		} else {
			return false;
		}
	}

	var httpRequest;
	function createHttpRequest() {
		if (window.XMLHttpRequest) {

			// Non-IE browsers
			httpRequest = new XMLHttpRequest();
		} else {

			if (window.ActiveXObject) {
				// IE
				httpRequest = new ActiveXObject("Microsoft.XMLHTTP");
			}
		}
	}

	function regiterManage() {

		var papersNumBox = document.getElementById('papersNum').value;

		if (httpRequest == null) {
			createHttpRequest();
		}

		httpRequest.onreadystatechange = transRegisterData;
		httpRequest.open("POST",
				'verifyInfo.action?param_name=' + papersNumBox, true);
		httpRequest.send(null);

	}
	function regiterManage2() {
		var userPhoneBox = document.getElementById('userPhone').value;
		if (verifyPhone()) {
	
			$.ajax({
				url:'patients2_phoneyz',
				type: 'POST',
				data:{"phone":userPhoneBox},
				success:function(data){
		
				if(data.suc){	
			
					$("#userPhoneError").html('&nbsp;手机号码已经注册！');
					$("#userPhoneError").show();
					//$("#userPhoneErrorDiv").hide();
					$('#userPhoneError').css("color", "red");
					$("#userPhone").focus(function() {
					$("#userPhoneError").hide();
					$("#userPhoneErrorDiv").show();
				});
				
					}					
				}		
			});	
		/* 	if (httpRequest == null) {
				createHttpRequest();
			}

			httpRequest.onreadystatechange = transRegisterData;
			httpRequest.open("POST", 'verifyInfo.action?param_name='
					+ userPhoneBox, true);
			httpRequest.send(null); */
		}
	}
	function regiterManage3() {
		if (verifyemail()) {
			var userEmailBox = document.getElementById('userEmail').value;

			if (httpRequest == null) {
				createHttpRequest();
			}

			httpRequest.onreadystatechange = transRegisterData;
			httpRequest.open("POST", 'verifyInfo.action?param_name='
					+ userEmailBox, true);
			httpRequest.send(null);
		}
	}

	function checkUsername() {
		var reg0 = /^([A-Za-z\u4E00-\u9FA5]{2,8})+$/;
		var reg = /^\s*$/;
		var userNameBox = document.getElementById('userName').value;
		if (userNameBox == "" || reg.test(userNameBox)) {
			$("#userAliasError").html('&nbsp;用户名不能为空');
			$("#userAliasError").show();
			$('#userAliasError').css("color", "red");
			return;
		}
		if (!reg0.test(userNameBox)) {
			$("#userAliasError").html('&nbsp;用户名格式不正确，只能由2到8位字母或者汉字组成');
			$("#userAliasError").show();
			$('#userAliasError').css("color", "red");
			return;
		}
		if (!checkValidInput(userNameBox)) {
			$("#userAliasError").html('&nbsp;用户名不能包含特殊字符,例如：！@#<)');
			$("#userAliasError").show();
			$('#userAliasError').css("color", "red");
			return;
		}

		else {
			$("#userAliasError").html('');
			$("#userAliasError").hide();
		}
		return;
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

	function verifyPhone() {
		var userPhoneBox = document.getElementById('userPhone').value;
		if (userPhoneBox == "") {
			$("#userPhoneError").hide();
			return;
		}

		var phoneReg = /^[0-9]{11}$/;
		if (!phoneReg.test(userPhoneBox)) {
			$("#userPhoneError").html('&nbsp;请输入有效的手机号码！');
			$("#userPhoneError").show();
			//$("#userPhoneErrorDiv").hide();
			$("#userPhone").focus(function() {
				$("#userPhoneError").hide();
				$("#userPhoneErrorDiv").show();
			});
			$('#userPhoneError').css("color", "red");
			return false;
		}
		return true;
	}

	function checkUserAgree() {
		var userAgreeBox = document.getElementById('agreement');
		if (!userAgreeBox.checked) {
			$('#zhuce').disabled = "disabled";
			$('#zhuce').removeClass('anniu');
			$('#zhuce').addClass('anniu1');
			$('#zhuce').onclick = null;
			return false;
		} else {
			$('#zhuce').removeClass('anniu1');
			$('#zhuce').addClass('anniu');
			$('#zhuce').disabled = "none";
			// document.getElementById('zhuce').onclick=registerUser;
			$('#zhuce').bind('click', function() {
				registerUser()
			});
			return true;
		}
	}

	function checkCertCode() {
		$("#errorInfoField").hide();
		var temp0 = document.getElementById("certCode").value.toUpperCase();
		//var temp1 = document.getElementById("randImage").value;
		if (temp0.length <= 0) {
			$("#userCertCodeError").html('&nbsp;请输入验证码');
			$("#userCertCodeError").show();
			$("#userCertCodeErrorDiv").hide();
			document.getElementById("certCode").value = "";//清空文本框  
			$("#certCode").focus(function() {
				$("#userCertCodeError").hide();
				$("#userCertCodeErrorDiv").show();
			});
			$('#userCertCodeError').css("color", "red");
			return false;
		}else{
			//判断页面验证码是否正确
			$('#certCode').val();
			var check = false;
		      $.ajax({
		    	  url : "verifyCode.action",
					data : "certCode=" + temp0,
					dataType : "text",
					type : "POST",
					async:false,
					success : function(result) {
						var result = jQuery.parseJSON(result);
						if (result.result) {
							$('#userCertCodeError').css("color", "green");
							$("#userCertCodeError").html("&nbsp;恭喜你，验证码正确");
							$("#userCertCodeError").show();
							$("#userCertCodeErrorDiv").hide();
							check = true;	
						} else {
							$('#userCertCodeError').css("color", "red");
							$("#userCertCodeError").html("&nbsp;验证码输入错误!");
							$("#userCertCodeError").show();
							$("#userCertCodeErrorDiv").hide();
							check = false;
						}
		            }
		      });
		 return check;
		}

		return true;
	}

	function verifyemail() {
		var temp = document.getElementById("userEmail");
		if (temp.value == "") {
			$("#userEmailError").hide();
			return;
		}
		//对电子邮件的验证
		var myreg = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
		if (!myreg.test(temp.value)) {
			$("#userEmailError").html('&nbsp;请输入有效的E_mail！');
			$("#userEmailError").show();
			//$("#userEmailErrorDiv").hide();
			$("#userEmail").focus(function() {
				$("#userEmailError").hide();
				$("#userEmailErrorDiv").show();
			});
			$('#userEmailError').css("color", "red");
			return false;
		}
		return true;
	}

	/**
	 * ajax方式验证信息唯一性
	 * @returns
	 */
	function transRegisterData() {
		if (httpRequest.readyState == 4) {
			if (httpRequest.status == 200) {
				var resp = httpRequest.responseText;
				var re = resp.split(",");
				var result = re[0];
				var source = "";
				if (re.length > 1) {
					source = re[1];
				}
				if (result == '3') {
					if (source != "" && source != 'null') {
						$('#papersNumError')
								.html(
										"&nbsp;此身份证己在"
												+ source
												+ "注册，请<a href='logoutAction.action'>登录</a>"
												+ "或者"
												+ "<a href='forwardOrderwebPassword.action'>找回密码</a>"
												+ ",如有疑问请致电4009918580");
					} else {
						$('#papersNumError').html("&nbsp;此身份证己注册");
					}
					$('#papersNumError').css("color", "red");
					$('#papersNumError').show();
					$("#upapersNumError").show();
					$("#papersNum").focus(function() {
						$("#papersNumError").hide();
						$("#papersNumErrorDiv").show();
					});
					$("#papersNumIsRegister").val(true);
					return;
				} else if (result == '2') {
					if (source != "" && source != 'null') {
						$('#userPhoneError').html(
								"&nbsp;此手机号码己在" + source + "注册");
					} else {
						$('#userPhoneError').html("&nbsp;此手机号码己注册");
					}

					$('#userPhoneError').css("color", "red");
					$("#userPhoneError").show();
					//$("#userPhoneErrorDiv").hide();
					$("#userPhone").focus(function() {
						$("#userPhoneError").hide();
						$("#userPhoneErrorDiv").show();
					});
					$("#userPhoneIsRegister").val(true);
					return;
				} else if (result == '1') {
					if (source != "" && source != 'null') {
						$('#userEmailError')
								.html("&nbsp;此邮箱己在" + source + "注册");
					} else {
						$('#userEmailError').html("&nbsp;此邮箱己注册");
					}
					$('#userEmailError').css("color", "red");
					$("#userEmailError").show();
					$("#userEmail").focus(function() {
						$("#userEmailError").hide();
						$("#userEmailErrorDiv").show();
					});
					$("#userEmailIsRegister").val(true);
					return;
				} else if (result == '-1') {
					$('#userEmailError').html("&nbsp;此邮箱可以注册");
					$("#userEmailError").show();
					$('#userEmailError').css("color", "green");
				} else if (result == '-2') {
					$('#userPhoneError').html("&nbsp;此手机号码可以注册");
					$("#userPhoneError").show();
					$('#userPhoneError').css("color", "green");
					$("#userPhoneIsRegister").val(false);
				} else if (result != "") {
					$('#papersNumError').html("&nbsp;此身份证可以注册");
					$("#papersNumError").show();
					$('#papersNumError').css("color", "green");
					$("#papersNumIsRegister").val(false);
				}

			} else {
				alert('与服务器的连接发生异常！');
			}
		}
		//return result;
	}
	
	
	function setImagePreview(filen) {
		//获取对象
		if(filen==0){
			var fileId="file0";
			var imgId="img0";
			var localImag="localImag0"
			var fileInputId="fileInputOne";
			var field="field0";
		}else{
			var fileId="file1";
			var imgId="img1";
			var localImag="localImag1"
			var fileInputId="fileInputTwo";
			var field="field1";
		}
		//获取图片格式
		var aa=document.getElementById(fileId).value.toLowerCase().split('.');
		$("#"+fileInputId).css("display","block");
		var docObj=document.getElementById(fileId);
	    var imgObjPreview=document.getElementById(imgId);
	      //判断浏览器类型 
	      if($("#"+fileId).val()==""){
		    alert('图片不能为空！');
			$("#"+fileId).val("");
	   	  	$("#"+fileInputId).css("opacity","100");
	   	  	$("#"+fileId).css("height","80");
	   	  	$("#"+localImag).css("display","none");
		}else{
		       if(docObj.files &&    docObj.files[0]){
	 				if(aa[aa.length-1]=='jpg'||aa[aa.length-1]=='bmp'
	 		   			||aa[aa.length-1]=='png'||aa[aa.length-1]=='jpeg'){
	 		              var imagSize =  document.getElementById(fileId).files[0].size;
	 				  	  //判断文件大小
	 					  if(imagSize>1024*1024){
	 					    alert("图片不能大于1MB!");
	 						$("#"+fileId).val("");
	 				   	  	$("#"+fileInputId).css("opacity","100");
	 				   	  	$("#"+fileId).css("height","80");
	 				   	  	$("#"+localImag).css("display","none");
	 					  }else{
	 			   		  	  $("#"+localImag).css("display","block");
	 			     		  //火狐下，直接设img属性
	 			              imgObjPreview.style.display = 'block';
	 			              imgObjPreview.style.width = '150px';
	 			              imgObjPreview.style.height = '150px';                    
	 			              //imgObjPreview.src = docObj.files[0].getAsDataURL();
	 					      //火狐7以上版本不能用上面的getAsDataURL()方式获取，需要一下方式  
	 					      imgObjPreview.src = window.URL.createObjectURL(docObj.files[0]);
	 			   		  	  $("#"+fileInputId).css("opacity","0");
	 					  	  $("#"+fileId).css("height","150");
		 					  $("#"+field).css("display","none");
	 					  }
	 			       }else{
	 				        alert('请选择格式为*.jpg、*.bmp、*.png、*.jpeg 的图片');//jpg和jpeg格式是一样的只是系统Windows认jpg，Mac OS认jpeg，
	 				   		$("#"+fileId).val("");
	 				   	  	$("#"+fileInputId).css("opacity","100");
	 				   	  	$("#"+fileId).css("height","80");
	 				   	  	$("#"+localImag).css("display","none");
	 			      }
	 			
	      }else{//ie
	   		if(aa[aa.length-1]=='jpg'||aa[aa.length-1]=='bmp'
	   			||aa[aa.length-1]=='png'||aa[aa.length-1]=='jpeg'){
		            $("#myInformation").ajaxSubmit({
		    			type:"post",
		    	        url:"uploadPhoto.action",
		    	        data:$("#myInformation").serialize(),
		    	        async:false,
		    	        error: function(request) {
		    	        	alert(request);
		    	        	alert("网络异常!!!请刷新页面后重新操作!");
		   	       		}, 
		   	       		success: function(res) {
			   	        	if(res == 1){
			   	        		alert("图片不能大于1MB!");
			        		  	$("#"+fileInputId).css("opacity","100");
			        		  	$("#"+fileId).css("height","80");
				   		   		var file = $("#"+fileId)
				 		   		file.after(file.clone().val(""));
				 		   		file.remove();
			        		  	$("#"+localImag).css("display","none");
			   	            }else{
			        		  	$("#"+localImag).css("display","block");
			   	            	 //IE下，使用滤镜
			                    docObj.select();
			   	            	docObj.blur();//失去焦点事件;
			                    var imgSrc = document.selection.createRange().text;
			                    var localImagId = document.getElementById(localImag);
			                    //必须设置初始大小
			                    localImagId.style.width = "150px";
			                    localImagId.style.height = "150px";
			                    //图片异常的捕捉，防止用户修改后缀来伪造图片
			                    localImagId.style.filter="progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";
			                    localImagId.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = imgSrc;
			                    imgObjPreview.style.display = 'none';
			                    document.selection.empty();
			        		  	$("#"+fileInputId).css("opacity","0");
			        		  	$("#"+fileId).css("height","150");
			   	            }
		   	            }
		   	       });
		   		}else{
		   		    alert('请选择格式为*.jpg、*.bmp、*.png、*.jpeg 的图片');//jpg和jpeg格式是一样的只是系统Windows认jpg，Mac OS认jpeg，
		   		  	$("#"+fileInputId).css("opacity","100");
		   		  	$("#"+fileId).css("height","80");
			   		 var file = $("#"+fileId)
			   		file.after(file.clone().val(""));
			   		file.remove();
		   		  	$("#"+localImag).css("display","none");
		   		    return false;
		   	    }
	      }//判断浏览器
		}

	}
	function pic_open_upload0() {
		document.getElementById("file0").click();
	}
	function pic_open_upload1() {
		document.getElementById("file1").click();
	}
</script>
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
