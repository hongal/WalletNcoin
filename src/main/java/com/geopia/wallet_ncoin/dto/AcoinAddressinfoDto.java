package com.geopia.wallet_ncoin.dto;

import java.math.BigDecimal;
import java.sql.Timestamp;

public class AcoinAddressinfoDto {
	String address;
	java.sql.Timestamp reg_date;
	java.sql.Timestamp update_date;
	BigDecimal amount;
	int row_num;
	String Sequence;
	public String getSequence() {
		return Sequence;
	}

	public void setSequence(String sequence) {
		this.Sequence = sequence;
	}
	String bigAdmount;
	
	public String getBigAdmount() {
		return bigAdmount;
	}

	public void setBigAdmount(String bigAdmount) {
		this.bigAdmount = bigAdmount;
	}

	public int getRow_num() {
		return row_num;
	}

	public void setRow_num(int row_num) {
		this.row_num = row_num;
	}

	public AcoinAddressinfoDto(String address, BigDecimal amount) {
		super();
		this.address = address;
		this.amount = amount;
	}
	public AcoinAddressinfoDto(){
		
	}
	public AcoinAddressinfoDto(String address, Timestamp reg_date, Timestamp update_date, BigDecimal amount) {
		super();
		this.address = address;
		this.reg_date = reg_date;
		this.update_date = update_date;
		this.amount = amount;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	public Timestamp getUpdate_date() {
		return update_date;
	}
	
	public void setUpdate_date(Timestamp update_date) {
		this.update_date = update_date;
	}
	
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public BigDecimal getAmount() {
		return amount;
	}
	public void setAmount(BigDecimal amount) {
		this.amount = amount;
	}
}
