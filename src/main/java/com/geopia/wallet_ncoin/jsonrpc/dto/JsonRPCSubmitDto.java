package com.geopia.wallet_ncoin.jsonrpc.dto;

public class JsonRPCSubmitDto {
	JsonRPCSubmitResultDto result;

	@Override
	public String toString() {
		return "JsonRPCSubmitDto [result=" + result + "]";
	}

	public JsonRPCSubmitResultDto getResult() {
		return result;
	}

	public void setResult(JsonRPCSubmitResultDto result) {
		this.result = result;
	}
}
