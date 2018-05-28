package com.geopia.wallet_ncoin.dto;

public class NcoinCustomerDto {
	int idx;
	String id;
	String password;
	String country;
	String phone;
	String ncoin_address;
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getNcoin_address() {
		return ncoin_address;
	}
	public void setNcoin_address(String ncoin_address) {
		this.ncoin_address = ncoin_address;
	}
}
