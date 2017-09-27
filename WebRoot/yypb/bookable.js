$(function(){
	$('#dd').datebox('setValue', formatterDate(new Date()));

	$('#cc').combobox({    
	    url:'bookable_findED',    
	    valueField:'deid',    
	    textField:'dename'   
	}); 
	$('#bTool').hide();
	
	
//	$("#dg_bookable").datagrid({
//		url:"bookable_findBK",
//		queryParams:{datetime:$('#dd').datebox('getValue'),deid:$('#cc').combobox('getValue')},
//		striped:true,//显示斑马线
//		nowrap:true,//不自动换行
//		rownumbers:true,//显示行号
//		columns:[[
//		   {field:"doid",title:"医生ID",width:100,sortable:true},
//		   {field:"doname",title:"医生姓名",width:100},
//		   {field:"time",title:"时段",width:100},
//		   {field:"reg1",title:"周日",width:100},
//		   {field:"reg2",title:"周一",width:100},
//		   {field:"reg3",title:"周二",width:100},
//		   {field:"reg4",title:"周三",width:100},
//		   {field:"reg5",title:"周四",width:100},
//		   {field:"reg6",title:"周五",width:100},
//		   {field:"reg7",title:"周六",width:100}
//		          ]],
//		pagination:true,//显示分页工具栏
//		pageSize:20,//初始分页大小
//		sortName:"doid",//初始默认排序列名
//		sortOrder:"ASC",
//		toolbar:"#bTool",
//		onLoadSuccess:function(data){
//			mergeCellsByField("dg_bookable", "doid,doname");
//			var flag = true;
//			$.each(data.rows,function(){
//				var i = this.reg1+this.reg2+this.reg3+
//					this.reg4+this.reg5+this.reg6;
//				if(i != ""){
//					flag = false;
//				}
//			});
//			if(flag){
//				alert("该科室所选周尚未排班！");
//			}
//		}
//	});
});



//得到当前日期
function formatterDate(date) {
	var day = date.getDate() > 9 ? date.getDate() : "0" + date.getDate();
	var month = (date.getMonth() + 1) > 9 ? (date.getMonth() + 1) : "0"+ (date.getMonth() + 1);
	return date.getFullYear() + '-' + month + '-' + day;
};

/*
 * 查询排班的方法
 */
function searchbook(){
	var v = $('#dd').datebox('getValue'); 
	var c = $('#cc').combobox('getValue');
	if(v == "" || c== ""){
		alert("尚未选择时间或科室！");
	}else{
//		alert("科室号:"+c+"  时间："+v);
//		$("#dg_bookable").datagrid('load',{"datetime":v,"deid":c});
		$.ajax({url:'bookable_findWeek',
				data:{datetime:v},
				dataType:'json',
				success:function(data){
		$("#dg_bookable").datagrid({
			url:"bookable_findBK",
			queryParams:{datetime:$('#dd').datebox('getValue'),deid:$('#cc').combobox('getValue')},
			striped:true,//显示斑马线
			nowrap:true,//不自动换行
			rownumbers:true,//显示行号
			columns:data, //动态列名
			pagination:true,//显示分页工具栏
			pageSize:20,//初始分页大小
			sortName:"doid",//初始默认排序列名
			sortOrder:"ASC",
			toolbar:"#bTool",
			onLoadSuccess:function(data){
				$('#bTool').show();
				mergeCellsByField("dg_bookable", "doid,doname");
				var flag = true;
				$.each(data.rows,function(){
					var i = this.reg1+this.reg2+this.reg3+
						this.reg4+this.reg5+this.reg6;
					if(i != ""){
						flag = false;
					}
				});
				if(flag){
					alert("该科室所选周尚未排班！");
				}
			}
		});
		 
		},error:function(xhr){
		  alert('动态页有问题或者返回了不标准的JSON字符串\n'+xhr.responseText);
		}});
	}
}

/**
 * 生成排班
 */
function addbook(){
	var d = $('#dd').datebox('getValue'); 
	var de = $('#cc').combobox('getValue');
	if(d == "" || de== ""){
		alert("尚未选择时间或科室！");
	}else{
		$.ajax({url:'bookable_findBK',
			data:{datetime:d,deid:de,page:1,rows:40,order:"ASC"},
			dataType:'json',
			success:function(data){
				var flag = false;
				$.each(data.rows,function(){
					var i = this.reg1+this.reg2+this.reg3+
						this.reg4+this.reg5+this.reg6;
					if(i != ""){
						flag = true;
					}
				});
				if(flag){
					alert("该科室所选周已排班！");
				}else{
//					alert("可以排班！");
					//确认可以排班后进行排班
					$.ajax({url:'bookable_addBK',
						data:{datetime:d,deid:de},
						dataType:'json',
						success:function(data){
//							console.log(data);
							if(data.result =="success"){
								alert("排班成功！");
								$("#dg_bookable").datagrid('reload');
							}
//							alert(data.result);
//							alert("排班成功！");
						},error:function(xhr){
							alert('动态页有问题或者返回了不标准的JSON字符串\n'+xhr.responseText);
						}
					});
				}
			},error:function(xhr){
	  alert('动态页有问题或者返回了不标准的JSON字符串\n'+xhr.responseText);
	}});
	}
}
//按周删除排班信息
function removeBkb(){
	var rows = $('#dg_bookable').datagrid('getRows')//获取当前页的数据行  
	var doid = rows[0]['doid'];//医生ID
	var opts = $('#dg_bookable').datagrid('getColumnOption','reg1'); 
//	console.log(opts);
	var bdate = opts.title;
//	alert("医生id："+doid+";时间："+bdate);
	$.ajax({url:'bookable_deleteBK',
		data:{datetime:bdate,doid:doid},
		dataType:'json',
		success:function(data){
			if(data.result == "after"){
				alert("已删除此排班信息！");
			}else if(data.result == "before"){
				alert("历史排班信息无法删除！");
			}else if(data.result == "center"){
				alert("此周排班表中存在已上线信息，无法删除！未上线部分已更新。");
			}
			$("#dg_bookable").datagrid('reload');
		},error:function(xhr){
			alert('动态页有问题或者返回了不标准的JSON字符串\n'+xhr.responseText);
		}
	});
	    
}
//合并重复行
function mergeCellsByField(tableID, colList) {
    var ColArray = colList.split(",");
    var tTable = $("#" + tableID);
    var TableRowCnts = tTable.datagrid("getRows").length;
    var tmpA;
    var tmpB;
    var PerTxt = "";
    var CurTxt = "";
    var alertStr = "";
    for (j = ColArray.length - 1; j >= 0; j--) {
        PerTxt = "";
        tmpA = 1;
        tmpB = 0;

        for (i = 0; i <= TableRowCnts; i++) {
            if (i == TableRowCnts) {
                CurTxt = "";
            }
            else {
                CurTxt = tTable.datagrid("getRows")[i][ColArray[j]];
            }
            if (PerTxt == CurTxt) {
                tmpA += 1;
            }
            else {
                tmpB += tmpA;
                
                tTable.datagrid("mergeCells", {
                    index: i - tmpA,
                    field: ColArray[j],　　//合并字段
                    rowspan: tmpA,
                    colspan: null
                });
                tTable.datagrid("mergeCells", { //根据ColArray[j]进行合并
                    index: i - tmpA,
                    field: "Ideparture",
                    rowspan: tmpA,
                    colspan: null
                });
               
                tmpA = 1;
            }
            PerTxt = CurTxt;
        }
    }
}

