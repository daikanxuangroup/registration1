(function() {
	if (!window.jQuery) {
		document.write("<script src=\"js/jQuery/jquery-1.11.1.js\"></script>");
		//检测是否需要引入验证插件 
	if ($("script[validationEngine]").length > 0) {
		if ($("link[href$='validationEngine.jquery.css']").length == 0) {
			$("head").append("<link rel=\"stylesheet\" href=\"css/jqueryValidationEngine/validationEngine.jquery.css\"> ");
		}
		if ($("script[src$='jquery.validationEngine-zh_CN.js']").length == 0) {
			$("head").append("<script src=\"js/jQuery/jqueryValidationEngine/jquery.validationEngine-zh_CN.js\"></script>");
		}
		if ($("script[src$='jquery.validationEngine.js']").length == 0) {
			$("head").append("<script src=\"js/jQuery/jqueryValidationEngine/jquery.validationEngine.js\"></script>");
		}
	}
	}
})();
/**
 * 提交信息
 * 
 * @param obj
 *            包含信息的js对象
 * @param url
 *            要提交到的URL
 * @param target   页面跳转方式      _blank   
 */
function formSubmit(obj, url,target) {
	if ($("#submitDiv").length == 0) {
		$("body").append("<div id='submitDiv'></div>");
	}
	// 创建form表单
	if(target == null)
	{
		target = "_self";
	}
	var str = "<form id='paramSubmit' action='" + url + "' method='post' target='"+target+"'>";
	// 添加隐藏域并填充数据
	for (var s in obj) {
		if ((typeof(obj[s]) == "string") || (typeof(obj[s]) == "number")
				|| (typeof(obj[s]) == "boolean")) {
			str += "<input type='hidden' name='" + encodeURI(s) + "' value='"
					+ encodeURI(obj[s]) + "' />";
		} else {
			// 此分支针对Struts的对象自动装载
			for (var s2 in obj[s]) {
				str += "<input type='hidden' name='" + encodeURI(s + "." + s2)
						+ "' value='" + encodeURI(obj[s][s2]) + "' />";
			}
		}
	}
	str += "</form>";
	$("#submitDiv").html(str);
	// 提交表单
	$("#paramSubmit").submit();
}

/**
 * 弹出框总调用
 * 
 * @param {}
 *            option
 */
function messageBox(option) {
	option = $.extend(option, {
		cancel : function() {
			this.remove()
		}
	})
	if ($("link[href='css/ui-dialog.css']").length == 0) {
		$("head")
				.append("<link rel='stylesheet' href='css/ui-dialog.css' type='text/css' />");
	}
	// 判断是否已经引入js,如果没有引入,则动态引入
	if ($("script[src$='dialog-plus-min.js']").length == 0) {
		$.getScript("js/artDialog/dialog-plus-min.js", function() {
					$.getScript("js/artDialog/dialog-config.js");
					dialog(option).show();
				});
	} else {
		dialog(option).show();
	}
}

/**
 * 模态弹出框总调用
 * 
 * @param {}
 *            option
 */
function messageBoxModal(option) {
	if(!option.isCancel){
		option = $.extend(option, {
			cancel : function() {
				this.remove();
			}
		})
	}
	if ($("link[href='css/ui-dialog.css']").length == 0) {
		$("head")
				.append("<link rel='stylesheet' href='css/ui-dialog.css' type='text/css' />");
		var Browser_Name=navigator.appName;
		var is_IE=(Browser_Name=="Microsoft Internet Explorer");//判读是否为ie浏览器
		 if(is_IE){
			 var Browser_Version=parseFloat(navigator.appVersion);
			 var Browser_Agent=navigator.userAgent;
			 var Version_Start=Browser_Agent.indexOf("MSIE");
			 var Version_End=Browser_Agent.indexOf(";",Version_Start);
			 var Actual_Version=Browser_Agent.substring(Version_Start+5,Version_End);
			 var version = parseInt(Actual_Version);
			 if (version<9) {
				 $("head").append("<link rel='stylesheet' href='css/ui-dialog-IE.css' type='text/css' />");
			}else {
				$("head").append("<link rel='stylesheet' href='css/ui-dialog-noIE.css' type='text/css' />");
			}
		 }else {
			 $("head").append("<link rel='stylesheet' href='css/ui-dialog-noIE.css' type='text/css' />");
		}
	}
	if ($("script[src$='dialog-plus-min.js']").length == 0) {
		$("head")
				.append("<script type='text/javascript' src='js/artDialog/dialog-plus-min.js'></script>");
		$.getScript("js/artDialog/dialog-config.js");
		dialog(option).showModal();
	} else {
		$.getScript("js/artDialog/dialog-config.js");
		dialog(option).showModal();
	}
}

/**
 * 关闭对话框
 * @param id 创建对话框时传入的ID
 */
function messageBoxClose(id){
	option ={id : id};
	if ($("link[href='css/ui-dialog.css']").length == 0) {
		$("head")
				.append("<link rel='stylesheet' href='css/ui-dialog.css' type='text/css' />");
	}
	if ($("script[src$='dialog-plus-min.js']").length == 0) {
		$("head")
				.append("<script type='text/javascript' src='js/artDialog/dialog-plus-min.js'></script>");
		$.getScript("js/artDialog/dialog-config.js");
		dialog(option).close().remove();
	} else {
		$.getScript("js/artDialog/dialog-config.js");
		dialog(option).close().remove();
	}
}


/**
 * 气泡弹窗
 * 
 * <pre>
 * option :对象或者显示内容 默认值{align:'right',content:&quot;&quot;,padding:8}
 * selector:选择器或者document对象                                
 * delay:等待时间,如果为空则永久显示                                    
 * </pre>
 */
window.alertBubble = function(option, selector, delay) {
	var dom;
	var optionDefault = {
		align : 'right top',
		padding : 8
	};
	var dialogObj;

	switch (typeof(selector)) {
		case "string" :
			dom = $(selector)[0];
			break;
		case "object" :
			dom = selector;
			break;
		default :
			$.error("alertBubble:selector参数错误(" + dom + ")");
	}

	switch (typeof(option)) {
		case "string" :
			optionDefault = $.extend(optionDefault, {
						content : option
					});
			break;
		case "object" :
			optionDefault = $.extend(option, optionDefault);
			break;
		default :
			$.error("alertBubble:option参数错误(" + option + ")");
	}

	if ($("link[href='css/ui-dialog.css']").length == 0) {
		$("head")
				.append("<link rel='stylesheet' href='css/ui-dialog.css' type='text/css' />");
	}

	if ($("script[src$='dialog-plus-min.js']").length == 0) {
		$("head")
				.append("<script type='text/javascript' src='js/artDialog/dialog-plus-min.js'></script>");
		$.getScript("js/artDialog/dialog-config.js");

	}
	dialogObj = dialog(optionDefault).show(dom);
	if (delay != null && /\d+/.test(delay)) {
		setTimeout(function() {
					dialogObj.close().remove();
				}, delay);
	}
}

window.alert = function(message, title, callback) {
	var defaultOption = {
		title : title ? title : "温馨提示",
		content : message,
		ok : callback ? callback : $.noop,
		autofocus : false,
		fixed : true,
		cancel : false,
		okValue : "确定",
		cancelValue : "取消",
		skin : "ui-dialog-minWidth"
	};
	if (typeof(title) === "function") {
		callback = title;
		title = false
	}
	var option = typeof(message) === "object" ? $
			.extend(defaultOption, message) : defaultOption;
	if ((option.content + "").length < 10) {
		$.extend(defaultOption, {
					width : "10em"
				})
	}
	messageBox(option);
}
window.confirmModal = function(message, title, callback) {
	var defaultOption = {
		title : title ? title : "温馨提示",
		content : message,
		ok : !callback ?$.noop:function() {
			var resultl = callback(true);
			return resultl;
		},
		fixed : true,
		cancel : function() {
			callback(false)
		},
		autofocus : false,
		okValue : "确定",
		cancelValue : "取消"
	};
	if (typeof(title) === "function") {
		callback = title;
		title = false
	}
	if (typeof(callback) !== "function") {
		$.error("confirm:回调函数不存在,或者类型错误");
		return false;
	}
	var option = typeof(message) === "object" ? $
			.extend(defaultOption, message) : defaultOption;
	if ((option.content + "").length < 10) {
		$.extend(defaultOption, {
					width : "10em"
				});
	}
	messageBoxModal(option);
}
window.confirm = function(message, title, callback) {
	var defaultOption = {
		title : title ? title : "温馨提示",
		content : message,
		ok : !callback ?$.noop:function() {
			callback(true);
		},
		fixed : true,
		cancel : function() {
			callback(false)
		},
		autofocus : false,
		okValue : "确定",
		cancelValue : "取消"
	};
	if (typeof(title) === "function") {
		callback = title;
		title = false;
	}
	var option = typeof(message) === "object" ? $
			.extend(defaultOption, message) : defaultOption;
	if ((option.content + "").length < 10) {
		$.extend(defaultOption, {
					width : "10em"
				});
	}
	messageBox(option);
}

window.prompt = function(message, value, title, callback) {
	var defaultOption = {
		title : title ? title : "温馨提示",
		content : message
				+ "<br><input type='text' dialog-returnValue autofocus "
				+ (value ? ("value='" + value + "'") : "") + "/>",
		ok : !callback ?$.noop:function() {
			callback($(":text[dialog-returnValue]").val());
		},
		fixed : true,
		autofocus : false,
		okValue : "确定"
	};
	if (typeof(title) === "function") {
		callback = title;
		title = false
	}
	if (typeof(value) === "function") {
		callback = value;
		value = false
	}
	if (typeof(callback) !== "function") {
		$.error("prompt:回调函数不存在,或者类型错误");
		return false;
	}
	var option = typeof(message) === "object" ? $
			.extend(defaultOption, message) : defaultOption;
	messageBox(option);
}

/**
 * 判断对象是否为空
 * 
 * @param obj
 *            待判断对象
 * @return Boolean 为true则obj为空,否则不为空
 */
function isEmpty(obj) {
	if (obj == null) {
		return true;
	}
	if (typeof(obj) == "string") {
		return obj.length == 0;
	}
}
/**
 * 判断对象是否不为空
 * 
 * @param obj
 *            待判断对象
 * @return Boolean 不为空返回true,否则返回false
 */
function isNotEmpty(obj) {
	return !isEmpty(obj);
}

function showQr(img){
	var qrUrl = document.getElementById('J_qrImgUrl').value;
	alert(img);
}