<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    <meta charset="utf-8">
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	<link rel="stylesheet"  href="${pageContext.request.contextPath }/resources/css/nk_login.css">
	<link rel="stylesheet"  href="${pageContext.request.contextPath }/resources/css/style.css">
	
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/easyui/themes/icon.css">
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
    	<div id="showOneNoteDiv" style="display:none">
	<!-- 使用struts2 标签,将会将标签<> 当文本输出! -->		
	</div> 
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/easyui/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/easyui/locale/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/departs.js"></script>
	
  
	

<div id="header">
	<input type="hidden" id="sessionUserName" name="sessionUserName" value="XXX">
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
</div>
<div id="loginbox" style="display: none" class="loginbox">
<a onclick="onclose1();" class="closebtn"></a>
     <div class="login_div_top">
      </div>
      <div class="login_tl">
        使用手机号或身份证或邮箱登录
      </div>
     <div class="login_input">
       <input type="text" style="padding:0 10px;font-size:16px;" placeholder="请输入手机号或邮箱或身份证号" id="loginuserName" name="orderwebUser.userName" class="ys_input">
      <input type="password" placeholder="密码" id="loginuserPassword" name="loginuserPassword" size="16" class="ys_input">
      <div class="login_yzm1">
         <input type="text" style="padding:0 10px;font-size:16px;" placeholder="验证码" name="logincertCode" id="logincertCode" class="ys_yzm ys_input">
         <img class="login_yzm2" id="randImage" align="absmiddle" style="" onclick="javascript:this.src=&#39;verifycode.xujie?id=&#39;+ Math.random();" alt="换一个">
        </div>
      </div>
      <div class="login_btn" >
       <div class="login_btn" onclick="ok()">登录</div>    
      </div>
      <div class="login_zc_wjmm">
        <a href="http://www.hnyygh.com/forwardOrderwebPassword.action" style="color:#396" class="fl">忘记密码&gt;&gt;</a>
        <a href="register.jsp" style="color:#396" class="fr">点击注册&gt;&gt;</a>
        <span class="fr">还没有帐号？</span>
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
     <!--    <div class="zfb_ewm fl"><img style="width:73px; height:71px; margin-top:15px;" src="./湖南省统一预约挂号服务平台_files/login_ewm.jpg" title="扫一扫，关注我，预约挂号，就诊方便！"></div>
       --></div>
   </div>

<!--建议弹窗-->
<div id="advisebox" style="display: none" class="loginbox advisebox">
	<a onclick="onclose2();" class="closebtn">X</a>
	<div class="title">我要提建议</div>
	<ul class="box">
		<li><label><font color="red">*</font>建议描述：</label> <textarea cols="39" rows="6" id="adviseContent" maxlength="490" name="orderwebAdvise.adviseContent" placeholder="尊敬的用户,谢谢您宝贵的建议" style="resize: none;"></textarea>
			<span id="adviseContentError" style="color: red; font-size: 12px; display: none;">建议描述字数范围为0-1000内</span>
		</li>
		<li><label>联系邮箱：</label> <input type="email" class="input_x" id="adviseEmail" name="orderwebAdvise.adviseEmail" size="15" placeholder="请留下联系方式，方便我们及时给您反馈"> <span id="adviseEmailError" style="color: red; font-size: 12px; display: none;">请填写合法有效的邮箱地址</span>
		</li>
		<li><label>联系手机：</label> <input type="text" class="input_x" id="advisePhone" name="orderwebAdvise.advisePhone" maxlength="16" size="15"></li>
		<li><label><font color="red">*</font>验&nbsp;&nbsp;证&nbsp;&nbsp;码：</label>
			<input class="input_x" onfocus="javascrip: document.getElementById(&#39;adviseCodeError&#39;).style.display = &#39;none&#39;" style="width: 100px;" name="adviseCode" id="adviseCode" type="text" maxlength="4" size="4" placeholder="请输入验证码"> <img id="randImage1" align="absmiddle" onclick="javascript:this.src=&#39;verifycode.xujie?id=&#39;+ Math.random();" alt="换一个" height="44"> <span id="adviseCodeError" style="color: red; font-size: 12px; display: none;">请输入验证码</span></li>
		<li><label>&nbsp;</label> <input type="submit" value="提交" class="btn" onclick="submitAdivse()"></li>
	</ul>
</div>
<!--end add advise function module  by liqin at 2015-05-08-->

	<div class="main clearfix">
		<div class="yiyuan_js">

			<div class="yuyue_ny_middle">
				<div class="yuyue_ny_jie">
					<div class="jieshao_tu">
						<img src="${pageContext.request.contextPath }/resources/image/jieshao_tu_湖南省儿童医院.jpg" onerror="this.src=&#39;images/hospital200.jpg&#39;">
					</div>
					<div class="jieshao_zi">
						<p>
							<font> 湖南省人民医院 </font> 
						</p>
						<p>
							<i>医院等级：</i>三级甲等</p>
						<p>
							<i> 联系电话：</i>0731-85600973
							</p><p>
								<i>联系地址：</i>湖南省长沙市梓园路86号
							</p>
							<p>
								<i>医院网址：</i><a href="http://www.hnetyy.net/" target="blank">http://www.hnetyy.net</a>
							</p>
							
							<p>
								<i>交通指南：</i>市内乘101路、11路、116路
							</p>
							<p>
								<i><a href="http://www.hnyygh.com/searchDeptmentAction.action####" onclick="showHosMap(&#39;湖南省儿童医院&#39;)">点击查看地图信息</a></i>
							</p>
					</div>

				</div>
				<div class="xuanze">
					<strong>医院介绍</strong><span class="zhankai"><a href="javascript:show_div()">显示/展开</a> </span>
				</div>
				<div id="starlist">
					<p>
						
							 湖南省人民医院 于八五年五月十五日奠基，历两年建设之艰辛，八七年儿童节开院纳诊。医院居古城长沙闹中取静之红旗区，位梓园路86号，面湘江而眺岳麓名山。集儿童医疗，保健，康复，科研，教学于一身，97年殊荣三级甲等医院，聚世间儿科名医，悬壶三湘儿童少年，医济九州八方儿患，是年病床编制六百，占地八十多五亩，有房屋八百间，建筑面积十二万平方米，规模位国内同业第二。 世纪初年，医院再投巨资欲建湖南儿科之航母，包容儿童医疗，保健，康复，科研。自二00一至二00四年，先后装修门诊大楼，修中心实验室，兴住院大楼13000平方米，改旧住院大楼9000平方米，建两层地下停车场，铺花园广场3个，风格现代，功能齐全，置身其中，童趣盎然。                                                                                                                                                                                                                                                                                                 				
					</p>
					
				</div>

				<div class="xuanze">
					<strong>请选择预约科室</strong>
				</div>
				
					<div class="xuanze_kslb">
								<div class="xuanze_kslb_fl">
							<ul>
							<li style="font-size: 15px;">科室信息</li>
							</ul>
						</div>
						<div class="xuanze_keshi">
							<ul id="dename1">	
						
							</ul>
						</div>
					</div>
				


			</div>
			<div class="yuyue_ny_bottom"></div>
		</div>

	<!-- 	<div class="tuijian">
			<div class="tuijian_top">热门医生推荐</div>
			<div class="tuijian_nr">
				<ul>
					
				</ul>
			</div>
			<div class="tuijian_bottom"></div>
		</div> -->
<!-- 		<div class="wenti">
			<div class="wenti_top">最新公告</div>
			<div class="wenti_nr" style="height: 188px">
				<ul>
					
					
				</ul>
			</div>
			<div class="wenti_bottom"></div>
		</div> -->

 		<div class="wenti" style="display: none;">
			<div class="wenti_top">最近评价</div>
			<div class="wenti_nr" style="height: 188px">
				<ul>
					<marquee id="a" behavior="scroll" onmouseover="a.stop()" onmouseout="a.start()" direction="up" height="180" style="font-size: 10pt; width: 500px; line-height: 160%; height: 180px;" scrollamount="2" font="">  <br>
					</marquee>
				</ul>
			</div>

		</div>

		<div id="submitDiv"></div>
	</div> 
	<div id="hosiptalbox" style="display:none">
<div class="hosiptalbox">
  <a onclick="oncloseNotice();" class="closebtn">X</a>
	  <div class="title"></div>
	  <div style="max-height:450px;overflow-y:scroll"><div class="notice_con"><p id="cmsText"></p></div>
	  </div>
	  <p class="btn">
	  	<button onclick="oncloseNotice();" class="ok">好的，我知道了</button>&nbsp;
	  	
	  </p>
	  </div>
  </div>

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
