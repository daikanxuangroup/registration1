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
    
    <title>My JSP 'time2.jsp' starting page</title>
    
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
    
    
    
    
    <script type="text/javascript">
    
    		function mediCardHide() {
	/* 		$('#mediCardName')[0].selectedIndex = -1; */
			$('#mediCardidType').hide();
			$('#residentCardidType').hide();
			//document.getElementById('payModeType').value = "3";
			$("input[type='hidden'][name='val']").val("1");
			//$("#tijiaoImage").bind("click",orderPay);
	/* 		$("#ccdd").val(""); */
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
		 
		
		
	
		function verifyMediCardid(idcard){
		
			var cid=$("#ccdd").val();			
			$.ajax({
			
				url:'tempcards',
				type: 'POST',
				data:{"cid":cid,"idcard":idcard},
				success:function(data){
				if(data=="meiyou"){				
				document.getElementById('errorMediCardid').innerHTML = "您输入的诊疗卡不存在";
				}else if(data==""){
				document.getElementById('errorMediCardid').innerHTML = "您输入的身份证不匹配";
				}else{
					document.getElementById('errorMediCardid').innerHTML = "";
				}
				
				
				
			 
				}	
			});
			
				
		}
function tijiao(bid,pid,email,name,dename,bcost,date){
	
	layer.confirm('您确认好了吗？',function(index){
		var cid=$("#ccdd").val();	
		var temp=document.getElementsByName("payType");

 		for(var i=0;i<temp.length;i++){
		 if(temp[i].checked){
		 var payType=temp[i].value; 
		var payType=i+1;
		 break;
		 
		 }
		
		}
		if( payType==2){
		 medcard = cid;
		}else{
		var	medcard="";
		}
		
	$.ajax({		
			url:'doctorsBus',
			type: 'POST',
			data:{"pid":pid,"bid":bid,"medcard":medcard,"email":email,"name":name,"dename":dename,"bcost":bcost,"date":date},
			success:function(data){
			if(data=="true"){
			
			layer.msg('预约成功请到个人中心查看!',{icon:1,time:1000});
				setTimeout(function () {
				window.location.href="index.jsp";
				
				},1200);
				
				}		
			}
		}); 
		layer.close(index);	
	});	
	/* 
	if(confirm("你确认好了吗")){
		var cid=$("#ccdd").val();	
		var temp=document.getElementsByName("payType");

 		for(var i=0;i<temp.length;i++){
		 if(temp[i].checked){
		 var payType=temp[i].value; 
		var payType=i+1;
		 break;
		 
		 }
		
		 }
		if( payType==2){
		 medcard = cid;
		}else{
		var	medcard="";
		}
		
	$.ajax({		
			url:'doctorsBus',
			type: 'POST',
			data:{"pid":pid,"bid":bid,"medcard":medcard},
			success:function(data){
			if(data=="true"){
				alert("预约成功请到个人中心查看");
			}
			
			}
		});  
	}*/
}
    
    
    </script>
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
	

<!-- 设置session超时时间10分钟 -->


<div id="header">
	<input type="hidden" id="sessionUserName" name="sessionUserName" value="戴侃萱">
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
            <span class="green">${patients.pname}</span> &nbsp;<span class="gray">
            │ </span><a href="patients_zuxiao" >注销</a>  |     
            </c:when>                       
            </c:choose>   
					</div>
                
			<!--end add advise function module by liqin at 2015-05-08-->
           
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

					<li><a href="javascript:persons(${patients.pid})" target="_parent" class="white1">个人中心</a>
					</li>
				</ul>
			</div>
		</div>
		
	</div>


</div>


	<form id="orderPayInfo" action="http://www.hnyygh.com/orderPayInfo.action" method="post">
		<input type="hidden" name="token" value="7b349644-83d4-4959-b6ab-325920a4571c">
		<div class="main clearfix">
			<div class="yuyue_ny_top"></div>
			<div class="yuyue_ny_middle">
				<div class="xuanze" style="font-size: 18px;">
					<strong>您的预约信息</strong>
				</div>
				&nbsp; &nbsp; &nbsp;
				<div class="confirm_tian" style="font-size: 14px">
					预约就诊时间: &nbsp;<font class="red"><fmt:formatDate value="${bookable.bdate}" type="date" pattern="yyyy-MM-dd"/>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  取号时间: ${bookable.starttime eq 1 ?'13:00-15:00':'9:00-11:00'}   </font><br>
					湖南人民医院: &nbsp;(<span style="color: red;">${bookable.doctors.departs.dename}</span>)<br>
					您预约的医生: &nbsp;${bookable.doctors.doname}(<span style="color: red;">${bookable.doctors.title}</span>)<br>
					诊金及挂号费: &nbsp;<font class="red">${bookable.doctors.bcost}元</font> <font class="hui"> 诊疗费用以医院现场收取为准！</font><br>
				</div>				
				<div class="xuanze">
					<strong>预约人</strong>
				</div>
				<div class="confirm_tian">
					
				姓名：${patients.pname} &nbsp;&nbsp;&nbsp;&nbsp;
						性别：${patients.sex }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						联系电话：${patients.phone }
										
				</div>


				<div class="xuanze">
					<strong>选择预约方式：</strong>
				</div>

				<div class="confirm_tian">
					<ul>
						<li>
								<input type="radio" checked="checked" name="payType" id="payType" onclick="mediCardHide()" value="1">无卡预约&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							 
								<input type="radio" name="payType" id="payType" onclick="mediCardShow()" value="2" checked="checked">有卡预约&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							</li>
						<li>
							<div id="mediCardidType" style="display: block;">
								<div class="DiagnosisCard">
									<label> 请填写诊疗卡：</label>
									<input name="orderwebOrder.mediCardid" id="ccdd" type="text" value="${patients.by1}" onblur="verifyMediCardid('${patients.idcard}')">
							
									<div id="errorMediCardid" style="position: absolute; left: 320px; top: 0px; line-height: 35px; color: #CC0000;">
						
									</div>
								</div>
								
								
									<div>
										<span class="zhuyi">诊疗卡是用户预约就诊的识别卡号，凭借该卡号，医院可快速识别用户的疾病资料，方便诊断。
										</span>
									</div>
								
							</div> <!-- <div id="residentCardidType" style="display: none">
								卡号：<input name="orderwebOrder.MediCardid" id="mediCardName" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								密码：<input id="mediCardName" type="password" />
							</div> -->
						</li>
					</ul>
				</div>
				<div class="message_tijiao">
					<a href="#" onclick="history.back();return false;" class="button">上一步</a>
					<a  href="javascript:tijiao(${bookable.bid},${patients.pid},'${patients.email}','${patients.pname}','${bookable.doctors.departs.dename}',${bookable.doctors.bcost},'${bookable.bdate}')" class="button"> 提交 </a>
				</div>
			</div>
			
			<div class="yuyue_ny_right">
				<div style="font-size: 14px; color: red; font-weight: bolder">
					
		
		 医院温馨提示：
						<li>预约时，须填报就诊患者本人的真实姓名和身份证号（新生儿如无身份证则填写父母一方的身份证），请务必确保信息内容的真实性，如发现有误按废号处理。</li>
						<li>可预约次天起一个星期内的诊号，每个人当天每个科室只能预约一个号。 </li>
						<li>请按预约时间提前到医院门诊大厅任意挂号收费窗口取号候诊，上午11点之前取号，下午15点之前取号,过时预约无效。</li> 
						<li>系统采用实名制挂号，如出现两次挂号未到现场取号，系统默认取消其以后预约资格。</li>
		
		</div>
			</div>
			
		</div>


		<div class="wenti" style="display: none;">

			<div class="wenti_top">常见问题</div>
			<div class="wenti_nr">
				<ul>
					
				</ul>
			</div>
			<div class="wenti_bottom"></div>
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

	<!--王若光提交弹窗-->
	<div id="hosiptalbox" style="display: none">
		<div class="hosiptalbox">
			<a onclick="onclose2();" class="closebtn">X</a>
			<div class="notice_con">
				<p id="cmsText"></p>
				<div style="font-size: 14px; color: red; font-weight: bolder">
					王若光预约须知：
					<li>1、王若光教授预约时间为提前7天预约，预约成功后凭取号密码和就诊人身份证前往医院窗口或自助机取号就诊；</li>
					<li>2、为节约患者就医时间，已成功预约的用户，建议您于就诊前一天上午11点前在医院取号检查，检查时需空腹；</li>
					<li>3、网上预约挂号时，请您在30分钟内完成挂号费支付操作，过时号源将会自动退号处理；</li>
					<li>4、如需退号，请必须于就诊前二天23点前完成，预约费用将原路退还，过期费用一律不退；</li>
					<li>5、取号时间为当天预约时间的上午11点前。超过该时间导致无法取号者，个人承担负责。</li>
				</div>
				<p class="btn">
					<button onclick="onclose2();" class="ok">好的，我知道了</button>
				</p>
			</div>
		</div>
	</div>
	<!--湘雅提交弹窗-->
	<div id="hosiptalboxXY" style="display: none">
		<div class="hosiptalbox">
			<a onclick="oncloseXY();" class="closebtn">X</a>
			<div class="notice_con">
				<p id="cmsText"></p>
				<div style="font-size: 16px; color: red; font-weight: bolder">
					 湖南省人民医院 预约须知：
					<li>按 湖南省人民医院 院规定，严格执行实名制预约，
					用户必须上传本人真实身份证原件至预约平台进行审核，
					请尽快到平台“个人中心-基本信息”中上传身份证照片，未上传或审核不通过的用户将不允许预约。</li>
				</div>
				<p class="btn">
					<button onclick="oncloseXY();" class="ok">好的，我知道了</button>
				</p>
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
