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
   
    <title>My JSP 'doctors.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style2.css" type="text/css">
<script language="javascript" type="${pageContext.request.contextPath }/resources/js/jquery-1.11.1.js"></script>
<script language="javascript" type="${pageContext.request.contextPath }/resources/js/popup_layer.js"></script>
<script type="text/javaScript" src="${pageContext.request.contextPath }/resources/js/index.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/page.js"></script>
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
function times(doid,date,starttime){
		var pid =$("#pid").val();
	if(pid=="" || pid ==null){
	layer.confirm('你还没有登录账号，是否登录？',function(index){
	
	window.location.href="login.jsp";
	})	
	
	}else{
	window.location.href="doctorstime?doid="+doid+"&date="+date+"&starttime="+starttime;
	}
	
} 


</script>
  </head>
  
  <body>
    
<input type="hidden" id="nextNumInfo" value="0">
	<input type="hidden" id="orderRange" value="30">
	



<script type="text/javaScript" src="${pageContext.request.contextPath }/resources/js/inputValiad.js"></script>
<script type="js/base64.js"></script> 
<!-- <link href="css/nk_login.css" rel="stylesheet" type="text/css"> -->
<!-- 设置session超时时间10分钟 -->

<div id="header">
	<input type="hidden" id="pid"  value="${patients.pid}">
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
	<div class="schedule clearfix">
		<div class="schedule_middle">
			<div class="schedule_jie">
				<div class="jieshao_tu">
					<img src="${pageContext.request.contextPath }/resources/image/jieshao_tu_湖南省儿童医院.jpg" onerror="this.src=&#39;images/hospital200.jpg&#39;">
					
				</div>
				<div class="schedule_zi">
					<p>
						<font> 湖南省人民医院</font>
						<font> ${dename}</font>
				
					</p>
					<p>
						<!--    -->
						<i>医院等级：</i>三级甲等</p>
					<p>
						<i>联系电话：</i>0731-89753999</p>
					<p>
						<i>联系地址：</i>中国湖南长沙市湘雅路87号</p>
					<p>
						<i>医院网址：</i><a href="http://www.xiangya.com.cn/" target="blank">http://www.xiangya.com.cn</a>
					</p>
					<p>
						<i>交通指南：</i>市内乘2路、405路、115路  </p>
					<!-- 特色专科：   -->
				</div>
			</div>

			<div class="schedule_xuanze">
				<strong>科室医生</strong><span class="zhankai"><a href="javascript:show_div()"></a> </span>
			</div>
			
			<div id="divHead" class="time_top" style="position: relative; top: 0px; z-index: 1;">
				<div class="time_left_jie">
					<div class="time_zhuanjia">专家</div>
					<div class="time_shanchang">擅长</div>
				</div>
				<div class="time_right_biao">
			
					<div id="biao_middel" class="biao_middle">
					
						<ul>			
						
						<c:forEach items="${wlist }"  var="week">
							<li>${week }</li>
						</c:forEach>	
			<!--<li>08/22<br> 星期二</li>-->			
						</ul>
					</div>
				</div>	
			</div>

<c:forEach items="${tlist }" var="tp">
			<div class="time_middle">
					
					<!-- 医生信息 start -->
						<div class="time_yisheng">
				          <div class="yisheng_tu" platformdoctid="XIEJIE">
				           <a href="#" onclick="">
				           	<img name="image" src="${pageContext.request.contextPath }/resources/image/doctor.jpg" method="post" onerror="this.src=&#39;images/doctor.jpg&#39;"> 
				           </a>
				          </div>
				          <div class="doctor_info">
				            <div class="info_title">
				              <b class="f14">${tp.doname }</b>
				              <span class="m_title">${tp.title }</span>
				            </div>
				            <div class="department">${tp.dename }门诊</div>
				     		       预约挂号费：<span style="color: red;">${tp.bcost } 元</span> 
				            <table class="goodat">
				              <tbody><tr>
				                <td class="good">简介：</td>
				                <td><div class="yisheng_jieshao_con">${tp.info} </div>
					              <div class="doctor-skill">

															</div>
					            		
												</td>
				              </tr>
				            </tbody>
				            </table>
				          </div>
				    </div>
					<!-- 医生信息 end -->
					<!-- 上午-->
					<div class="time_biao">
						<div class="time_biao_am">
							<span class="hui">上<br>午
							</span>
							<ul>
								<li>
									<c:if test="${tp.am1 eq 1 }">
									<c:choose>
									<c:when test="${tp.num1 lt tp.sum1}">
									
										<a href="javascript:times(${tp.doid},'${tp.date1}',-1)"> 
											<font color="green">预约<br>(${tp.num1 }/${tp.sum1})</font>
									</a>
									</c:when>
									<c:otherwise>
										<font color="red">已满<br>(${tp.num1 }/${tp.sum1})</font>
									</c:otherwise>
									</c:choose>
									</c:if>
								</li>
								<li>
									<c:if test="${tp.am2 eq 1 }">
									<c:choose>
									<c:when test="${tp.num2 lt tp.sum2}">
										<a href="javascript:times(${tp.doid},'${tp.date2}',-1)"> 
											<font color="green">预约<br>(${tp.num2 }/${tp.sum2})</font>
									</a>
									</c:when>
									<c:otherwise>
										<font color="red">已满<br>(${tp.num2 }/${tp.sum2})</font>
									</c:otherwise>
									</c:choose>
									</c:if>
								</li>
								<li>
									<c:if test="${tp.am3 eq 1 }">
									<c:choose>
									<c:when test="${tp.num3 lt tp.sum3}">
										<a href="javascript:times(${tp.doid},'${tp.date3}',-1)"> 
											<font color="green">预约<br>(${tp.num3 }/${tp.sum3})</font>
									</a>
									</c:when>
									<c:otherwise>
										<font color="red">已满<br>(${tp.num3 }/${tp.sum3})</font>
									</c:otherwise>
									</c:choose>
									</c:if>
								</li>
								<li>
									<c:if test="${tp.am4 eq 1 }">
									<c:choose>
									<c:when test="${tp.num4 lt tp.sum4}">
										<a href="javascript:times(${tp.doid},'${tp.date4}',-1)"> 
											<font color="green">预约<br>(${tp.num4 }/${tp.sum4})</font>
									</a>
									</c:when>
									<c:otherwise>
										<font color="red">已满<br>(${tp.num4 }/${tp.sum4})</font>
									</c:otherwise>
									</c:choose>
									</c:if>
								</li>
								<li>
									<c:if test="${tp.am5 eq 1 }">
									<c:choose>
									<c:when test="${tp.num5 lt tp.sum5}">
									<a href="javascript:times(${tp.doid},'${tp.date5}',-1)"> 
											<font color="green">预约<br>(${tp.num5 }/${tp.sum5})</font>
									</a>
									</c:when>
									<c:otherwise>
										<font color="red">已满<br>(${tp.num5 }/${tp.sum5})</font>
									</c:otherwise>
									</c:choose>
									</c:if>
								</li>
								<li>
									<c:if test="${tp.am6 eq 1 }">
									<c:choose>
									<c:when test="${tp.num6 lt tp.sum6}">
									
									<a href="javascript:times(${tp.doid},'${tp.date6}',-1)"> 
											<font color="green">预约<br>(${tp.num6 }/${tp.sum6})</font>
									</a>
									</c:when>
									<c:otherwise>
										<font color="red">已满<br>(${tp.num6 }/${tp.sum6})</font>
									</c:otherwise>
									</c:choose>
									</c:if>
								</li>
								<li>
									<c:if test="${tp.am7 eq 1 }">
									<c:choose>
									<c:when test="${tp.num7 lt tp.sum7}">
									<a href="javascript:times(${tp.doid},'${tp.date7}',-1)"> 
								
											<font color="green">预约<br>(${tp.num7 }/${tp.sum7})</font>
									</a>
									</c:when>
									<c:otherwise>
										<font color="red">已满<br>(${tp.num7 }/${tp.sum7})</font>
									</c:otherwise>
									</c:choose>
									</c:if>
								</li>
							</ul>
						</div>
						<!-- 下午-->
						<div class="time_biao_pm">
							<span class="hui">下<br>午
							</span>
							<ul>		
								<li>
									<c:if test="${tp.pm1 eq 1 }">
									<c:choose>
									<c:when test="${tp.nump1 lt tp.sump1}">
									<a href="javascript:times(${tp.doid},'${tp.date1}',1)"> 
											<font color="green">预约<br>(${tp.nump1 }/${tp.sump1})</font>
									</a>
									</c:when>
									<c:otherwise>
										<font color="red">已满<br>(${tp.nump1 }/${tp.sump1})</font>
									</c:otherwise>
									</c:choose>
									</c:if>
								</li>
								<li><c:if test="${tp.pm2 eq 1 }">
									<c:choose>
									<c:when test="${tp.nump2 lt tp.sump2}">
									<a href="javascript:times(${tp.doid},'${tp.date2}',1)"> 
									<font color="green">预约<br>(${tp.nump2 }/${tp.sump2})</font>
									</a>
									</c:when>
									<c:otherwise>
										<font color="red">已满<br>(${tp.nump2 }/${tp.sump2})</font>
									</c:otherwise>
									</c:choose>
									</c:if></li>
								<li><c:if test="${tp.pm3 eq 1 }">
									<c:choose>
									<c:when test="${tp.nump3 lt tp.sump3}">
									<a href="javascript:times(${tp.doid},'${tp.date3}',1)"> 
											<font color="green">预约<br>(${tp.nump3 }/${tp.sump3})</font>
									</a>
									</c:when>
									<c:otherwise>
										<font color="red">已满<br>(${tp.nump3 }/${tp.sump3})</font>
									</c:otherwise>
									</c:choose>
									</c:if></li>
								<li><c:if test="${tp.pm4 eq 1 }">
									<c:choose>
									<c:when test="${tp.nump4 lt tp.sump4}">
									<%-- <a href="javascript:times(${tp.doid},${tp.date4},1)"></a> --%>
									<a href="javascript:times(${tp.doid},'${tp.date4}',1)"> 
											<font color="green">预约<br>(${tp.nump4 }/${tp.sump4})</font>
									</a>
									</c:when>
									<c:otherwise>
										<font color="red">已满<br>(${tp.nump4 }/${tp.sump4})</font>
									</c:otherwise>
									</c:choose>
									</c:if></li>
								<li><c:if test="${tp.pm5 eq 1 }">
									<c:choose>
									<c:when test="${tp.nump5 lt tp.sump5}">
									<a href="javascript:times(${tp.doid},'${tp.date5}',1)"> 
											<font color="green">预约<br>(${tp.nump5 }/${tp.sump5})</font>
									</a>
									</c:when>
									<c:otherwise>
										<font color="red">已满<br>(${tp.nump5 }/${tp.sump5})</font>
									</c:otherwise>
									</c:choose>
									</c:if></li>
								<li><c:if test="${tp.pm6 eq 1 }">
									<c:choose>
									<c:when test="${tp.nump6 lt tp.sump6}">
									<a href="javascript:times(${tp.doid},'${tp.date6}',1)""> 
											<font color="green">预约<br>(${tp.nump6 }/${tp.sump6})</font>
									</a>
									</c:when>
									<c:otherwise>
										<font color="red">已满<br>(${tp.nump6 }/${tp.sump6})</font>
									</c:otherwise>
									</c:choose>
									</c:if></li>
								<li><c:if test="${tp.pm7 eq 1 }">
									<c:choose>
									<c:when test="${tp.nump7 lt tp.sump7}">
									<a href="javascript:times(${tp.doid},'${tp.date7}',1)"> 
											<font color="green">预约<br>(${tp.nump7 }/${tp.sump7})</font>
									</a>
									</c:when>
									<c:otherwise>
										<font color="red">已满<br>(${tp.nump7 }/${tp.sump7})</font>
									</c:otherwise>
									</c:choose>
									</c:if></li>	
							</ul>
						</div>
					</div>
				
			</div>	
			</c:forEach>
		</div>
	</div>



<div id="bottom">
  <div class="bottom">
    <div class="bottom_left">
      <p>301医院统一预约挂号服务平台</p>
      <p>
        <a href="http://www.hnyygh.com/getArticleList_guide.action?articleId=About_us&channelId=105&contentPath=" target="_parent" style="white-space: nowrap; width: 50px">关于我们</a>
        |
        <a href="http://www.hnyygh.com/getArticleList_guide.action?articleId=Customer_service&channelId=105&contentPath=" target="_parent" style="white-space: nowrap; width: 50px">客户服务</a>
        |
        <a href="http://www.hnyygh.com/getArticleList_guide.action?articleId=461&channelId=105&contentPath=&pattern=1" target="_parent">使用帮助 </a>
        |
        <a href="http://www.hnyygh.com/getArticleList_guide.action?articleId=Contact_us&channelId=105&contentPath=" target="_parent" style="white-space: nowrap; width: 50px">联系我们</a>
      </p>
      <p>技术支持：湖南三零一医疗信息技术有限公司</p>
      <p>联系电话：<font color="red"><strong>400 9918 580</strong></font> &nbsp;&nbsp;&nbsp;&nbsp; 湘ICP备14005311号-1</p>
    </div>
  </div>
</div>

	
	<div id="hosiptalbox" style="display:none">
<div class="hosiptalbox">
  <a onclick="oncloseNotice();" class="closebtn">X</a>
  <div class="title">医院公告</div>
  <div class="notice_con"><p id="cmsText"></p>
  <p class="btn"><button onclick="oncloseNotice();" class="ok">好的，我知道了</button></p>
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
