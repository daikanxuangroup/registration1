package com.hos.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.hos.bean.Cards;
import com.hos.bean.Patients;
import com.hos.service.CardsService;
import com.hos.service.DoctorsService;
import com.hos.service.PatientsService;
import com.hos.util.Emails;

import net.sf.json.JSONObject;

@Controller
@SessionAttributes(value={"securityCode","patients"},types={String.class})
public class PatientsController {
	@Resource(name = "patientsService")
	private PatientsService patientsService;
	
	@Resource(name = "cardsService")
	private CardsService cardsService;
	
	@Resource(name="doctorsService")
	private DoctorsService doctorsService;

	@RequestMapping("login")
	public String login(@RequestParam("temp") String temp, @RequestParam("pwd") String pwd,
			@RequestParam("verifyCode") String verifyCode, HttpServletRequest request,ModelMap modelMap) {
		HttpSession session = request.getSession();
		String securityCode = (String) session.getAttribute("securityCode");
		String url = "redirect:/login.jsp";
		String message = "";
		if (verifyCode.equals(securityCode)) {
			Patients patients = patientsService.findByName(temp, pwd);
		
			if (patients != null) {
			/*	session.setAttribute("patients", patients);*/
				modelMap.put("patients", patients);
			 patients=	(Patients) modelMap.get("patients");

				url = "redirect:/index.jsp";
			} else {
				message = "?message=1";
			}
		} else {
			message = "?message=0";
		}
		return url + message;

	}

	// 注销
	@RequestMapping("patients_zuxiao")
	public String logout( HttpSession session, ModelMap modelMap) {	
		session.removeAttribute("patients");
		modelMap.remove("patients");
		return "redirect:/login.jsp";
	}

	// 注册
	@RequestMapping("patients_add")
	public String patients_add(Patients patients, @RequestParam("verifyCode") String verifyCode,
			HttpServletRequest request,ModelMap modelMap) {
		HttpSession session = request.getSession();
		String securityCode = (String) session.getAttribute("securityCode");
		// String url = "redirect:/register.jsp";
			
		if (verifyCode.equals(securityCode)) {
			int count = patientsService.addPatients(patients);
				
			patientsService.findByName(patients.getIdcard(), patients.getPwd());		
			if (patients != null) {		
				 modelMap.put("patients", patients);
				return "redirect:/index.jsp";
			}
		}
		return "redirect:/register1.jsp";
	}

	// 注册时失去焦点事件查询身份证是否注册过
	@RequestMapping("patients2_cardyz")
	public void patients2_cardyz(@RequestParam("idcard") String idcard, HttpServletResponse httpServletResponse) {

		boolean fals = false;

		PrintWriter out = null;
		List<Patients> list = patientsService.findCard(idcard);
		if (list.size() != 0) {
			fals = true;
		
		}
		JSONObject jo = new JSONObject();
		jo.element("suc", fals);

		try {
			out = httpServletResponse.getWriter();
			out.print(jo);
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	// 注册时失去焦点事件查询手机号码是否注册过
	@RequestMapping("patients2_phoneyz")
	public void patients2_phoneyz(@RequestParam("phone") String phone, HttpServletResponse httpServletResponse) {
		boolean fals = false;
		PrintWriter out = null;
		System.out.println("进了patients2_phoneyz方法");
		List<Patients> list = patientsService.findPhone(phone);
		if (list.size() != 0) {
			fals = true;
			System.out.println("号码已经注册");
		}
		JSONObject jo = new JSONObject();
		jo.element("suc", fals);
		System.out.println(fals + "*************");
		try {
			out = httpServletResponse.getWriter();
			out.print(jo);
			out.flush();
			out.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	// 修改密码时 失去焦点事件查询输入原密码是否正确
	@RequestMapping("patientspwd")
	@ResponseBody
	public String patientspwd(@RequestParam("pid") Integer pid,@RequestParam("pwd") String pwd, ModelMap modelMap){
		String fals = "false";
		Patients patients = patientsService.findByPwd(pid, pwd);
		if(patients != null){
			fals = "true";
		}
			
		return fals;
	}
	
	@RequestMapping("updatepwd")
	@ResponseBody
	public String updatepwd(@RequestParam("pid") Integer pid,@RequestParam("pwd") String pwd, ModelMap modelMap){
		String fals = "false";	
		if(0<patientsService.updatepwd(pid, pwd)){
			fals = "true";
		}
			
		return fals;
	}
	// 判断诊疗卡
	@RequestMapping("tempcards")
	@ResponseBody	
	public String tempcards(@RequestParam("cid") Integer cid,@RequestParam("idcard") String idcard){
		Cards cards= cardsService.findByCid(cid);
		System.out.println("laozi lai le ");
		String mgs = "";
		if(cards==null ){
			mgs = "meiyou";
		}else{
			if(cards.getIdcard().equals(idcard)){
				mgs = "ok";
				
			}else{
				mgs = "";
			}
			
		}	
		return mgs;		
	}
	@RequestMapping("doctorsBus")
	@ResponseBody	
	public String doctorsBus(ModelMap modelMap,@RequestParam("bid") Integer bid,
			@RequestParam("pid") Integer pid,
			@RequestParam("medcard")String medcard,
			@RequestParam("email")String email,
			@RequestParam("name")String name,
			@RequestParam("dename")String dename,
			@RequestParam("bcost")Double bcost,
			@RequestParam("date")String date ){
		SimpleDateFormat sdf= new SimpleDateFormat("yyyy年MM月dd日");
		Date date1 = new Date(date);
		date= sdf.format(date1);
			String mgs = "fals";
		
			if(0<doctorsService.doctorsBus(pid, bid, medcard)){		
				mgs = "true";
				Patients patients = patientsService.findById(pid);
				modelMap.put("patients", patients);
				Emails e=new Emails();
				e.email(email, name, dename, bcost, date);
		}
		
		
		
		return mgs;

			
	}
	
	
	
	
}
