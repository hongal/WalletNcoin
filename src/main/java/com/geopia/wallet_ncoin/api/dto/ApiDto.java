package com.geopia.wallet_ncoin.api.dto;

public class ApiDto {
	private long trade_date;
	private int trade_type;
	private String amount;
	private String trade_address;
	private int transaction_state;

	public long getTrade_date() {
		return trade_date;
	}

	public void setTrade_date(long trade_date) {
		this.trade_date = trade_date;
	}

	public int getTrade_type() {
		return trade_type;
	}

	public void setTrade_type(int trade_type) {
		this.trade_type = trade_type;
	}

	public String getAmount() {
		return amount;
	}

	public void setAmount(String amount) {
		this.amount = amount;
	}

	public int getTransaction_state() {
		return transaction_state;
	}

	public void setTransaction_state(int transaction_state) {
		this.transaction_state = transaction_state;
	}

	public String getTrade_address() {
		return trade_address;
	}

	public void setTrade_address(String trade_address) {
		this.trade_address = trade_address;
	}

}
