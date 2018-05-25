package com.geopia.wallet_ncoin.jsonrpc.dto;

import java.util.Map;

public class JsonRPCSubmitResultDto {

	@Override
	public String toString() {
		return "JsonRPCSubmitResultDto [engine_result=" + engine_result + ", engine_result_code=" + engine_result_code
				+ ", engine_result_message=" + engine_result_message + ", status=" + status + ", tx_blob=" + tx_blob
				+ ", error=" + error + ", error_code=" + error_code + ", error_message=" + error_message + ", tx_json="
				+ tx_json + "]";
	}
	private String engine_result;
	private String engine_result_code;
	private String engine_result_message;
	private String status;
	private String tx_blob;
	private String error;
	private String error_code;
	public String getError() {
		return error;
	}
	public void setError(String error) {
		this.error = error;
	}
	public String getError_code() {
		return error_code;
	}
	public void setError_code(String error_code) {
		this.error_code = error_code;
	}
	public String getError_message() {
		return error_message;
	}
	public void setError_message(String error_message) {
		this.error_message = error_message;
	}
	private String error_message;
	
	private Map tx_json;
	
	public String getEngine_result() {
		return engine_result;
	}
	public void setEngine_result(String engine_result) {
		this.engine_result = engine_result;
	}
	public String getEngine_result_code() {
		return engine_result_code;
	}
	public void setEngine_result_code(String engine_result_code) {
		this.engine_result_code = engine_result_code;
	}
	public String getEngine_result_message() {
		return engine_result_message;
	}
	public void setEngine_result_message(String engine_result_message) {
		this.engine_result_message = engine_result_message;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getTx_blob() {
		return tx_blob;
	}
	public void setTx_blob(String tx_blob) {
		this.tx_blob = tx_blob;
	}
	public Map getTx_json() {
		return tx_json;
	}
	public void setTx_json(Map tx_json) {
		this.tx_json = tx_json;
	}
	
}
