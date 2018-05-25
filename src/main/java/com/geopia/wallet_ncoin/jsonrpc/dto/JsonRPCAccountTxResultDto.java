package com.geopia.wallet_ncoin.jsonrpc.dto;

import java.util.List;
import java.util.Map;

public class JsonRPCAccountTxResultDto {
	private String account;
	private String status;

	private String limit;
	// private List<Map<String, TransactionRetrieveDto>> transactions;
	private List<JsonRPCAccountTxResultDtoListElements> transactions;

	public List<JsonRPCAccountTxResultDtoListElements> getTransactions() {
		return transactions;
	}

	public void setTransactions(List<JsonRPCAccountTxResultDtoListElements> transactions) {
		this.transactions = transactions;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getLimit() {
		return limit;
	}

	public void setLimit(String limit) {
		this.limit = limit;
	}

	@Override
	public String toString() {
		return "JsonRPCAccountTxResultDto [account=" + account + ", status=" + status + ", limit=" + limit
				+ ", transactions=" + transactions + "]";
	}
}
