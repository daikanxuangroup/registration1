package com.hos.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.hos.bean.Cards;
import com.hos.dao.CardsMapper;

@Service("cardsService")
@Transactional(readOnly=true,propagation=Propagation.NOT_SUPPORTED)
public class CardsService {
	@Resource(name="cardsMapper")
private CardsMapper cardsMapper;

	@Transactional(propagation=Propagation.REQUIRED,isolation=Isolation.DEFAULT,rollbackFor=Exception.class)
	public int addCards(Cards cards){
		return cardsMapper.addCards(cards);
	}
	@Transactional(propagation=Propagation.REQUIRED,isolation=Isolation.DEFAULT,rollbackFor=Exception.class)
	public int deleteCards(Cards cards){
		return  cardsMapper.deleteCards(cards);
	}
	@Transactional(propagation=Propagation.REQUIRED,isolation=Isolation.DEFAULT,rollbackFor=Exception.class)
	public int updateCards(Cards cards){
		return cardsMapper.updateCards(cards);
	}
public List<Cards> findAll(){
	return cardsMapper.findAll();
}
public Cards findByCid(Integer cid){
	return cardsMapper.findByCid(cid);
}

}
