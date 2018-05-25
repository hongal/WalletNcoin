package com.geopia.wallet_ncoin.jsonrpc.dto;

import java.util.Map;

public class JsonLedgerDto {
	@Override
	public String toString() {
		return "JsonLedgerDto [result=" + result + ", id=" + id + ", jsonrpc=" + jsonrpc + "]";
	}
	private LedgerResultDto result;
	private String id;
	private String jsonrpc;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getJsonrpc() {
		return jsonrpc;
	}
	public void setJsonrpc(String jsonrpc) {
		this.jsonrpc = jsonrpc;
	}
	public LedgerResultDto getResult() {
		return result;
	}
	public void setResult(LedgerResultDto result) {
		this.result = result;
	}

	
}
