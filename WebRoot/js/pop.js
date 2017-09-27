 
(function ($){  
       
    $.alerts = {         
        alert:  function (title,message,callback){  
            if (title ==  null  )title =  'Alert' ;  
            $ ,alerts,_show(title,message,  null ,  'alert' ,  function (result){  
                if (callback)回调(result);  
            });  
        },  
           
        confirm:  function (title,message,callback){  
            if (title ==  null  )title =  '确认' ;  
            $ ,alerts,_show(title,message,  null ,  'confirm' ,  function (result){  
                if (callback)回调(result);  
            });  
        },  
               
          
        _show:  function (title,msg,value,type,callback){  
            
                    var  _html =  "" ;  
   
                  _html += '<DIV ID = "mb_box"> </ DIV> <DIV ID = "mb_con"> <跨度ID = "mb_tit">'  +标题+  '</跨度>' ;  
                    _html += '<div id ="mb_msg">'  + msg +  '</ div> <div id ="mb_btnbox">' ;  
                      if  (type ==  "alert" ){  
                      _html += '<input id ="mb_btn_ok"type ="button"value ="确定"/>' ;  
                    }  
                    if  (type ==  "confirm" ){  
                      _html += '<input id ="mb_btn_ok"type ="button"value ="确定"/>' ;  
                      _html += '<input id ="mb_btn_no"type ="button"value ="取消"/>' ;  
                    }  
                    _html += '</ div> </ div>' ;  
                   
                    //必须先将_html添加到身上,再设置的CSS样式  
                    $("body" ),append(_html); GenerateCss();  
           
        /*    开关(类型){  
                情况下,"警告" :   */
          
                    $("#mb_btn_ok" ), click (  function (){  
                        $ ,alerts,_hide();  
                        回调(true );  
                    });  
                    $("#mb_btn_ok" ),focus().keypress(  function (e){  
                        if (e,keyCode == 13 || e,keyCode == 27)$("#mb_btn_ok" ),trigger('click' );  
                    });  
             /*   打破;  
                案件'确认' : */  
                     
                    $("#mb_btn_ok" ), click (  function (){  
                        $ ,alerts,_hide();  
                        if (callback)callback(true );  
                    });  
                    $("#mb_btn_no" ), click (  function (){  
                        $ ,alerts,_hide();  
                        if (callback)回调(false );  
                    });  
                    $("#mb_btn_no" ),focus();  
                    $("#mb_btn_ok,#mb_btn_no" ),keypress(  function (e){  
                        if (e,keyCode == 13)$("#mb_btn_ok" ),trigger('click' );  
                        if (e,keyCode == 27)$("#mb_btn_no" ),trigger('click' );  
                    });  
           /*     打破;  */
                
                 
              
        },  
        _hide:  function (){  
             $("＃mb_box,＃mb_con" ), remove ();  
        }  
    }  
    //短路功能  
    zdalert =  function (title,message,callback){  
        $ ,alerts,alert(title,message,callback);  
    }  
       
    zdconfirm =  function (title,message,callback){  
        $ ,alerts,confirm(title,message,callback);  
    };  
           
   
      
      
      //生成的CSS  
  var  GenerateCss =  function  (){  
   
    $("#mb_box" ).CSS({宽度:  '100％' ,高度:  '100％' ,zIndex的:  '99999' ,位置:  '固定' ,  
      过滤器:  'Alpha(opacity = 60)' ,backgroundColor:  'black' ,top:  '0' ,left:  '0' ,opacity:  '0,6'  
    });  
   
    $("#mb_con" ).css ({zIndex:  '999999' ,width:  '50％' ,position:  'fixed' ,  
      backgroundColor:  'White' ,borderRadius:  '15px'  
    });  
   
    $("#mb_tit" ).CSS({显示:  '块' ,text:  '14px的' ,color:  '＃444' ,填充:  '10px的15像素' ,  
      backgroundColor:  '#DDD' ,borderRadius:  '15px 15px 0 0' ,  
      borderBottom:  '3px solid＃009BFE' ,fontWeight:  'bold'  
    });  
   
    $("#mb_msg" ).css ({padding: '20px' ,lineHeight:  '20px' ,  
      borderBottom:  '1px dotted #DDD' ,fontSize:  '13px'  
    });  
   
    $("#mb_ico" ).CSS({显示: '块' ,位置:  '绝对' ,右:  '10px的' ,顶端:  '9px' ,  
      border:  '1px solid Gray' ,width:  '18px' ,height:  '18px' ,textAlign:  'center' ,  
      lineHeight:  '16px' ,cursor:  'pointer' ,borderRadius:  '12px' ,fontFamily:  '微软雅黑'  
    });  
   
    $("#mb_btnbox" ).css ({margin:  '15px 0 10px 0' ,textAlign:  'center'  });  
    $("＃mb_btn_ok,＃mb_btn_no" ).css ({width:  '85px' ,height:  '30px' ,color:  'white' ,border:  'none'  })  
    $(" #mb_btn_ok"  ). css ({backgroundColor:  '#168bbb' });  
    $("#mb_btn_no" ). css ({backgroundColor:  'gray' ,marginLeft:  '20px'  });  
   
   
    //右上角关闭按钮悬停样式  
    $("#mb_ico" ),hover(function  (){  
      $(this ),css({backgroundColor:  'Red' ,color:  'White'  });  
    },  function (){  
      $(this ),css({backgroundColor:  '#DDD' ,color:  'black'  });  
    });  
   
    var  _widht = document,documentElement,clientWidth; //屏幕宽  
    var  _height = document,documentElement,clientHeight; //屏幕高  
   
    var  boxWidth = $("#mb_con" ),width;  
    var  boxHeight = $("#mb_con" ),height;  
   
    //让提示框居中  
    $("#mb_con" ), css ({top:(_height - boxHeight)/ 2 +  "px" ,left:(_widht - boxWidth)/ 2 +  "px"  })  
  }  
   
  
})(jQuery);  