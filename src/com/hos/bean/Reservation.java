package com.hos.bean;

/**
 * Reservation entity. @author MyEclipse Persistence Tools
 */

public class Reservation implements java.io.Serializable {

	// Fields

	private static final long serialVersionUID = 1L;
	private Integer red;
	private Integer pid;
	private Integer bid;
	private Integer state;
	private String by1;
	private Integer by2;
	private Patients patients;
	private Bookable bookable;
	// Constructors

	/** default constructor */
	public Reservation() {
	}

	/** full constructor */
	public Reservation(Integer pid, Integer bid, Integer state, String by1, Integer by2) {
		this.pid = pid;
		this.bid = bid;
		this.state = state;
		this.by1 = by1;
		this.by2 = by2;
	}

	// Property accessors

	public Reservation(Integer red, Integer pid, Integer bid, Integer state, String by1, Integer by2, Patients patients,
			Bookable bookable) {
		super();
		this.red = red;
		this.pid = pid;
		this.bid = bid;
		this.state = state;
		this.by1 = by1;
		this.by2 = by2;
		this.patients = patients;
		this.bookable = bookable;
	}

	public Integer getRed() {
		return this.red;
	}

	public void setRed(Integer red) {
		this.red = red;
	}

	public Integer getPid() {
		return this.pid;
	}

	public void setPid(Integer pid) {
		this.pid = pid;
	}

	public Integer getBid() {
		return this.bid;
	}

	public void setBid(Integer bid) {
		this.bid = bid;
	}

	public Integer getState() {
		return this.state;
	}

	public void setState(Integer state) {
		this.state = state;
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

	public Patients getPatients() {
		return patients;
	}

	public void setPatients(Patients patients) {
		this.patients = patients;
	}

	public Bookable getBookable() {
		return bookable;
	}

	public void setBookable(Bookable bookable) {
		this.bookable = bookable;
	}

}