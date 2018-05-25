package com.geopia.wallet_ncoin.api.dto;

public class SubmitDto {
	@Override
	public String toString() {
		return "SubmitDto [tx_blob=" + tx_blob + "]";
	}

	private String tx_blob;

	public String getTx_blob() {
		return tx_blob;
	}

	public void setTx_blob(String tx_blob) {
		this.tx_blob = tx_blob;
	}
}
