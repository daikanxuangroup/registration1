package com.hos.controller;

import java.io.IOException;
import java.io.PipedWriter;
import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hos.bean.Departs;
import com.hos.service.DepartsService;

import net.sf.json.JSONArray;

@Controller
@RequestMapping("/departs/*")
public class DepartsController {
	@Resource(name="departsService")
private DepartsService departsService;
	
	@RequestMapping("findAll")
	@ResponseBody//POST模式下，使用 @RequestBody绑定请求对象，Spring会帮你进行协议转换，将Json、Xml协议转换成你需要的对象. 
	public void findAll(HttpServletResponse httpServletResponse) throws IOException{
		PrintWriter  out= null;
		List<Departs> list=departsService.findAll2();
		
			out=httpServletResponse.getWriter();
			JSONArray  array = JSONArray.fromObject(list);
			
			out.print(array);
			out.close();
			
	}
}
