package com.hos.bean;

import java.util.HashSet;
import java.util.Set;

/**
 * Registration entity. @author MyEclipse Persistence Tools
 */

public class Registration implements java.io.Serializable {

	// Fields

	private static final long serialVersionUID = 1L;
	private Integer rid;
	private Integer cid;
	private Integer bid;
	private Integer snum;
	private Integer state;
	private String by1;
	private Integer by2;
private Cards cards;
private Bookable bookable;

	// Constructors

	/** default constructor */
	public Registration() {
	}




	/** full constructor */
	public Registration(Integer cid, Integer bid, Integer snum, Integer state, String by1, Integer by2) {
		this.cid = cid;
		this.bid = bid;
		this.snum = snum;
		this.state = state;
		this.by1 = by1;
		this.by2 = by2;
	}

	// Property accessors

	public Registration(Integer rid, Integer cid, Integer bid, Integer snum, Integer state, String by1, Integer by2,
			Cards cards, Bookable bookable) {
		super();
		this.rid = rid;
		this.cid = cid;
		this.bid = bid;
		this.snum = snum;
		this.state = state;
		this.by1 = by1;
		this.by2 = by2;
		this.cards = cards;
		this.bookable = bookable;
	}

	public Cards getCards() {
		return cards;
	}

	public void setCards(Cards cards) {
		this.cards = cards;
	}

	public Bookable getBookable() {
		return bookable;
	}

	public void setBookable(Bookable bookable) {
		this.bookable = bookable;
	}

	public Integer getRid() {
		return this.rid;
	}

	public void setRid(Integer rid) {
		this.rid = rid;
	}

	public Integer getCid() {
		return this.cid;
	}

	public void setCid(Integer cid) {
		this.cid = cid;
	}

	public Integer getBid() {
		return this.bid;
	}

	public void setBid(Integer bid) {
		this.bid = bid;
	}

	public Integer getSnum() {
		return this.snum;
	}

	public void setSnum(Integer snum) {
		this.snum = snum;
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

}