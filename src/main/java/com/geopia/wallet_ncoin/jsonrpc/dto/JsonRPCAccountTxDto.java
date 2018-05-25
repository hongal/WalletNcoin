package com.geopia.wallet_ncoin.jsonrpc.dto;

public class JsonRPCAccountTxDto {
	private JsonRPCAccountTxResultDto result;

	@Override
	public String toString() {
		return "JsonRPCAccountTXDto [result=" + result + "]";
	}

	public JsonRPCAccountTxResultDto getResult() {
		return result;
	}

	public void setResult(JsonRPCAccountTxResultDto result) {
		this.result = result;
	}
}
