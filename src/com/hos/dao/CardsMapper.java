package com.hos.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import com.hos.bean.Cards;

@Repository("cardsMapper")
public interface CardsMapper {
	/*
	 * jdbcType=DOUBLE
	 * jdbcType=VARCHAR
	 * jdbcType=DATE
	 * jdbcType=INTEGER
	 */
	@Insert("insert into cards (cid,pname,sex,phone,idcard,pwd,ramaining,doexist,by1,by2)"
			+ "values(#{cid},#{pname,jdbcType=VARCHAR},#{sex,jdbcType=VARCHAR},#{phone,jdbcType=VARCHAR},#{idcard,jdbcType=VARCHAR},#{pwd,jdbcType=VARCHAR},#{ramaining,jdbcType=DOUBLE},#{doexist,jdbcType=INTEGER},#{by1,jdbcType=VARCHAR},#{by2,jdbcType=INTEGER})")
	@SelectKey(keyProperty="cid",statement="select seq_cards.nextval from dual",resultType=int.class,before=true)
	int addCards(Cards cards);

	@Delete("delete from Cards where cid=#{cid}")
	int deleteCards(Cards cards);
	@Update("update Cards set  pname=#{pname,jdbcType=VARCHAR},sex=#{sex,jdbcType=VARCHAR},phone=#{phone,jdbcType=VARCHAR},idcard=#{idcard,jdbcType=VARCHAR},pwd=#{pwd,jdbcType=VARCHAR},ramaining=#{ramaining,jdbcType=DOUBLE},doexist=#{doexist,jdbcType=INTEGER},by1=#{by1,jdbcType=VARCHAR},by2=#{by2,jdbcType=INTEGER} where cid=#{cid} ")
	int updateCards(Cards cards);
	
		
	@Select("select cid,pname,sex,phone,idcard,pwd,ramaining,doexist,by1,by2 from Cards")
	List<Cards> findAll();
	@Select("select cid,pname,sex,phone,idcard,pwd,ramaining,doexist,by1,by2 from cards where cid=#{cid}")
	Cards findByCid(Integer cid);
}
