package com.ssafy.happyhouse.model;
//상권정보
public class CommerceDto {
	private String name;
	private String categoryLarge;
	private String categoryMiddle;
	private String categorySmall;
	private String city;
	private String gu;
	private String dong;
	private String lat;
	private String lng;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCategoryLarge() {
		return categoryLarge;
	}
	public void setCategoryLarge(String categoryLarge) {
		this.categoryLarge = categoryLarge;
	}
	public String getCategoryMiddle() {
		return categoryMiddle;
	}
	public void setCategoryMiddle(String categoryMiddle) {
		this.categoryMiddle = categoryMiddle;
	}
	public String getCategorySmall() {
		return categorySmall;
	}
	public void setCategorySmall(String categorySmall) {
		this.categorySmall = categorySmall;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getGu() {
		return gu;
	}
	public void setGu(String gu) {
		this.gu = gu;
	}
	public String getDong() {
		return dong;
	}
	public void setDong(String dong) {
		this.dong = dong;
	}
	public String getLat() {
		return lat;
	}
	public void setLat(String lat) {
		this.lat = lat;
	}
	public String getLng() {
		return lng;
	}
	public void setLng(String lng) {
		this.lng = lng;
	}
	public CommerceDto() {
		// TODO Auto-generated constructor stub
	}
	public CommerceDto(String name, String categoryLarge, String categoryMiddle, String categorySmall, String city,
			String gu, String dong, String lat, String lng) {
		super();
		this.name = name;
		this.categoryLarge = categoryLarge;
		this.categoryMiddle = categoryMiddle;
		this.categorySmall = categorySmall;
		this.city = city;
		this.gu = gu;
		this.dong = dong;
		this.lat = lat;
		this.lng = lng;
	}
	@Override
	public String toString() {
		return "CommerceDto [name=" + name + ", categoryLarge=" + categoryLarge + ", categoryMiddle=" + categoryMiddle
				+ ", categorySmall=" + categorySmall + ", city=" + city + ", gu=" + gu + ", dong=" + dong + ", lat="
				+ lat + ", lng=" + lng + "]";
	}
	
	
}
