package com.hos.test;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.hos.bean.Departs;
import com.hos.bean.Doctors;
import com.hos.bean.Reservation;
import com.hos.bean.Tempsper;
import com.hos.service.DoctorsService;

public class DoctorsServiceTest {
	


	private DoctorsService doctorsService;
	
	
	
	@Test
	public void findres(){
		List<Reservation> list=doctorsService.findRes(10000);
		for ( Reservation r: list) {
			System.out.println(r.getBookable().getDoctors().getDeparts().getDename());
		}
	}
	
	@Test
	 public void test() { 
		 DoctorsServiceTest outer = new DoctorsServiceTest(); 
		 DoctorsServiceTest.Inner inner = outer.new Inner(); 
        inner.print("DoctorsServiceTest.new"); 
 
        inner = outer.getInner(); 
        inner.print("DoctorsServiceTest.get"); 
    } 
 
    // 个人推荐使用getxxx()来获取成员内部类，尤其是该内部类的构造函数无参数时 
    public Inner getInner() { 
        return new Inner(); 
    } 
 
    public class Inner { 
        public void print(String str) { 
            System.out.println(str); 
        } 
    } 
    
    @Test
    public void showDocBk(){
 
    		
		List<String> list = printWeekdays();
		List<Tempsper> tlist =doctorsService.findlist(list, 1);
		System.out.println(tlist.size());
		for(Tempsper s: tlist){
			System.out.println(s.getDoname()+" "+s.getDate1());
		}



	
		
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
   
    
    
	
	@Test
	public void findAllDoctors(){
		List<Doctors> list=doctorsService.findAllDoctors();
		for (Doctors doctors : list) {
		System.out.println(doctors.getDoname()+" "+doctors.getDeid());	
		}
	}
	
	@Test
	public void findByDeid(){
		List<Doctors> list=doctorsService.findByDeid(10003);
		for (Doctors doctors : list) {
			System.out.println(doctors.toString());
		}
	}
	@Before
	public void init(){
		ApplicationContext ctx=new ClassPathXmlApplicationContext("applicationContext.xml");
		doctorsService=ctx.getBean("doctorsService",DoctorsService.class);
	}
}
