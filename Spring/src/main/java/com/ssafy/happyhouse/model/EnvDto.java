package com.ssafy.happyhouse.model;
// 환경정보
public class EnvDto {
	private String name;
	private String type;
	private String address;
	private String lat;
	private String lng;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
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
	public EnvDto(String name, String type, String address, String lat, String lng) {
		super();
		this.name = name;
		this.type = type;
		this.address = address;
		this.lat = lat;
		this.lng = lng;
	}
	
	public EnvDto() {
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "EnvDto [name=" + name + ", type=" + type + ", address=" + address + ", lat=" + lat + ", lng=" + lng
				+ "]";
	}
	
	
	
}
