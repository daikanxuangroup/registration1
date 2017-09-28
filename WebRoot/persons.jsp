<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'Personal .jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css" type="text/css">
	<script type="text/javaScript" src="${pageContext.request.contextPath }/resources/js/jquery-1.11.1.js"></script>
	<script type="${pageContext.request.contextPath }/resources/js/index.js"></script>
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
    	<div>
		<div id="DivLocker"></div>
		<div id="loadImg" style="display: none; z-index: 999; text-align: center; border: 3 solid blue; position: absolute; top: expression(($(   &#39;#DivLocker&#39;) . height() -this.offsetHeight)/2); left: expression(($(   &#39;#DivLocker&#39;) . width() -this.offsetWidth)/2);">
			<img src="./湖南省统一预约挂号服务平台_3_files/ajax-loader_white.gif" alt="正在提交,请稍候..."><br>
			<span style="color: #FFFFFF; font-size: 14px;"><b>正在提交,请稍候...</b>
			</span>
		</div>
	</div>
	



<script type="text/javaScript" src="${pageContext.request.contextPath }/resources/js/inputValiad.js.下载"></script>
<script type="text/javaScript" src="${pageContext.request.contextPath }/resources/js/base64.js.下载"></script> 

<link href="${pageContext.request.contextPath }/resources/css/nk_login.css" rel="stylesheet" type="text/css">
<!-- 设置session超时时间10分钟 -->


<script type="text/javaScript">
	function nofindLogo() {
		var img = event.srcElement;
		img.src = "images/logo/logo.jpg";
		img.onerror = null;
	}
	function nofindHeader_bg() {
		var img = event.srcElement;
		img.src = "images/header_bg/header_bg.png";
		img.onerror = null;
	}

	function searchCls(cls, flag) {
		if (flag) {
			$(cls).val('');
		} else {
			if ($(cls).val() == null || $(cls).val().length < 1) {
				$(cls).val('请输入医院名称、科室、专家姓名');
			}
		}
	}

	$(function() {
		$('#searchParent').bind(
				'submit',
				function() {
					if ($("#textfields").val().length > 0
							&& $("#textfields").val() != '请输入医院名称、科室、专家姓名') {
						return true;
					} else {
						window.alert("搜索内容不能为空!");
						return false;
					}
				});
		//回车登陆
		$("#loginbox").keypress(function(e) {
			// 回车键事件  
			if (e.which == 13) {
				ok();
			}
		});
	
		$('#userTop').hover(function() {
		 	$(this).addClass('bookingorder_div_on');
		 }, function() {
		 	$(this).removeClass('bookingorder_div_on');
		 });
		 })
</script>
<script type="text/javascript" src="js/departs.js"></script>
<div id="header">
	<input type="hidden" id="sessionUserName" name="sessionUserName" value="">
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
			<img src="${pageContext.request.contextPath }/resources/image/logo.jpg">
		</div>

		<div class="top_bg"></div>
	</div>
	<div id="nav">

		<div class="bg_middle">
			<div class="lanmu">
				<ul class="clearfix">
					<li><a href="index.jsp" target="_parent" class="white1">
							首页 </a></li>

					<li><a href="javascript:persons(${patients.pid})" target="_parent" class="white1">预约信息</a>
				<!-- 	<li><a href="Medical.jsp" target="_parent" class="white1">绑定医疗卡</a> -->
					</li>
					<li><a href="alter.jsp" target="_parent"  class="white1">密码管理</a></li>
					<!--<li><a href="payMentManages.action?pattern=1.action" target="_parent"  class="white1">充值卡购买</a></li>-->
					<!-- <li><a href="http://www.hnyygh.com/querty.action?pattern=1" target="_parent" class="white1">预约排名</a>
					</li> -->
				
					<!-- <li>
						<a href="healthManageAction.action" target="_parent"
						class="white1">我的健康历程</a>
					</li>  -->
				</ul>

			</div>
		</div>
		
	</div>


</div>
<div id="loginbox" style="display: none" class="loginbox">
<a onclick="onclose1();" class="closebtn">X</a>
     <div class="login_div_top">
      </div>
      <div class="login_tl">
        使用手机号或身份证登录
      </div>
     <div class="login_input">
       <input type="text" style="padding:0 10px;font-size:16px;" placeholder="请输入手机号或身份证号" id="loginuserName" name="orderwebUser.userName" class="ys_input">
      <input type="password" placeholder="密码" id="loginuserPassword" name="loginuserPassword" size="16" class="ys_input">
      <div class="login_yzm1">
         <input type="text" style="padding:0 10px;font-size:16px;" placeholder="验证码" name="logincertCode" id="logincertCode" class="ys_yzm ys_input">
         <img class="login_yzm2" id="randImage" align="absmiddle" style="" onclick="javascript:this.src=&#39;verifycode.xujie?id=&#39;+ Math.random();" alt="换一个">
        </div>
      </div>
      <div class="login_btn" onclick="ok()">登录</div>
      <div class="login_zc_wjmm">
        <a href="http://www.hnyygh.com/forwardOrderwebPassword.action" style="color:#396" class="fl">忘记密码&gt;&gt;</a>
        <a href="http://www.hnyygh.com/forwardRegisterAction.action" style="color:#396" class="fr">点击注册&gt;&gt;</a>
        <span class="fr">还没有帐号？</span>
      </div>
      <div class="login_tl">
		        使用第三方帐号登录
      </div>
      <div class="login_3fdl">
        <a href="javascript:void(0)" onclick="interfaceLogin(&#39;qq&#39;,&#39;2&#39;)" class="login_qq fl">&nbsp;</a>
        <!-- <a href="###" class="login_wx fl">&nbsp;</a> -->
      </div>
      <div class="login_line cl"></div>
      <div class="login_zfb">
        <div class="zfb_logo fl"></div>
        <div class="zfb_font fl">
          &nbsp;&nbsp;&nbsp;支付宝扫一扫关注马上挂号！
        </div>
        <div class="zfb_ewm fl"><img style="width:73px; height:71px; margin-top:15px;" src="./湖南省统一预约挂号服务平台_3_files/login_ewm.jpg" title="扫一扫，关注我，预约挂号，就诊方便！"></div>
      </div>
   </div>


<!--QQ弹窗-->
<div id="loginQQbox" style="display: none">
	 <a onclick="onclose3();" class="closebtn">X</a> 
	<iframe style="width:510px;height:600px;" id="interfaceIframe" frameborder="no" border="0" marginwidth="0" marginheight="0" scrolling="no" src="./湖南省统一预约挂号服务平台_3_files/saved_resource.html">
	</iframe>
<!-- <a onclick="onclose3();" class="closebtn2" >取消</a> --> 
</div>


<!--start add advise function module by liqin at 2015-05-08-->
<!--建议弹窗-->

<!--end add advise function module  by liqin at 2015-05-08-->


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
	//第三方接口登录
	function doInterfaceLogin() {
		messageBoxModal({
			content : $("#loginQQbox"),
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
	
	
	//点击类型,登录页面 = 1 弹窗登录 = 2
	function interfaceLogin(type,clickType){
	 	 $.ajax({
			url : "interfaceLogin.action?loginType="+type,
			type : "POST",
			async : false,
			dateType : "json",
			success : function(msg) {
				if(clickType==1){
					window.location.href = msg;
				}else if(clickType==2){
					onclose1();
					doInterfaceLogin();
					$("#interfaceIframe").attr("src",msg);
				}
			}
		});  
				//window.location.href = 'registerBind.jsp';
	}
</script>


	<form id="orderPayInfo" action="http://www.hnyygh.com/orderPayInfo.action" method="post">
		<input type="hidden" name="token" value="7b349644-83d4-4959-b6ab-325920a4571c">
		<div class="main clearfix">
			<div class="yuyue_ny_top"></div>	
		
			
		
			<div class="yuyue_ny_middle">
			<c:if test="${msg == 1}"> 
			<c:forEach items="${list}" var="reg">		
				<div class="xuanze" style="font-size: 18px;">			
					<strong >您的预约信息&nbsp;&nbsp;&nbsp;预约日期:<fmt:formatDate value="${reg.bookable.bdate}" type="date" pattern="yyyy-MM-dd"/> &nbsp;
					${reg.bookable.starttime eq 1?'下午':'上午'}
					&nbsp;  <span style="color: red;">  ${reg.state eq 1?'未取号':'已完成'}</span></strong>
				</div>
				&nbsp; &nbsp; &nbsp;
				<div class="confirm_tian" style="font-size: 14px">
					您预约的医生：<a href="" class="green1"><span>湖南省人民医院 </span> </a> 
					<a href="#" class="green1"><span> ${reg.bookable.doctors.departs.dename} </span> </a>
					 <font class="red"><b>${reg.bookable.doctors.doname} (${reg.bookable.doctors.title})</b> </font>
					  <br>诊金及挂号费：<font class="red"><b>${reg.bookable.doctors.bcost}元 </b> </font> 
					  <font class="hui">诊疗费用以医院现场收取为准！</font>
					<!--   <br>预约就诊时间：<font class="red"><b>2017-08-21 14:30-15:00&nbsp; 下午 -->
					</b> <!-- 2017-08-21 14:30-15:00  --> </font>
				</div>							
				<div class="confirm_tian"></div>	
				</c:forEach>
			 	</c:if>	 
				<c:if test="${msg eq 0}">
				<span style="font-size: 24px; color: red;" > 您还没有预约任何医生  </span>
				</c:if>		
			</div>
			
			
			<div class="yuyue_ny_right">
				<div style="font-size: 14px; color: red; font-weight: bolder">	
		 医院温馨提示：
						<li>预约时，须填报就诊患者本人的真实姓名和身份证号（新生儿如无身份证则填写父母一方的身份证），请务必确保信息内容的真实性，如发现有误按废号处理。</li>
						<li>可预约次天起一个星期内的诊号，每个人当天每个科室只能预约一个号。 </li>
						<li>请按预约时间提前到医院门诊大厅任意挂号收费窗口或5号6号自助机取号候诊，上午9点之前取号，下午15点之前取号，夜间门诊晚上7:30之前取号,过时预约无效。</li> 
						<li>系统采用实名制挂号，如出现两次挂号未到现场取号，系统默认取消其以后预约资格。</li>
		
		</div>
			</div>
			
		</div>


<!-- 		<div class="wenti" style="display: none;">
			<div class="wenti_top">常见问题</div>
			<div class="wenti_nr">
				<ul>
					
				</ul>
			</div>
			<div class="wenti_bottom"></div>
		</div>
 -->


		



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
   <!-- <div class="bottom_right">
      <ul>
         <Li>
          <p>
            <img src="images/bookingShared.png" alt="扫一扫，关注我们" width="55px" />
          </P>
          <p>安卓手机客户端</p>
        </Li> -->
       <!--  <Li style="margin-right: 0;">
          <p>
            <img src="images/booking2.jpg" alt="扫一扫，关注我们" />
          </P>
          <p>微信预约挂号</p>
        </Li>
        <div style="clear: both;"></div> 
      </ul>
    </div>
    -->
  </div>
</div>

	</form>
	<!-- 诊疗卡验证结果 -->
	<input type="hidden" id="flag" name="flag" value="0">
	<!-- 验证码验证结果 -->
	<input type="hidden" id="verifyResult" value="0">
	<!-- 防止重复验证诊疗卡 -->
	<input type="hidden" id="checkCardFlag" name="checkCardFlag" value="1">

	
	<!--湘雅提交弹窗-->
	<div id="hosiptalboxXY" style="display: none">
		<div class="hosiptalbox">
			<a onclick="oncloseXY();" class="closebtn">X</a>
			<div class="notice_con">
				<p id="cmsText"></p>
				<div style="font-size: 16px; color: red; font-weight: bolder">
					中南大学湘雅医院预约须知：
					<li>按中南大学湘雅医院规定，严格执行实名制预约，
					用户必须上传本人真实身份证原件至预约平台进行审核，
					请尽快到平台“个人中心-基本信息”中上传身份证照片，未上传或审核不通过的用户将不允许预约。</li>
				</div>
				<p class="btn">
					<button onclick="oncloseXY();" class="ok">好的，我知道了</button>
				</p>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
		function showCmsList() {
			messageBoxModal({
				content : $("#hosiptalbox"),
				id : 'closeId2',
				isCancel : true
			});

		}
		function showCmsListXY() {
			messageBoxModal({
				content : $("#hosiptalboxXY"),
				id : 'closeIdXY',
				isCancel : true
			});

		}
		
		function onclose2() {
			messageBoxClose('closeId2');
		}
		
		function oncloseXY() {
			messageBoxClose('closeIdXY');
		}
		
		//ajax验证验证码
		function verifyCode(verifycode) {
			//请求之前设置为0
			if (verifycode != null && verifycode.length > 0) {
				$("input[type='hidden'][id='verifyResult']").val("1");
			} else {
				$("input[type='hidden'][id='verifyResult']").val("0");
			}
			/* $
					.ajax({
						url : "verifyCode.action",
						data : "certCode=" + verifycode,
						dataType : "text",
						type : "POST",
						success : function(result) {
							var result = jQuery.parseJSON(result);
							if (result.result) {
								$("input[type='hidden'][id='verifyResult']")
										.val("1");
								$(".yhm_left span").css("color", "green");
							} else {
								$("input[type='hidden'][id='verifyResult']")
										.val("0");
								$(".yhm_left span").css("color", "red");
							}
							var temp=true;
							//判断是否选择了诊疗卡
							if($("input[type='radio'][name='payType']:checked").val()=="2"){
							temp=($("input[type='hidden'][id='flag']")
											.val() == "1");
							}

							if ($("input[type='hidden'][id='verifyResult']")
									.val() == "1"
									&& temp) {
								$("#tijiaoImage img").attr("src",
										"images/tijiao.jpg");
							} else {
								$("#tijiaoImage img").attr("src",
										"images/tijiao_hui.jpg");
							}
							$(".yhm_left span").html(result.errorInfo);

						}
					}); */
		}

		function verifyMediCardid(paymode) {
			//先验证上次提交是否返回，没有返回直接退出
			if ($("input[type='hidden'][name='checkCardFlag']").val() != '1') {
				return;
			}
			$("input[type='hidden'][id='flag']").val("0");
			var userName = $("input[name='orderMemberId']:checked").attr("id");
			var userCard = $("input[name='orderMemberId']:checked").attr(
					"userCard");
			var userPhone = $("input[name='orderMemberId']:checked").attr(
					"userPhone");

			var cardId = $("#ccdd").val();

			if (cardId == null || cardId == "" || paymode.indexOf("1") == -1) {
				return;
			}

			var params = "orderwebUser.userName=" + userName
					+ "&orderwebOrder.mediCardid=" + cardId
					+ "&orderwebOrder.platformHosid="
					+ $("input[type='hidden'][name='platformHosId']").val()
					+ "&orderwebUser.papersNum=" + userCard
					+ "&orderwebUser.UserPhone=" + userPhone;
			//添加异常情况下获取焦点清空文本框的事件
			$("#ccdd")
					.focus(
							function() {
								var value = $("#ccdd").val();
								if (value != null
										&& value != ""
										&& $("#errorMediCardid").css("color") == "red") {
									$("#ccdd").val("");
									$("#errorMediCardid").html("");
								}
							});
			$("#errorMediCardid").css("color", "gray");
			$("#errorMediCardid")
					.html(
							"<span>正在验证您的诊疗卡...<img src='images/ajax-loader-xiao.gif'/></span>");
			//Ajax验证诊疗卡
			//请求之前设置为0
			$("input[type='hidden'][name='checkCardFlag']").val("0");

			$.ajax({
				url : "checkUserMedCard.action",
				data : params,
				dataType : "text",
				type : "POST",
				success : function(msg) {
					//返回后立即置回
					$("input[type='hidden'][name='checkCardFlag']").val("1");
					var result = jQuery.parseJSON(msg);
					$("#errorMediCardid").html();
					if (!result.result) {
						$("#errorMediCardid").html(" * 验证失败：" + result.errorMsg);
						$("#errorMediCardid").css("color", "red");
						//设置不可提交
						$("input[type='hidden'][name='flag']").val("0")
					} else {
						if(result.balance != "")
						{
							var cost = $("input[type='hidden'][name='visitCost']").val();
							if(parseInt(result.balance) < parseInt(cost))
							{
								$("#errorMediCardid").html(" * 卡上余额不足。（" + result.balance+"）");
								$("#errorMediCardid").css("color", "red");
								//设置不可提交
								$("input[type='hidden'][name='flag']").val("0")
							}
							else
							{
								$("#errorMediCardid").html(" 可以使用,挂号费将从卡上自动扣除.当前余额："+result.balance+"元.");
								$("#errorMediCardid").css("color", "green");
								//设置可提交
								$("input[type='hidden'][name='flag']").val("1");
								$("input[type='hidden'][name='patientId']").val(
										result.patientId);
								$("input[type='hidden'][name='staff']").val(
										result.staff);
							}
						}
						else
						{
							$("#errorMediCardid").html("  可以使用");
							$("#errorMediCardid").css("color", "green");
							//设置可提交
							$("input[type='hidden'][name='flag']").val("1");
							$("input[type='hidden'][name='patientId']").val(
									result.patientId);
							$("input[type='hidden'][name='staff']").val(
									result.staff);
						}
					}

					if ($("input[type='hidden'][id='flag']").val() == "1") {
						$("#tijiaoImage img").attr("src", "images/tijiao.jpg");
					} else {
						if ($("input[type='hidden'][name='payType']:checked")
								.val() == '2') {
							$("#tijiaoImage img").attr("src",
									"images/tijiao_hui.jpg");
						}
					}
				}
			});

		}
		
		

		function mediCardHide() {
			$('#mediCardName')[0].selectedIndex = -1;
			$('#mediCardidType').hide();
			$('#residentCardidType').hide();
			//document.getElementById('payModeType').value = "3";
			$("input[type='hidden'][name='val']").val("3");
			//$("#tijiaoImage").bind("click",orderPay);
			$("#ccdd").val("");
			$("#errorMediCardid").html("");
			$("#tijiaoImage img").attr("src", "images/tijiao.jpg");
		}

		function mediCardShow() {
			$('#mediCardidType').show();
			$('#mediCardidType').show();
			$("input[type='hidden'][name='val']").val("2");
			$("#tijiaoImage img").attr("src", "images/tijiao_hui.jpg");
			var paymode = $("input[type='hidden'][name='ordermode']").val();
			if (paymode.indexOf("1") > -1) {
				$("input[type='radio'][name='payType'][value='2']").attr(
						"checked", "true");
				$("#mediCardidType").show();
			}
		}
		/* 
		 function residentCardShow() {
		 document.getElementById('mediCardidType').style.display = "none";
		 document.getElementById('residentCardidType').style.display = "";
		 document.getElementById('payModeType').value = "4";
		 } */
		//湘雅弹窗验证
		 function ajaxshowCmsforXY(){
				var parms="orderMemberId="+$("input[name='orderMemberId']:checked").val()
				+"&orderwebUser.UserId="+$("input[type='hidden'][name='orderwebUser.UserId']").val();
				$.ajax({
					url : "ajaxshowCmsforXY.action",
					data :parms,
					type : "POST",
					dateType : "text",
					success : function(message) {
						if (message==3) {
							orderPay();
						}else{
							showCmsListXY();
						}
					},
					error:function(XMLHttpRequest, textStatus, errorThrown){
						alert("系统异常，请稍后再试");
					}
				})
			}
		 
		function toOrderPay(){
			if($("input[type='hidden'][name='platformHosId']").val()==14){
				ajaxshowCmsforXY();
			}else{
				orderPay();
			}
		 } 
		function orderPay() {
			verifyCode($("#certCode").val());
			var paymode = $("input[type='radio'][name='payMode']:checked")
					.val();
			//预约类型
			var payType = $("input[type='radio'][name='payType']:checked")
					.val();

			var flag = false;
			
			switch (payType) {
			//第三方
			case '1':
				break;
			//诊疗卡
			case '2':
				//为1时验证通过
				if ($("#ccdd").val() == '') {
					//没有输入验证码
					$("#errorMediCardid").css("color", "red");
					$("#errorMediCardid").html("&emsp;*&emsp;请输入诊疗卡号");
					break;
				}
				else
				{
					if ($("input[type='hidden'][name='flag']").val() == '1'
						&& $("input[type='hidden'][id='verifyResult']").val() == "1") {
					   //输入了并且验证通过
					   flag = true;
					   break;
				    }
					else
					{
						//输入了但是没有触发验证
						$("#errorMediCardid").css("color", "red");
						$("#errorMediCardid").html("&emsp;*&emsp;请输入诊疗卡号");
						break;
					}
				}
				break;
			//窗口
			case '3':
				if ($("input[type='hidden'][id='verifyResult']").val() == "1") {
					flag = true;
				}
				break;
			//健康卡
			case 4:
				break;
			}
			if (flag) {
				$('#orderPayInfo').submit();
				$("#loadImg").show();
				$("#loadImg")
						.css(
								{
									"top" : ($(document.body).outerHeight(true) - $(
											"#loadImg").height()) / 2,
									"left" : ($(window).width() - $("#loadImg")
											.width()) / 2
								});
				$('#DivLocker').css({
					"position" : "absolute",
					"margin-left" : "1px",
					"margin-top" : "1px",
					"background-color" : "#000000",
					"height" : function() {
						return $(document.body).outerHeight(true) + 50;
					},
					"filter" : "alpha(opacity=30)",
					"opacity" : "0.3",
					"overflow" : "hidden",
					"width" : function() {
						return $(window).width();
					},
					"z-index" : "998",
					"top" : "0px",
					"left" : "0px"
				});
			}
		}
		//判断窗口支付是否不支持且支持诊疗卡支付
		$(function($) {
			if ($("input[type='hidden'][name='platformDoctId']").val() == "MZWRG02"
					|| $("input[type='hidden'][name='platformDoctId']").val() == "MZWRG01") {
				showCmsList();
			}
			var paymode = $("input[type='hidden'][name='ordermode']").val();
			if (paymode.indexOf("1") > -1) {
				mediCardShow();
			} else if (paymode.indexOf("2") > -1) {
				mediCardHide();
			}
			$.getScript("http://pv.sohu.com/cityjson?ie=utf-8", function() {
				//{"cip": "58.20.51.229", "cid": "430100", "cname": "湖南省长沙市"}
				$("#ipAddress").attr("value", returnCitySN.cip);
				$("#ipRegional").attr("value", returnCitySN.cname);
			});
			$(":radio[name='payModeType']").on("click", function() {
				if ($('input[name="payModeType"]:checked').val() == 1) {
					$('.confirm_tian_dsf').slideDown('slow');
				} else {
					$('.confirm_tian_dsf').slideUp('slow')
				}
			});
			if ($('input[name="payModeType"]:checked').val() == 1) {
				$('.confirm_tian_dsf').slideDown('slow');
			} else {
				$('.confirm_tian_dsf').slideUp('slow')
			}
		})

		function changeMedicard(paymode) {
			$("#errorMediCardid").html("");
			var strs = $("input[name='orderMemberId']:checked").attr("mediCard");
			var str = strs.split("|");
			var releaseObjectSelect = document.getElementById("mediCardName");
			releaseObjectSelect.options.length = 0;
			if (null != str && str.length > 0) {
				for (var i = 0; i < str.length; i++) {
					releaseObjectSelect.options.add(new Option(str[i],1));
					$("#ccdd").val("");
					 $('#mediCardName')[0].selectedIndex = -1;
				}
			}
			verifyMediCardid(paymode);
		}

		function changeMedicard2(paymode,val) {
			$("#errorMediCardid").html("");
			$("#ccdd").val(val);
			$('#mediCardName')[0].selectedIndex = -1;
			verifyMediCardid(paymode);				
		}
		
		 window.onload=function(){			 
			 changeMedicard(paymode);
			 $('#mediCardName')[0].selectedIndex=0;
			 var val=$("#mediCardName").find("option:selected").text(); 
			 $("#ccdd").val(val);


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
