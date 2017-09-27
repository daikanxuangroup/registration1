package com.hos.bean;

import java.util.HashSet;
import java.util.Set;

/**
 * Patients entity. @author MyEclipse Persistence Tools
 */

public class Patients implements java.io.Serializable {

	// Fields

	private static final long serialVersionUID = 1L;
	private Integer pid;
	private String pname;
	private String sex;
	private String phone;
	private String idcard;
	private String pwd;
	private String medcard;
	private String email;
	private String by1;
	private Integer by2;
	private Cards cards;

	
	private Set registrations = new HashSet(0);

	public Patients(Integer pid, String pname, String sex, String phone, String idcard, String pwd, String medcard,
			String email, String by1, Integer by2, Cards cards, Set registrations) {
		super();
		this.pid = pid;
		this.pname = pname;
		this.sex = sex;
		this.phone = phone;
		this.idcard = idcard;
		this.pwd = pwd;
		this.medcard = medcard;
		this.email = email;
		this.by1 = by1;
		this.by2 = by2;
		this.cards = cards;
	
		this.registrations = registrations;
	}

	public Integer getPid() {
		return pid;
	}

	public void setPid(Integer pid) {
		this.pid = pid;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getIdcard() {
		return idcard;
	}

	public void setIdcard(String idcard) {
		this.idcard = idcard;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getMedcard() {
		return medcard;
	}

	public void setMedcard(String medcard) {
		this.medcard = medcard;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getBy1() {
		return by1;
	}

	public void setBy1(String by1) {
		this.by1 = by1;
	}

	public Integer getBy2() {
		return by2;
	}

	public void setBy2(Integer by2) {
		this.by2 = by2;
	}

	public Cards getCards() {
		return cards;
	}

	public void setCards(Cards cards) {
		this.cards = cards;
	}
	public Set getRegistrations() {
		return registrations;
	}

	public void setRegistrations(Set registrations) {
		this.registrations = registrations;
	}

	public Patients() {
		super();
		// TODO Auto-generated constructor stub
	}


}