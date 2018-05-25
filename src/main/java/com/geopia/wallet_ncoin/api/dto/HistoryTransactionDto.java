package com.geopia.wallet_ncoin.api.dto;

public class HistoryTransactionDto {
	private String transactionHash;
	private Integer ledger_index;
	private String address;
	private Integer limit;
	private Integer pageNo;
	
	
	@Override
	public String toString() {
		return "HistoryTransactionDto [transactionHash=" + transactionHash + ", ledger_index=" + ledger_index
				+ ", address=" + address + ", limit=" + limit + ", pageNo=" + pageNo + "]";
	}
	public String getTransactionHash() {
		return transactionHash;
	}
	public void setTransactionHash(String transactionHash) {
		this.transactionHash = transactionHash;
	}

	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
	public void setLedger_index(Integer ledger_index) {
		this.ledger_index = ledger_index;
	}
	public void setLimit(Integer limit) {
		this.limit = limit;
	}
	public void setPageNo(Integer pageNo) {
		this.pageNo = pageNo;
	}
	
	public Integer getLedger_index() {
		return ledger_index;
	}
	public Integer getLimit() {
		return limit;
	}
	public Integer getPageNo() {
		return pageNo;
	}
	
}
