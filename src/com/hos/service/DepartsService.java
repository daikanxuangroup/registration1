package com.hos.service;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.hos.bean.Departs;
import com.hos.bean.Doctors;
import com.hos.dao.DepartsMapper;

@Service("departsService")
@Transactional(propagation=Propagation.NOT_SUPPORTED,readOnly=true)
public class DepartsService {
	@Resource(name="departsMapper")
private DepartsMapper departsMapper;
	@Transactional(propagation=Propagation.REQUIRED,isolation=Isolation.DEFAULT,rollbackFor=Exception.class)
	public int addDeparts(Departs departs){
		return departsMapper.addDeparts(departs);
	}
	@Transactional(propagation=Propagation.REQUIRED,isolation=Isolation.DEFAULT,rollbackFor=Exception.class)
	public int deleteDeparts(Departs departs){
		return departsMapper.deleteDeparts(departs);
	}
	@Transactional(propagation=Propagation.REQUIRED,isolation=Isolation.DEFAULT,rollbackFor=Exception.class)
	public int updateDeparts(Departs departs){
		return departsMapper.updateDeparts(departs);
	}
	public  List<Departs> findAll(){
		return departsMapper.findAll();
	}
	public List<Doctors> findDepartsDoctors(Integer deid){
		return departsMapper.findDepartsDoctors(deid);
	}
	
	 public Departs findByDeid(Integer deid){
		return departsMapper.findByDeid(deid);
	}
	 public List<Departs> findAll2(){
		 return departsMapper.findAll2();
	 }
	 public Doctors findDocById(Integer doid){
		 return departsMapper.findDocById(doid);
	 }
}
