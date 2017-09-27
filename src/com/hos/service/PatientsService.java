package com.hos.service;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.hos.bean.Patients;
import com.hos.dao.PatientsMapper;
import com.hos.util.Pager;

@Service("patientsService")
@Transactional(propagation=Propagation.NOT_SUPPORTED,readOnly=true)
public class PatientsService {

	@Resource(name="patientsMapper")
	private PatientsMapper patientsMapper;
	@Transactional(propagation=Propagation.REQUIRED,isolation=Isolation.DEFAULT,rollbackFor=Exception.class)
	public int addPatients(Patients patients){
		return patientsMapper.addPatients(patients);
	}
	@Transactional(propagation=Propagation.REQUIRED,isolation=Isolation.DEFAULT,rollbackFor=Exception.class)
	public int updatePatients(Patients patients){
		return patientsMapper.updatePatients(patients);
	}
	@Transactional(propagation=Propagation.REQUIRED,isolation=Isolation.DEFAULT,rollbackFor=Exception.class)
	public int remove(Patients patients){
		return patientsMapper.deletePatients(patients);
	}
	
	public Patients findById(Integer id){
		return patientsMapper.findById(id);
	}
	
public List<Patients> findAll() {
		
		return patientsMapper.findAll();
		}
	// 判断密码
	public List<Patients> findPass(int pid ,String pwd){
		return patientsMapper.findPass(pid, pwd);
	}
	// 修改密码
	public int updatepwd( Integer pid, String pwd){
		return patientsMapper.updatepwd(pid, pwd);
	}
	
	
	public List<Patients> findCard(String cart){
		
		return patientsMapper.findCard(cart);
	}
	public List<Patients> findPhone(String phone){
		return patientsMapper.findPhone(phone);
	}
	
	public Patients findByPwd( Integer pid,String pwd){
		return patientsMapper.findByPwd(pid, pwd);
		
	}
	
	
	
	public Patients findByName(String temp,String pwd){
		return patientsMapper.findByName(temp, pwd);
	}
	public Pager<Patients> findByPage(String pname,Integer pageNo,Integer pageSize){
	Pager<Patients> pager=new Pager<Patients>();
	pager.setRows(patientsMapper.findByPage(pname, pageNo, pageSize));
		pager.setTotal(patientsMapper.getTotal(pname));
		return pager;
	}
}
