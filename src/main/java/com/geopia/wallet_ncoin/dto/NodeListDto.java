package com.geopia.wallet_ncoin.dto;

public class NodeListDto {
	private Integer row_num;
	private Integer seq;
	private String address;
	private String last_ledger;
	private Integer operation_time;
	private Integer delay_time;
	private String version;

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

	public String getLast_ledger() {
		return last_ledger;
	}

	public void setLast_ledger(String last_ledger) {
		this.last_ledger = last_ledger;
	}

	public Integer getOperation_time() {
		return operation_time;
	}

	public void setOperation_time(Integer operation_time) {
		this.operation_time = operation_time;
	}

	public Integer getDelay_time() {
		return delay_time;
	}

	public void setDelay_time(Integer delay_time) {
		this.delay_time = delay_time;
	}

	public String getVersion() {
		return version;
	}

	public void setVersion(String version) {
		this.version = version;
	}

	public Integer getRow_num() {
		return row_num;
	}

	public void setRow_num(Integer row_num) {
		this.row_num = row_num;
	}
}