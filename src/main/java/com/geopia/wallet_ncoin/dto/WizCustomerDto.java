package com.geopia.wallet_ncoin.dto;

import java.util.Date;

public class WizCustomerDto {
	
	private int wiz_customer_seq;
	private String email;
	private String name;
	private String address;
	private String phone;
	private String password;
	private String country;
	private String withdraw_number;
	private String withdraw_bank_name;
	private Date reg_date;
	private Date update_date;
	private String raw_hash;
	private java.math.BigDecimal bank_point;
	private java.math.BigDecimal bitcoin_point;
	private java.math.BigDecimal ether_point;
	private java.math.BigDecimal acoin_point;
	private int is_mobile;
	public int getWiz_customer_seq() {
		return wiz_customer_seq;
	}
	public void setWiz_customer_seq(int wiz_customer_seq) {
		this.wiz_customer_seq = wiz_customer_seq;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
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
	public String getWithdraw_number() {
		return withdraw_number;
	}
	public void setWithdraw_number(String withdraw_number) {
		this.withdraw_number = withdraw_number;
	}
	public String getWithdraw_bank_name() {
		return withdraw_bank_name;
	}
	public void setWithdraw_bank_name(String withdraw_bank_name) {
		this.withdraw_bank_name = withdraw_bank_name;
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
	public String getRaw_hash() {
		return raw_hash;
	}
	public void setRaw_hash(String raw_hash) {
		this.raw_hash = raw_hash;
	}
	public java.math.BigDecimal getBank_point() {
		return bank_point;
	}
	public void setBank_point(java.math.BigDecimal bank_point) {
		this.bank_point = bank_point;
	}
	public java.math.BigDecimal getBitcoin_point() {
		return bitcoin_point;
	}
	public void setBitcoin_point(java.math.BigDecimal bitcoin_point) {
		this.bitcoin_point = bitcoin_point;
	}
	public java.math.BigDecimal getEther_point() {
		return ether_point;
	}
	public void setEther_point(java.math.BigDecimal ether_point) {
		this.ether_point = ether_point;
	}
	public java.math.BigDecimal getAcoin_point() {
		return acoin_point;
	}
	public void setAcoin_point(java.math.BigDecimal acoin_point) {
		this.acoin_point = acoin_point;
	}
	public int getIs_mobile() {
		return is_mobile;
	}
	public void setIs_mobile(int is_mobile) {
		this.is_mobile = is_mobile;
	}
	
	

}
