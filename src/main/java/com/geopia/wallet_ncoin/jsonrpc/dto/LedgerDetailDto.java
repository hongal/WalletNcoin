package com.geopia.wallet_ncoin.jsonrpc.dto;

import java.util.List;

public class LedgerDetailDto {
	@Override
	public String toString() {
		return "LedgerDetailDto [accepted=" + accepted + ", account_hash=" + account_hash + ", close_time_human="
				+ close_time_human + ", closed=" + closed + ", hash=" + hash + ", ledger_index=" + ledger_index
				+ ", parent_hash=" + parent_hash + ", seqNum=" + seqNum + ", transaction_hash=" + transaction_hash
				+ ", transactions=" + transactions + "]";
	}
	private String accepted;
	private String account_hash;
	private String close_time_human;
	private String closed;
	private String hash;
	private String ledger_index;
	private String parent_hash;
	private String seqNum;
	private String transaction_hash;
	private List<TransactionRetrieveDto> transactions;
	
	public List<TransactionRetrieveDto> getTransactions() {
		return transactions;
	}
	public void setTransactions(List<TransactionRetrieveDto> transactions) {
		this.transactions = transactions;
	}
	public String getAccepted() {
		return accepted;
	}
	public void setAccepted(String accepted) {
		this.accepted = accepted;
	}
	public String getAccount_hash() {
		return account_hash;
	}
	public void setAccount_hash(String account_hash) {
		this.account_hash = account_hash;
	}
	public String getClose_time_human() {
		return close_time_human;
	}
	public void setClose_time_human(String close_time_human) {
		this.close_time_human = close_time_human;
	}
	public String getClosed() {
		return closed;
	}
	public void setClosed(String closed) {
		this.closed = closed;
	}
	public String getHash() {
		return hash;
	}
	public void setHash(String hash) {
		this.hash = hash;
	}
	public String getLedger_index() {
		return ledger_index;
	}
	public void setLedger_index(String ledger_index) {
		this.ledger_index = ledger_index;
	}
	public String getParent_hash() {
		return parent_hash;
	}
	public void setParent_hash(String parent_hash) {
		this.parent_hash = parent_hash;
	}
	public String getSeqNum() {
		return seqNum;
	}
	public void setSeqNum(String seqNm) {
		this.seqNum = seqNm;
	}
	public String getTransaction_hash() {
		return transaction_hash;
	}
	public void setTransaction_hash(String transaction_hash) {
		this.transaction_hash = transaction_hash;
	}
	
}
