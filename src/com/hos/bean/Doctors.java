package com.hos.bean;

/**
 * Doctors entity. @author MyEclipse Persistence Tools
 */

public class Doctors implements java.io.Serializable {

	
	private static final long serialVersionUID = 1L;
	private Integer doid;
	private String doname;
	private String title;
	private String photo;
	private String info;
	private Integer deid;
	private Integer monam;
	private Integer monpm;
	private Integer tueam;
	private Integer tuepm;
	private Integer wedam;
	private Integer wedpm;
	private Integer thuam;
	private Integer thupm;
	private Integer friam;
	private Integer fripm;
	private Integer satam;
	private Integer satpm;
	private Integer sunap;
	private Integer sumpm;
	private Integer pcreg;
	private Integer xcreg;
	private Integer doexist;
	private Double bcost;
	private String by1;
	private Integer by2;
private Departs departs;
	// Constructors

	/** default constructor */
	public Doctors() {
	}

	public Doctors(Integer doid, String doname, String title, String photo, String info, Integer deid, Integer monam,
			Integer monpm, Integer tueam, Integer tuepm, Integer wedam, Integer wedpm, Integer thuam, Integer thupm,
			Integer friam, Integer fripm, Integer satam, Integer satpm, Integer sunap, Integer sumpm, Integer pcreg,
			Integer xcreg, Integer doexist, Double bcost, String by1, Integer by2, Departs departs) {
		super();
		this.doid = doid;
		this.doname = doname;
		this.title = title;
		this.photo = photo;
		this.info = info;
		this.deid = deid;
		this.monam = monam;
		this.monpm = monpm;
		this.tueam = tueam;
		this.tuepm = tuepm;
		this.wedam = wedam;
		this.wedpm = wedpm;
		this.thuam = thuam;
		this.thupm = thupm;
		this.friam = friam;
		this.fripm = fripm;
		this.satam = satam;
		this.satpm = satpm;
		this.sunap = sunap;
		this.sumpm = sumpm;
		this.pcreg = pcreg;
		this.xcreg = xcreg;
		this.doexist = doexist;
		this.bcost = bcost;
		this.by1 = by1;
		this.by2 = by2;
		this.departs = departs;
	}

	public Departs getDeparts() {
		return departs;
	}

	public void setDeparts(Departs departs) {
		this.departs = departs;
	}

	/** minimal constructor */
	public Doctors(String doname, String title, Integer doexist, Double bcost) {
		this.doname = doname;
		this.title = title;
		this.doexist = doexist;
		this.bcost = bcost;
	}

	/** full constructor */
	public Doctors(String doname, String title, String photo, String info, Integer deid, Integer monam, Integer monpm,
			Integer tueam, Integer tuepm, Integer wedam, Integer wedpm, Integer thuam, Integer thupm, Integer friam,
			Integer fripm, Integer satam, Integer satpm, Integer sunap, Integer sumpm, Integer pcreg, Integer xcreg,
			Integer doexist, Double bcost, String by1, Integer by2) {
		this.doname = doname;
		this.title = title;
		this.photo = photo;
		this.info = info;
		this.deid = deid;
		this.monam = monam;
		this.monpm = monpm;
		this.tueam = tueam;
		this.tuepm = tuepm;
		this.wedam = wedam;
		this.wedpm = wedpm;
		this.thuam = thuam;
		this.thupm = thupm;
		this.friam = friam;
		this.fripm = fripm;
		this.satam = satam;
		this.satpm = satpm;
		this.sunap = sunap;
		this.sumpm = sumpm;
		this.pcreg = pcreg;
		this.xcreg = xcreg;
		this.doexist = doexist;
		this.bcost = bcost;
		this.by1 = by1;
		this.by2 = by2;
	}

	// Property accessors

	public Integer getDoid() {
		return this.doid;
	}

	public void setDoid(Integer doid) {
		this.doid = doid;
	}

	public String getDoname() {
		return this.doname;
	}

	public void setDoname(String doname) {
		this.doname = doname;
	}

	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getPhoto() {
		return this.photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public String getInfo() {
		return this.info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public Integer getDeid() {
		return this.deid;
	}

	public void setDeid(Integer deid) {
		this.deid = deid;
	}

	public Integer getMonam() {
		return this.monam;
	}

	public void setMonam(Integer monam) {
		this.monam = monam;
	}

	public Integer getMonpm() {
		return this.monpm;
	}

	public void setMonpm(Integer monpm) {
		this.monpm = monpm;
	}

	public Integer getTueam() {
		return this.tueam;
	}

	public void setTueam(Integer tueam) {
		this.tueam = tueam;
	}

	public Integer getTuepm() {
		return this.tuepm;
	}

	public void setTuepm(Integer tuepm) {
		this.tuepm = tuepm;
	}

	public Integer getWedam() {
		return this.wedam;
	}

	public void setWedam(Integer wedam) {
		this.wedam = wedam;
	}

	public Integer getWedpm() {
		return this.wedpm;
	}

	public void setWedpm(Integer wedpm) {
		this.wedpm = wedpm;
	}

	public Integer getThuam() {
		return this.thuam;
	}

	public void setThuam(Integer thuam) {
		this.thuam = thuam;
	}

	public Integer getThupm() {
		return this.thupm;
	}

	public void setThupm(Integer thupm) {
		this.thupm = thupm;
	}

	public Integer getFriam() {
		return this.friam;
	}

	public void setFriam(Integer friam) {
		this.friam = friam;
	}

	public Integer getFripm() {
		return this.fripm;
	}

	public void setFripm(Integer fripm) {
		this.fripm = fripm;
	}

	public Integer getSatam() {
		return this.satam;
	}

	public void setSatam(Integer satam) {
		this.satam = satam;
	}

	public Integer getSatpm() {
		return this.satpm;
	}

	public void setSatpm(Integer satpm) {
		this.satpm = satpm;
	}

	public Integer getSunap() {
		return this.sunap;
	}

	public void setSunap(Integer sunap) {
		this.sunap = sunap;
	}

	public Integer getSumpm() {
		return this.sumpm;
	}

	public void setSumpm(Integer sumpm) {
		this.sumpm = sumpm;
	}

	public Integer getPcreg() {
		return this.pcreg;
	}

	public void setPcreg(Integer pcreg) {
		this.pcreg = pcreg;
	}

	public Integer getXcreg() {
		return this.xcreg;
	}

	public void setXcreg(Integer xcreg) {
		this.xcreg = xcreg;
	}

	public Integer getDoexist() {
		return this.doexist;
	}

	public void setDoexist(Integer doexist) {
		this.doexist = doexist;
	}

	public Double getBcost() {
		return this.bcost;
	}

	public void setBcost(Double bcost) {
		this.bcost = bcost;
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

	@Override
	public String toString() {
		return "Doctors [doid=" + doid + ", doname=" + doname + ", title=" + title + ", photo=" + photo + ", info="
				+ info + ", deid=" + deid + ", monam=" + monam + ", monpm=" + monpm + ", tueam=" + tueam + ", tuepm="
				+ tuepm + ", wedam=" + wedam + ", wedpm=" + wedpm + ", thuam=" + thuam + ", thupm=" + thupm + ", friam="
				+ friam + ", fripm=" + fripm + ", satam=" + satam + ", satpm=" + satpm + ", sunap=" + sunap + ", sumpm="
				+ sumpm + ", pcreg=" + pcreg + ", xcreg=" + xcreg + ", doexist=" + doexist + ", bcost=" + bcost
				+ ", by1=" + by1 + ", by2=" + by2 + ", departs=" + departs + "]";
	}

}