
$(function(){
	
	customerl();
});


function customerl(){
	
	$.ajax({	
		url:'departs/findAll',
		type:'post',
		dataType: 'json',
		
		success:function(data){
			
			console.log(data);
			
	$.each(data,function(){
		var tr2=("<li><a href='javascript:finddname("+this.deid+")'>"+this.dename+"</a></li>");
			$("#dename1").append(tr2);
		});
		}				
	});
}

function finddname(deid){
	window.location.href="showDocBk?deid="+deid;
}

/*

function persons(){
	
	if(confirm("你还没登录，是否登录账号")){
		
	}
		
}*/
function persons(pid){

	if(pid=="" || pid ==null){
		
		layer.confirm('你还没有登录账号，是否登录？',function(index){
			window.location.href="login.jsp";
			
		})
	/*	if(confirm("你还没有登录账号，是否登录")){
			window.location.href="login.jsp";
		}*/	
	}else{
	
		window.location.href="persons?pid="+pid;
	}

}




function pass(pid){
	var pwd = document.getElementById("pwd").value;

	$.ajax({
		url:'patientspwd',
		type:'POST',
		data:{"pid":pid,"pwd":pwd},
		success:function(data){
			if(data=="true"){
				document.getElementById("ypass1").style.display="none";
				document.getElementById("ypass2").style.display="";
			}else{
				document.getElementById("userPass").innerHTML = "&nbsp;密码错误";
				document.getElementById("userPass").style.display="";
			}
		}
	});
	
}

function passpwd(pid){

	var pwd = document.getElementById("userPassword").value;
	
	$.ajax({
		url:'updatepwd',
		type:'POST',
		data:{"pid":pid,"pwd":pwd},
		success:function(data){
			if(data=="true"){
			
				 layer.msg('修改成功!',{icon:1,time:1800});
			 setTimeout(function () { 
				
				 window.location.href="persons?pid="+pid;
                     }, 2000);		
			
			}else{
				layer.msg('修改失败!',{icon:1,time:3000});

			}
		}
	});	
}



















