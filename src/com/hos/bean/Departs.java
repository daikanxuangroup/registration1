package com.hos.bean;

import java.util.HashSet;
import java.util.Set;

/**
 * Departs entity. @author MyEclipse Persistence Tools
 */

public class Departs implements java.io.Serializable {

	// Fields

	private static final long serialVersionUID = 1L;
	private Integer deid;
	private String dename;
	private String intro;
	private Integer deexist;
	private String by1;
	private Integer by2;
	private Set<Doctors> doctorses = new HashSet<Doctors>();
	// Constructors

	/** default constructor */
	public Departs() {
	}

	

	/** minimal constructor */
	public Departs(String dename, Integer deexist) {
		this.dename = dename;
		this.deexist = deexist;
	}

	public Departs(Integer deid, String dename, String intro, Integer deexist, String by1, Integer by2, Set doctorses) {
		super();
		this.deid = deid;
		this.dename = dename;
		this.intro = intro;
		this.deexist = deexist;
		this.by1 = by1;
		this.by2 = by2;
		this.doctorses = doctorses;
	}

	

	
	/** full constructor */
	public Departs(String dename, String intro, Integer deexist, String by1, Integer by2) {
		this.dename = dename;
		this.intro = intro;
		this.deexist = deexist;
		this.by1 = by1;
		this.by2 = by2;
	}

	// Property accessors

	

	public Integer getDeid() {
		return this.deid;
	}

	public Set<Doctors> getDoctorses() {
		return doctorses;
	}



	public void setDoctorses(Set<Doctors> doctorses) {
		this.doctorses = doctorses;
	}



	public void setDeid(Integer deid) {
		this.deid = deid;
	}

	public String getDename() {
		return this.dename;
	}

	public void setDename(String dename) {
		this.dename = dename;
	}

	public String getIntro() {
		return this.intro;
	}

	public void setIntro(String intro) {
		this.intro = intro;
	}

	public Integer getDeexist() {
		return this.deexist;
	}

	public void setDeexist(Integer deexist) {
		this.deexist = deexist;
	}

	public String getBy1() {
		return this.by1;
	}

	public void setBy1(String by1) {
		this.by1 = by1;
	}

	public Integer getBy2() {
		return this.by2;
	}

	public void setBy2(Integer by2) {
		this.by2 = by2;
	}

}