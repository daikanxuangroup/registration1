package com.hos.test;




import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.hos.bean.Patients;
import com.hos.service.PatientsService;
import com.hos.util.PageBean;
import com.hos.util.Pager;


public class PatientsTest {

	private PatientsService patientsService;
	@Test
	public void testPatientsFindAll(){
		List<Patients> p=patientsService.findAll();
		for (Patients patients : p) {
			System.out.println(patients.getPid()+" "+patients.getPname());
		}
	}
	@Test
	public void testPatientsUpdate(){
		Patients patients=new Patients();
		patients.setPid(10006);
		patients.setPname("猪小妹");
		patients.setSex("女");
		patients.setPhone("13871513032");
		patients.setIdcard("431124199103118116");
		patients.setPwd("123456");
		patients.setMedcard("30864827");
		patients.setEmail("474841607@qq.com");
		patients.setBy1("备用");
		patients.setBy2(9527);
		int count=	patientsService.updatePatients(patients);
		if(count>0){
			System.out.println("ok");
		}else {
			System.out.println("on");
		}
	}
	
	@Test
	public void testPatientsAdd(){
		Patients patients=new Patients();
		patients.setPid(4);
		patients.setPname("猪三妹");
		patients.setSex("女");
		patients.setPhone("13871513034");
		patients.setIdcard("431124199103118118");
		patients.setPwd("123456");
		patients.setMedcard("30864829");
		patients.setEmail("");
		patients.setBy1("");
	
	int count=	patientsService.addPatients(patients);
		if(count>0){
			System.out.println("ok");
		}else {
			System.out.println("on");
		}
	}
	@Test
	public void testPatientsRemove(){
		Patients patients=new Patients();
		patients.setPid(10006);
		int count=	patientsService.remove(patients);
		if(count>0){
			System.out.println("ok");
		}else {
			System.out.println("on");
		}
	
	}
	
	
	@Test
	public void findById(){
		Patients patients=patientsService.findById(10006);
		System.out.println(patients.getPid()+" "+patients.getPname());
		}
	@Test
	public void findPass(){
		Integer pid=10006;
		String pwd="123456";
		List<Patients>  list=patientsService.findPass(pid, pwd);
		for (Patients patients : list) {
			System.out.println(patients.getPname());
		}
	}
	
	@Test
	public void  findCard(){
		String cart="431124199103118116";
		List<Patients> list=patientsService.findCard(cart);
		for (Patients patients : list) {
			System.out.println(patients.getPname());
		}
	}
	
	@Test
	public void findPhone(){
		String phone="15827170725";
		List<Patients> list=patientsService.findPhone(phone);
		for (Patients patients : list) {
			System.out.println(patients.getPname()+"%%% "+patients.getEmail()+"##"+patients.getBy1());
		}
	}
	
	@Test
	public void findByName(){
	
		String temp = "猪小明";
		
		String pwd="123456";
		
		Patients p=new Patients();
		
	p=	patientsService.findByName(temp, pwd);
	System.out.println("#############"+p.getPname());
		
		}
		
		
		/*//String temp ="15315315326";
		String em = "^\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*$";
		//String ph = " ^[1][358][0-9]{9}$";
		String ph = "^[1][3578]\\d{9}$";
		//Pattern pemail = Pattern.compile("em");
		System.out.println(temp.matches(em));
		System.out.println(temp.matches(ph));
		if(temp.matches(em)){//邮箱登录
			String pwd="123456";
			patientsService.findByName(temp, pwd);
		System.out.println("you想");
		} else if(temp.matches(ph)){//手机号登录
		
		String pwd="123456";
		patientsService.findByName(temp, pwd);
		System.out.println("手机红啊");
		}else{//就是用户名登录
			String pwd="123456";
			patientsService.findByName(temp, pwd);
		System.out.println("用户名");
		}*/
		
		
	
	
	@Test
	public void findByPage(){
		System.out.println("1");
		  Integer page = 1;
		    Integer rows = 4;
		    String ename = null;
		    Integer pageno = (page - 1) * rows;
		    Integer pagesize = page * rows;
		Pager<Patients> pager=patientsService.findByPage("猪", 1, 2);
		System.out.println("2");
		System.out.println(pager.getTotal());
		for(Patients patients:pager.getRows()){
			System.out.println(patients.getPname());
		}
	}
	@Before
	public void init(){
	ApplicationContext ctx=new ClassPathXmlApplicationContext("applicationContext.xml");
	patientsService=ctx.getBean("patientsService",PatientsService.class);
	}
}


