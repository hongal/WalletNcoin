package com.geopia.wallet_ncoin.jsonrpc.dto;

public class TransactionMemoDto {
	@Override
	public String toString() {
		return "TransactionMemoDto [MemoData=" + MemoData + ", MemoType=" + MemoType + "]";
	}
	private String MemoData;
	public String getMemoData() {
		return MemoData;
	}
	public void setMemoData(String memoData) {
		MemoData = memoData;
	}
	public String getMemoType() {
		return MemoType;
	}
	public void setMemoType(String memoType) {
		MemoType = memoType;
	}
	private String MemoType;
}
