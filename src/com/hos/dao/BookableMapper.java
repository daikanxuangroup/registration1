package com.hos.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import com.hos.bean.Bookable;
import com.hos.util.WorkBean;

@Repository("bookableMapper")
public interface BookableMapper {
	/*
	 * jdbcType=DOUBLE
	 * jdbcType=VARCHAR
	 * jdbcType=DATE
	 * jdbcType=INTEGER
	 */
	@Insert("insert into Bookable(bid,doid,bdate,starttime,used,bnum,ynum,xcum,xcyum,by1,by2) "
			+ "values(#{bid},#{doid},#{bdate},#{starttime},#{used},#{bnum},#{ynum},#{xcum},#{xcyum},#{by1,jdbcType=VARCHAR},#{by2,jdbcType=INTEGER})")
	@SelectKey(keyProperty="bid",statement="select seq_Bookable.nextval from dual",resultType=int.class,before=true)
	int addBookable(Bookable  bk);
	@Update("update Bookable set doid=#{doid},bdate=#{bdate},starttime=#{starttime},used=#{used},bnum=#{bnum},ynum=#{ynum},xcum=#{xcum},xcyum=#{xcyum},by1=#{by1,jdbcType=VARCHAR},by2=#{by2,jdbcType=INTEGER} where bid=#{bid}")
	int updateBookable(Bookable bk);
	@Delete("delete from Bookable where bid=#{bid}")
	int deleteBookable(Bookable bk);
		@Select("select bid,doid,bdate,starttime,used,bnum,ynum,xcum,xcyum,by1,by2 from Bookable")
	List<Bookable> findAll();
		@Select("select bid,doid,bdate,starttime,used,bnum,ynum,xcum,xcyum,by1,by2 from Bookable where doid=#{doid}")
	List<Bookable> findDate(Integer doid);
		@Select("select bid,doid,bdate,starttime,used,bnum,ynum,xcum,xcyum,by1,by2 from Bookable where used=1")
		List<Bookable> findUsed();
	
	List<Bookable> findTime(Date date ,Integer doid,Integer wk);

	Bookable findById(long id);
	
	List<Bookable> findSize(Integer doid);
	
	int getCount(List<String> list, Integer deid);
	List<WorkBean> findBookable(Integer pageNo,Integer pageSize,String sort,String order,List<String> list,Integer deid); 

	
}
