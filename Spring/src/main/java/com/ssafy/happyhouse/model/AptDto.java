package com.ssafy.happyhouse.model;

import java.util.List;
import java.util.Map;

public class AptDto {
	
	String APT_DEAL;// 아파트 매매가
	String APT_RENT;// 아파트 전세
	String HOUSE_DEAL; // 연립주택 전세 
	String HOUSE_RENT;// 연립주택 전세
	
	//시, 군 , 구 추가 하기
	int no;
	String city;// 시
	String gugun; // 군구
	String dong;// 동
	
	String AptName;
	int code;
	String dealAmount; // 거래량..?
	String buildYear; // 건축년도
	String dealYear;// 거래 년도
	String dealMonth; // 거래 월
	String dealDay;// 거래 일
	double area;// 면적
	int floor;// 층
	
	double lat;// 위도
	double lng;// 경도
	
	String jibun; // 지번
	String type;
	String rentMoney;
	String img;
	
	public AptDto() {}

	public String getAPT_DEAL() {
		return APT_DEAL;
	}

	public void setAPT_DEAL(String aPT_DEAL) {
		APT_DEAL = aPT_DEAL;
	}

	public String getAPT_RENT() {
		return APT_RENT;
	}

	public void setAPT_RENT(String aPT_RENT) {
		APT_RENT = aPT_RENT;
	}

	public String getHOUSE_DEAL() {
		return HOUSE_DEAL;
	}

	public void setHOUSE_DEAL(String hOUSE_DEAL) {
		HOUSE_DEAL = hOUSE_DEAL;
	}

	public String getHOUSE_RENT() {
		return HOUSE_RENT;
	}

	public void setHOUSE_RENT(String hOUSE_RENT) {
		HOUSE_RENT = hOUSE_RENT;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getGugun() {
		return gugun;
	}

	public void setGugun(String gugun) {
		this.gugun = gugun;
	}

	public String getDong() {
		return dong;
	}

	public void setDong(String dong) {
		this.dong = dong;
	}

	public String getAptName() {
		return AptName;
	}

	public void setAptName(String aptName) {
		this.AptName = aptName;
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getDealAmount() {
		return dealAmount;
	}

	public void setDealAmount(String dealAmount) {
		this.dealAmount = dealAmount;
	}

	public String getBuildYear() {
		return buildYear;
	}

	public void setBuildYear(String buildYear) {
		this.buildYear = buildYear;
	}

	public String getDealYear() {
		return dealYear;
	}

	public void setDealYear(String dealYear) {
		this.dealYear = dealYear;
	}

	public String getDealMonth() {
		return dealMonth;
	}

	public void setDealMonth(String dealMonth) {
		this.dealMonth = dealMonth;
	}

	public String getDealDay() {
		return dealDay;
	}

	public void setDealDay(String dealDay) {
		this.dealDay = dealDay;
	}

	public double getArea() {
		return area;
	}

	public void setArea(double area) {
		this.area = area;
	}

	public int getFloor() {
		return floor;
	}

	public void setFloor(int floor) {
		this.floor = floor;
	}

	public double getLat() {
		return lat;
	}

	public void setLat(double lat) {
		this.lat = lat;
	}

	public double getLng() {
		return lng;
	}

	public void setLng(double lng) {
		this.lng = lng;
	}

	public String getJibun() {
		return jibun;
	}

	public void setJibun(String jibun) {
		this.jibun = jibun;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getRentMoney() {
		return rentMoney;
	}

	public void setRentMoney(String rentMoney) {
		this.rentMoney = rentMoney;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public AptDto(String aPT_DEAL, String aPT_RENT, String hOUSE_DEAL, String hOUSE_RENT, int no, String city,
			String gugun, String dong, String aptName, int code, String dealAmount, String buildYear, String dealYear,
			String dealMonth, String dealDay, double area, int floor, double lat, double lng, String jibun, String type,
			String rentMoney, String img) {
		super();
		APT_DEAL = aPT_DEAL;
		APT_RENT = aPT_RENT;
		HOUSE_DEAL = hOUSE_DEAL;
		HOUSE_RENT = hOUSE_RENT;
		this.no = no;
		this.city = city;
		this.gugun = gugun;
		this.dong = dong;
		this.AptName = aptName;
		this.code = code;
		this.dealAmount = dealAmount;
		this.buildYear = buildYear;
		this.dealYear = dealYear;
		this.dealMonth = dealMonth;
		this.dealDay = dealDay;
		this.area = area;
		this.floor = floor;
		this.lat = lat;
		this.lng = lng;
		this.jibun = jibun;
		this.type = type;
		this.rentMoney = rentMoney;
		this.img = img;
	}
	public AptDto( String dong, String aptName,  String dealAmount, String buildYear, String dealYear,
			String dealMonth, String dealDay, double area, int floor) {
		super();
		
	
		this.dong = dong;
		this.AptName = aptName;
	
		this.dealAmount = dealAmount;
		this.buildYear = buildYear;
		this.dealYear = dealYear;
		this.dealMonth = dealMonth;
		this.dealDay = dealDay;
		this.area = area;
		this.floor = floor;
	}

	@Override
	public String toString() {
		return "AptDto [APT_DEAL=" + APT_DEAL + ", APT_RENT=" + APT_RENT + ", HOUSE_DEAL=" + HOUSE_DEAL
				+ ", HOUSE_RENT=" + HOUSE_RENT + ", no=" + no + ", city=" + city + ", gugun=" + gugun + ", dong=" + dong
				+ ", AptName=" + AptName + ", code=" + code + ", dealAmount=" + dealAmount + ", buildYear=" + buildYear
				+ ", dealYear=" + dealYear + ", dealMonth=" + dealMonth + ", dealDay=" + dealDay + ", area=" + area
				+ ", floor=" + floor + ", lat=" + lat + ", lng=" + lng + ", jibun=" + jibun + ", type=" + type
				+ ", rentMoney=" + rentMoney + ", img=" + img + "]";
	}




	

}
