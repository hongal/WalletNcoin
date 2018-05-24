package com.geopia.wallet_ncoin.dto;

import java.util.Date;

public class WalletListDto {
	private Integer row_num;
	private Integer seq;
	private String address;
	private Integer amount;
	private Date last_transaction_date;
	private Date reg_date;

	public Integer getSeq() {
		return seq;
	}

	public void setSeq(Integer seq) {
		this.seq = seq;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Integer getAmount() {
		return amount;
	}

	public void setAmount(Integer amount) {
		this.amount = amount;
	}

	public Date getLast_transaction_date() {
		return last_transaction_date;
	}

	public void setLast_transaction_date(Date last_transaction_date) {
		this.last_transaction_date = last_transaction_date;
	}

	public Date getReg_date() {
		return reg_date;
	}

	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}

	public Integer getRow_num() {
		return row_num;
	}

	public void setRow_num(Integer row_num) {
		this.row_num = row_num;
	}
}