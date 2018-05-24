package com.geopia.wallet_ncoin.domain;

import java.math.BigDecimal;

public class AcoinAddressVO {
	String address;
	java.sql.Timestamp reg_date;
	java.sql.Timestamp update_date;
	BigDecimal amount;
	int row_num;
	String Sequence;
	
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public java.sql.Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(java.sql.Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	public java.sql.Timestamp getUpdate_date() {
		return update_date;
	}
	public void setUpdate_date(java.sql.Timestamp update_date) {
		this.update_date = update_date;
	}
	public BigDecimal getAmount() {
		return amount;
	}
	public void setAmount(BigDecimal amount) {
		this.amount = amount;
	}
	public int getRow_num() {
		return row_num;
	}
	public void setRow_num(int row_num) {
		this.row_num = row_num;
	}
	public String getSequence() {
		return Sequence;
	}
	public void setSequence(String sequence) {
		Sequence = sequence;
	}
	
}
