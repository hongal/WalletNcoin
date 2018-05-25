package com.geopia.wallet_ncoin.jsonrpc.dto;

public class JsonRPCDto {

	private String id;
	private String jsonrpc;
	private ResultDto result;
	

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

	public ResultDto getResult() {
		return result;
	}

	public void setResult(ResultDto result) {
		this.result = result;
	}

	@Override
	public String toString() {
		return "JsonRPCDto [id=" + id + ", jsonrpc=" + jsonrpc + ", result=" + result + "]";
	}

}