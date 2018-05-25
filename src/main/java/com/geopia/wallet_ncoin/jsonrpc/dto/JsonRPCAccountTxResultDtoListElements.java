package com.geopia.wallet_ncoin.jsonrpc.dto;

import java.util.Map;

public class JsonRPCAccountTxResultDtoListElements {

	private Map meta;
	private TransactionRetrieveDto tx;

	public Map getMeta() {
		return meta;
	}

	public void setMeta(Map meta) {
		this.meta = meta;
	}

	public TransactionRetrieveDto getTx() {
		return tx;
	}

	public void setTx(TransactionRetrieveDto tx) {
		this.tx = tx;
	}

	@Override
	public String toString() {
		return "JsonRPCAccountTxResultDtoListElements [meta=" + meta + ", tx=" + tx + "]";
	}

}
