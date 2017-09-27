package com.hos.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.hos.bean.Bookable;
import com.hos.bean.Departs;
import com.hos.bean.Patients;
import com.hos.bean.Reservation;
import com.hos.bean.Tempsper;
import com.hos.service.DepartsService;
import com.hos.service.DoctorsService;

@Controller
@SessionAttributes(value={"securityCode","patients"},types={String.class})
public class ShowDocBkController {
	@Resource(name="departsService")
private DepartsService departsService;
	@Resource(name="doctorsService")
private DoctorsService doctorsService;	
		
	@RequestMapping("showDocBk")
	public ModelAndView showDocBk(@RequestParam("deid") Integer deid){
	
		List<String> wlist  = new ArrayList<String>();//时间
		wlist =printWeekdays2();
		/*List<Tempsper> tlist = new ArrayList<Tempsper>();*/			
		List<String> list = printWeekdays();

		List<Tempsper> tlist =doctorsService.findlist(list, deid);

		Departs de=departsService.findByDeid(deid);//部门信息
		String dename =de.getDename();//部门名字
		ModelAndView mv=new ModelAndView();
		mv.setViewName("doctors");
		mv.addObject("de", de);//部门信息
		mv.addObject("tlist", tlist);
		mv.addObject("wlist",wlist);//时间
		mv.addObject("dename",dename);//部门名字

		return mv;
		
	}
	
	@RequestMapping("doctorstime")
	public String times(ModelMap modelMap ,@RequestParam("doid") Integer doid,
			@RequestParam("date")String date ,
			@RequestParam("starttime")Integer starttime ){	
			Bookable bookable=doctorsService.findble(doid, date, starttime);
			modelMap.put("bookable", bookable);				
			return "times2";
		
	}
	@RequestMapping("persons")
	public String persons(ModelMap modelMap ,@RequestParam("pid") Integer pid){
		List<Reservation> list=doctorsService.findRes(pid);	
		modelMap.put("list", list);
		if(list.size()>0){
			modelMap.put("msg", 1);
		}else{
			modelMap.put("msg", 0);
		}
		
		return "persons";
		
	}
	
	
	
	
	
	

	private static List<String> printWeekdays() {
        Calendar calendar = Calendar.getInstance();
        calendar.add(Calendar.DATE, 1);
        List <String> list =new ArrayList<String>();
        for (int i = 0; i < 7; i++) {
        	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        	String s= dateFormat.format(calendar.getTime());
        	list.add(s);
            calendar.add(Calendar.DATE, 1);
            
        }
		return list; 
    }
	
	private static List<String> printWeekdays2() {
        Calendar calendar = Calendar.getInstance();
        calendar.add(Calendar.DATE, 1);
        List <String> list =new ArrayList<String>();
        for (int i = 0; i < 7; i++) {
        	SimpleDateFormat dateFormat = new SimpleDateFormat(" EE  MM/dd");
        	String s= dateFormat.format(calendar.getTime());
        	list.add(s);
            calendar.add(Calendar.DATE, 1);
            
        }
		return list; 
    }
	
	
	
	
	
	
	
}
