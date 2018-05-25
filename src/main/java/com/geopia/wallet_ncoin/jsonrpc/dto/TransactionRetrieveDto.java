package com.geopia.wallet_ncoin.jsonrpc.dto;

import java.util.List;
import java.util.Map;

public class TransactionRetrieveDto {
	private String Account;
	private String Amount;
	private String Destination;
	private String Fee;
	private String Flags;
	private List<Map<String, TransactionMemoDto>> Memos;
	private String Sequence;

	private String SigningPubKey;
	private String TransactionType;
	private String TxnSignature;
	private String date;
	private String hash;
	private String inLedger;
	private String ledger_index;
	private String status;

	public String getAccount() {
		return Account;
	}

	public void setAccount(String account) {
		this.Account = account;
	}

	public String getAmount() {
		return Amount;
	}

	public void setAmount(String amount) {
		Amount = amount;
	}

	public String getDestination() {
		return Destination;
	}

	public void setDestination(String destination) {
		Destination = destination;
	}

	public String getFee() {
		return Fee;
	}

	public void setFee(String fee) {
		this.Fee = fee;
	}

	public String getFlags() {
		return Flags;
	}

	public void setFlags(String flags) {
		this.Flags = flags;
	}

	public List<Map<String, TransactionMemoDto>> getMemos() {
		return Memos;
	}

	public void setMemos(List<Map<String, TransactionMemoDto>> memos) {
		Memos = memos;
	}

	public String getSequence() {
		return Sequence;
	}

	public void setSequence(String sequence) {
		Sequence = sequence;
	}

	public String getSigningPubKey() {
		return SigningPubKey;
	}

	public void setSigningPubKey(String signingPubKey) {
		SigningPubKey = signingPubKey;
	}

	public String getTransactionType() {
		return TransactionType;
	}

	public void setTransactionType(String transactionType) {
		TransactionType = transactionType;
	}

	public String getTxnSignature() {
		return TxnSignature;
	}

	public void setTxnSignature(String txnSignature) {
		TxnSignature = txnSignature;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getHash() {
		return hash;
	}

	public void setHash(String hash) {
		this.hash = hash;
	}

	public String getInLedger() {
		return inLedger;
	}

	public void setInLedger(String inLedger) {
		this.inLedger = inLedger;
	}

	public String getLedger_index() {
		return ledger_index;
	}

	public void setLedger_index(String ledger_index) {
		this.ledger_index = ledger_index;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "TransactionRetrieveDto [Account=" + Account + ", Amount=" + Amount + ", Destination=" + Destination
				+ ", Fee=" + Fee + ", Flags=" + Flags + ", Memos=" + Memos + ", Sequence=" + Sequence
				+ ", SigningPubKey=" + SigningPubKey + ", TransactionType=" + TransactionType + ", TxnSignature="
				+ TxnSignature + ", date=" + date + ", hash=" + hash + ", inLedger=" + inLedger + ", ledger_index="
				+ ledger_index + ", status=" + status + "]";
	}

}
