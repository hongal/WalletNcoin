package com.geopia.wallet_ncoin.api.dto;

import com.geopia.wallet_ncoin.jsonrpc.dto.JsonRPCSubmitResultDto;

public class SubmitResultDto {

	int detailCode;
	JsonRPCSubmitResultDto jsonRPCSubmitResultDto;
	int stateCode;
	String tx_blob;
	
	@Override
	public String toString() {
		return "SubmitResultDto [detailCode=" + detailCode + ", jsonRPCSubmitResultDto=" + jsonRPCSubmitResultDto
				+ ", stateCode=" + stateCode + ", tx_blob=" + tx_blob + "]";
	}
	public int getDetailCode() {
		return detailCode;
	}
	public void setDetailCode(int detailCode) {
		this.detailCode = detailCode;
	}
	public JsonRPCSubmitResultDto getJsonRPCSubmitResultDto() {
		return jsonRPCSubmitResultDto;
	}
	public void setJsonRPCSubmitResultDto(JsonRPCSubmitResultDto jsonRPCSubmitResultDto) {
		this.jsonRPCSubmitResultDto = jsonRPCSubmitResultDto;
	}
	public int getStateCode() {
		return stateCode;
	}
	public void setStateCode(int stateCode) {
		this.stateCode = stateCode;
	}
	public String getTx_blob() {
		return tx_blob;
	}
	public void setTx_blob(String tx_blob) {
		this.tx_blob = tx_blob;
	}
	
}
