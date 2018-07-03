package com.geopia.wallet_ncoin.dto;

import lombok.Data;

import java.util.Date;
import java.util.Set;

@Data
public class NcoinCustomerDto {
	int idx;
	String id;
	String password;
	String country;
	String phone;
	String ncoin_address;
	String reg_date;
	String update_date;
	int enabled;
	String otp;

	
/*	public int getEnabled() {
		return enabled;
	}
	public void setEnabled(int enabled) {
		this.enabled = enabled;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public Date getUpdate_date() {
		return update_date;
	}
	public void setUpdate_date(Date update_date) {
		this.update_date = update_date;
	}
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
	}*/
}
