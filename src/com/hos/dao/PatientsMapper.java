package com.hos.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import com.hos.bean.Patients;

@Repository("patientsMapper")
public interface PatientsMapper {
	/*
	 * jdbcType=DOUBLE
	 * jdbcType=VARCHAR
	 * jdbcType=DATE
	 * jdbcType=INTEGER
	 */
@Insert("insert into Patients(pid,pname,sex,phone,idcard,pwd,medcard,email,by1,by2)"
		+ "values(#{pid,},#{pname,jdbcType=VARCHAR},#{sex,jdbcType=VARCHAR},#{phone,jdbcType=VARCHAR},#{idcard,jdbcType=VARCHAR},#{pwd,jdbcType=VARCHAR},#{medcard,jdbcType=VARCHAR},#{email,jdbcType=VARCHAR},#{by1,jdbcType=VARCHAR},#{by2,jdbcType=INTEGER})")
@SelectKey(keyProperty="pid",statement="select seq_patients.nextval from dual",resultType=int.class,before=true)
int addPatients(Patients  patients);
	@Update("update Patients set pname=#{pname,jdbcType=VARCHAR},sex=#{sex,jdbcType=VARCHAR},phone=#{phone,jdbcType=VARCHAR},idcard=#{idcard,jdbcType=VARCHAR},pwd=#{pwd,jdbcType=VARCHAR},medcard=#{medcard,jdbcType=VARCHAR},email=#{email,jdbcType=VARCHAR},by1=#{by1,jdbcType=VARCHAR},by2=#{by2,jdbcType=INTEGER} where pid=#{pid}")
	int updatePatients(Patients patients);
	@Delete("delete from Patients where pid=#{pid}")
	int deletePatients(Patients patients);
	
	@Select("select pid,pname,sex,phone,idcard,pwd,medcard,email,by1,by2 from Patients where pid=#{pid}")
	Patients findById(int id);
	
	@Select("select pid,pname,sex,phone,idcard,pwd,medcard,email,by1,by2 from Patients ")
	List<Patients> findAll();
	
	@Select("select pid,pname,sex,phone,idcard,pwd,medcard,email,by1,by2 from Patients where  pid = #{pid} and pwd = #{pwd} ")
	List<Patients> findPass(@Param("pid") int pid ,@Param("pwd") String pwd);
	
	
	@Select("select pid,pname,sex,phone,idcard,pwd,medcard,email,by1,by2 from Patients where idcard=#{cart}")
	List<Patients> findCard(@Param("cart") String cart);
	 @Select("select pid,pname,sex,phone,idcard,pwd,medcard,email,by1,by2 from Patients where phone = #{phone}")
	List<Patients> findPhone(@Param("phone") String phone);
	
	@Select("select  pid,pname,sex,phone,idcard,pwd,medcard,email,by1,by2 from Patients where pname=#{temp} and pwd=#{pwd} or phone=#{temp} and pwd=#{pwd} or idcard=#{temp} and pwd=#{pwd} or email=#{temp} and pwd=#{pwd}")
	Patients findByName(@Param("temp") String temp,@Param("pwd") String pwd);
	
	@Select("select  pid,pname,sex,phone,idcard,pwd,medcard,email,by1,by2 from Patients where pid=#{pid} and pwd=#{pwd} ")
	Patients findByPwd(@Param("pid") Integer pid,@Param("pwd") String pwd);
	
	
	List<Patients> findByPage(@Param("pname") String pname,@Param("pageNo") Integer pageNo,@Param("pageSize") Integer pageSize);
	 int getTotal(@Param("pname") String pname);
	 
	 @Update("update Patients set pwd=#{pwd} where pid=#{pid}")
	 int updatepwd(@Param("pid") Integer pid,@Param("pwd") String pwd);
}
