package com.hos.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.hos.bean.Bookable;
import com.hos.dao.BookableMapper;

@Service("bookableService")
@Transactional(propagation=Propagation.NOT_SUPPORTED,readOnly=true)
public class BookableService {
	@Resource(name="bookableMapper")
private BookableMapper bookableMapper;
	
	@Transactional(propagation=Propagation.REQUIRED,isolation=Isolation.DEFAULT,rollbackFor=Exception.class)
	public int addBookable(Bookable  bk){
		return bookableMapper.addBookable(bk);
	}
	@Transactional(propagation=Propagation.REQUIRED,isolation=Isolation.DEFAULT,rollbackFor=Exception.class)
	
	public int updateBookable(Bookable bk){
		return bookableMapper.updateBookable(bk);
	}
	@Transactional(propagation=Propagation.REQUIRED,isolation=Isolation.DEFAULT,rollbackFor=Exception.class)
	
	public int deleteBookable(Bookable bk){
		return bookableMapper.deleteBookable(bk);
	}
	public List<Bookable> findAll(){
		return bookableMapper.findAll();
	}
	public List<Bookable> findDate(Integer doid){
		return bookableMapper.findDate(doid);
	}
	public List<Bookable> findUsed(){
		return bookableMapper.findUsed();
	}
}
