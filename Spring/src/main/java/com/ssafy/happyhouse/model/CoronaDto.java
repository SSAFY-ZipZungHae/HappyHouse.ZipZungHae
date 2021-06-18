package com.ssafy.happyhouse.model;

public class CoronaDto {
	
	private int clinicID;
	private String sido;
	private String gungu;
	private String hospitalName;
	private String address;
	private String weekDayOp;
	private String satOp;
	private String sunOp;
	private String tel;
	public int getClinicID() {
		return clinicID;
	}
	public void setClinicID(int clinicID) {
		this.clinicID = clinicID;
	}
	public String getSido() {
		return sido;
	}
	public void setSido(String sido) {
		this.sido = sido;
	}
	public String getGungu() {
		return gungu;
	}
	public void setGungu(String gugun) {
		this.gungu = gugun;
	}
	public String getHospitalName() {
		return hospitalName;
	}
	public void setHospitalName(String hospitalName) {
		this.hospitalName = hospitalName;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getWeekDayOp() {
		return weekDayOp;
	}
	public void setWeekDayOp(String weekDayOp) {
		this.weekDayOp = weekDayOp;
	}
	public String getSatOp() {
		return satOp;
	}
	public void setSatOp(String satOp) {
		this.satOp = satOp;
	}
	public String getSunOp() {
		return sunOp;
	}
	public void setSunOp(String sunOp) {
		this.sunOp = sunOp;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	
	public CoronaDto() {
		
	}
	
	public CoronaDto(int clinicID, String sido, String gungu, String hospitalName, String address, String weekDayOp,
			String satOp, String sunOp, String tel) {
		super();
		this.clinicID = clinicID;
		this.sido = sido;
		this.gungu = gungu;
		this.hospitalName = hospitalName;
		this.address = address;
		this.weekDayOp = weekDayOp;
		this.satOp = satOp;
		this.sunOp = sunOp;
		this.tel = tel;
	}
	@Override
	public String toString() {
		return "CoronaDto [clinicID=" + clinicID + ", sido=" + sido + ", gungu=" + gungu + ", hospitalName="
				+ hospitalName + ", address=" + address + ", weekDayOp=" + weekDayOp + ", satOp=" + satOp + ", sunOp="
				+ sunOp + ", tel=" + tel + "]";
	}
	
	
	

}
