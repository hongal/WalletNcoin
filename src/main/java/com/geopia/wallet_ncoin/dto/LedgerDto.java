package com.geopia.wallet_ncoin.dto;

import java.util.Date;
import java.util.List;

import com.google.gson.JsonArray;

public class LedgerDto {
	private Integer row_num;
	private String block_hash;
	private String parent_hash;
	private Integer transaction_count;
	private Date reg_date;
	private List<String> transaction;

	public String getBlock_hash() {
		return block_hash;
	}

	public List<String> getTransaction() {
		return transaction;
	}

	public void setTransaction(List<String> transaction) {
		this.transaction = transaction;
	}

	public void setBlock_hash(String block_hash) {
		this.block_hash = block_hash;
	}

	public String getParent_hash() {
		return parent_hash;
	}

	public void setParent_hash(String parent_hash) {
		this.parent_hash = parent_hash;
	}

	public Integer getTransaction_count() {
		if (transaction == null) {
			return 0;
		}
		return transaction.size();
	}

	public void setTransaction_count(Integer transaction_count) {
		this.transaction_count = transaction_count;
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

	@Override
	public String toString() {
		return "LedgerDto [row_num=" + row_num + ", block_hash=" + block_hash + ", parent_hash=" + parent_hash
				+ ", transaction_count=" + transaction_count + ", reg_date=" + reg_date + ", transaction=" + transaction
				+ "]";
	}

}