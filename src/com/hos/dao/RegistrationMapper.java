package com.hos.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import com.hos.bean.Registration;

@Repository("registrationMapper")
public interface RegistrationMapper {
	/*
	 * jdbcType=DOUBLE
	 * jdbcType=VARCHAR
	 * jdbcType=DATE
	 * jdbcType=INTEGER
	 */
@Insert("insert into registration(rid,cid,bid,snum,state,by1,by2)"
		+ "values(#{rid},#{cid},#{bid},#{snum},#{state},#{by1,jdbcType=VARCHAR},#{by2,jdbcType=INTEGER})")
@SelectKey(keyProperty="rid",statement="select seq_registration.nextval from dual",resultType=int.class,before=true)
	int addRegistration(Registration registration);
@Update("update registration set cid=#{cid},bid=#{bid},snum=#{snum},state=#{state},by1=#{by1,jdbcType=VARCHAR},by2=#{by2,jdbcType=INTEGER} where rid=#{rid}")
	int updateRegistration(Registration registration);
	@Delete("delete from registration where rid=#{rid} ")
	int deleteRegistration(Registration registration);
	@Select("select rid,cid,bid,snum,state,by1,by2 from registration where cid=#{cid}")
	List<Registration> findById(Integer cid);//诊疗卡ID 条件查询
	
	@Select("select rid,cid,bid,snum,state,by1,by2 from registration ")
	List<Registration> findAll();
	
}
