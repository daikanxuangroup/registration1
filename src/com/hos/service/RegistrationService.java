package com.hos.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.hos.bean.Registration;
import com.hos.dao.RegistrationMapper;

@Service("registrationService")
@Transactional(readOnly=true,propagation=Propagation.NOT_SUPPORTED)
public class RegistrationService {
	@Resource(name="registrationMapper")
private RegistrationMapper registrationMapper; 
@Transactional(propagation=Propagation.REQUIRED,isolation=Isolation.DEFAULT,rollbackFor=Exception.class)
public  int addRegistration(Registration registration){
	return registrationMapper.addRegistration(registration);
}
@Transactional(propagation=Propagation.REQUIRED,isolation=Isolation.DEFAULT,rollbackFor=Exception.class)
public  int updateRegistration(Registration registration){
	return registrationMapper.updateRegistration(registration);
}
@Transactional(propagation=Propagation.REQUIRED,isolation=Isolation.DEFAULT,rollbackFor=Exception.class)
public  int deleteRegistration(Registration registration){
	return registrationMapper.deleteRegistration(registration);
}

public  List<Registration> findById(Integer id){
	// 病人ID 条件查询
	return registrationMapper.findById(id);
}

public List<Registration> findAll(){
	return registrationMapper.findAll();
}
}
