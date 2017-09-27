package com.hos.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import com.hos.bean.Departs;
import com.hos.bean.Doctors;

@Repository
public interface DepartsMapper {
	/*
	 * jdbcType=DOUBLE
	 * jdbcType=VARCHAR
	 * jdbcType=DATE
	 * jdbcType=INTEGER
	 */
	@Insert("insert into departs(deid,dename,intro,deexist,by1,by2)"
			+ "values(#{deid,jdbcType=INTEGER},#{dename,jdbcType=VARCHAR},#{intro,jdbcType=VARCHAR},#{deexist,jdbcType=INTEGER},#{by1,jdbcType=VARCHAR},#{by2,jdbcType=INTEGER})")
	@SelectKey(keyProperty="deid",statement="select seq_departs.nextval from dual",resultType=int.class,before=true)
	int addDeparts(Departs departs);
	@Delete("delete from departs where deid=#{deid} ")
	int deleteDeparts(Departs departs);
	@Update("update departs set dename=#{dename,jdbcType=VARCHAR},intro=#{intro,jdbcType=VARCHAR},deexist=#{deexist,jdbcType=INTEGER},by1=#{by1,jdbcType=VARCHAR},by2=#{by2,jdbcType=INTEGER} where deid=#{deid} ")
	int updateDeparts(Departs departs);
	
	@Select("select deid,dename,intro,deexist,by1,by2 from departs")
	List<Departs> findAll();
	@Select("Select p.doid,p.doname,p.title,p.photo,p.info,p.deid,p.monam,p.monpm,p.tueam,p.tuepm,p.wedam,p.wedpm,p.thuam,p.thupm,p.friam,p.fripm,p.satam,p.satpm,p.sunap,p.sumpm,p.pcreg,p.xcreg,p.doexist,p.bcost,p.by1,p.by2 from departs d JOIN doctors p ON d.deid=p.deid where d.deid=#{deid}")
	List<Doctors> findDepartsDoctors(@Param("deid") Integer deid);
	@Select("select deid,dename,intro,deexist,by1,by2 from departs where deid=#{deid}")
	Departs findByDeid(@Param("deid") Integer deid);
	@Select("select deid,dename,intro,deexist,by1,by2 from Departs where deexist = 1")
	List<Departs> findAll2();
	@Select("select  p.doid,p.doname,p.title,p.photo,p.info,p.deid,p.monam,p.monpm,p.tueam,p.tuepm,p.wedam,p.wedpm,p.thuam,p.thupm,p.friam,p.fripm,p.satam,p.satpm,p.sunap,p.sumpm,p.pcreg,p.xcreg,p.doexist,p.bcost,p.by1,p.by2 from Doctors p where doid=#{doid}")
	Doctors findDocById(Integer doid);
}
