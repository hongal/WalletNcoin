package com.geopia.wallet_ncoin.jsonrpc.dto;

public class jsonRPCTransactionDto {

	@Override
	public String toString() {
		return "jsonRPCTransactionDto [result=" + result + "]";
	}

	private TransactionRetrieveDto result;

	public TransactionRetrieveDto getResult() {
		return result;
	}

	public void setResult(TransactionRetrieveDto result) {
		this.result = result;
	}

	
}
