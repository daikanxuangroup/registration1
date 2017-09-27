package com.hos.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import com.hos.bean.Bookable;
import com.hos.bean.Doctors;
import com.hos.bean.Patients;
import com.hos.bean.Reservation;
import com.hos.bean.Tempsper;

@Repository("doctorsMapper")
public interface DoctorsMapper {

	/*
	 * jdbcType=DOUBLE
	 * jdbcType=VARCHAR
	 * jdbcType=DATE
	 * jdbcType=INTEGER
	 */
	@Delete("delete from doctors where doid=#{doid}")
	int deleteDoctors(Doctors doctors);
	
	int updateDoctors(Doctors doctors);
	@Select("select  p.doid,p.doname,p.title,p.photo,p.info,p.deid,p.monam,p.monpm,p.tueam,p.tuepm,p.wedam,p.wedpm,p.thuam,p.thupm,p.friam,p.fripm,p.satam,p.satpm,p.sunap,p.sumpm,p.pcreg,p.xcreg,p.doexist,p.bcost,p.by1,p.by2 from Doctors p")
	List<Doctors> findAllDoctors();
	@Select("select  p.doid,p.doname,p.title,p.photo,p.info,p.deid,p.monam,p.monpm,p.tueam,p.tuepm,p.wedam,p.wedpm,p.thuam,p.thupm,p.friam,p.fripm,p.satam,p.satpm,p.sunap,p.sumpm,p.pcreg,p.xcreg,p.doexist,p.bcost,p.by1,p.by2 from Doctors p where doid=#{doid}")
	List<Doctors> findByDeid(Integer doid);
	
	List<Doctors> findDocBk(Integer deid);
	
	List<Tempsper> findlist(@Param("lists") List<String> lists,@Param("deid")Integer deid);
	
	
	//根据 时间 医生id  上下午 拿出 排班bookable
	Bookable findble(@Param("doid") Integer doid,@Param("date") String date,@Param("starttime")Integer starttime);
	// 排班网上已预约人+1人
	@Update("update bookable set  ynum=ynum+1  where bid=#{bid}")
	int updateble(@Param("bid") Integer bid);
	// 添加网上预约信息
	@Insert(" insert into reservation(red,pid,bid,state) values(#{red},#{pid},#{bid},1)")
	@SelectKey(keyProperty="red",statement="select seq_reservation.nextval from dual",
	resultType=int.class,before=true)
	int insertres(@Param("pid") Integer pid,@Param("bid") Integer bid);
	//拿出 预约单
	@Select("select seq_reservation.currval from dual")
	int findres(); 
	
	List<Reservation> findRes(@Param("pid") Integer pid);
	
	@Update("update Patients set medcard=#{medcard,jdbcType=VARCHAR}  where pid=#{pid}")
	int updatePatients(@Param("pid") Integer pid,@Param("medcard")String medcard);
	
	@Update("update Patients set by1=#{by1}  where pid=#{pid}")
	int updatePatients2(@Param("pid") Integer pid,@Param("by1")String by1);
	
}
