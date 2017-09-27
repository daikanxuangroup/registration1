package com.hos.service;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.hos.bean.Bookable;
import com.hos.bean.Doctors;
import com.hos.bean.Reservation;
import com.hos.bean.Tempsper;
import com.hos.dao.DoctorsMapper;

@Service("doctorsService")
@Transactional(readOnly=true,propagation=Propagation.NOT_SUPPORTED)
public class DoctorsService {
	@Resource(name="doctorsMapper")
private DoctorsMapper doctorsMapper;

	public List<Doctors> findAllDoctors(){
		return doctorsMapper.findAllDoctors();
	}
	public List<Doctors> findByDeid(Integer deid){
		return doctorsMapper.findByDeid(deid);
	}
	public List<Tempsper> findlist(List<String> list,Integer deid){
		return doctorsMapper.findlist(list, deid);		
	}
	@Transactional(propagation=Propagation.REQUIRED,isolation=Isolation.DEFAULT,rollbackFor=Exception.class)
	public int doctorsBus(Integer pid,Integer bid,String medcard){
		doctorsMapper.insertres(pid, bid);
		doctorsMapper.updateble(bid);
		int count=0;
		if(medcard=="" ||medcard==null){
			count=	doctorsMapper.updatePatients(pid,medcard);		
		}else{
			doctorsMapper.updatePatients2(pid,medcard);	
			count=	doctorsMapper.updatePatients(pid,medcard);
		}	
		return count;
		
	}
	
	public Bookable findble(Integer doid,String date,Integer starttime){
		
		return doctorsMapper.findble(doid, date, starttime);
		
	}
	
	
	public List<Reservation> findRes(Integer pid){
		return doctorsMapper.findRes(pid);
		
	}
}
