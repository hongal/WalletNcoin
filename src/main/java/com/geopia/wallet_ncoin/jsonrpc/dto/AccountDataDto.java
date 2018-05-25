package com.geopia.wallet_ncoin.jsonrpc.dto;

public class AccountDataDto {
	private String Account;
	private String Balance;
	private String Flags;
	private String LedgerEntryType;
	private String Sequence;

	public String getAccount() {
		return Account;
	}

	public void setAccount(String account) {
		Account = account;
	}

	public String getBalance() {
		return Balance;
	}

	public void setBalance(String balance) {
		Balance = balance;
	}

	public String getFlags() {
		return Flags;
	}

	public void setFlags(String flags) {
		Flags = flags;
	}

	public String getLedgerEntryType() {
		return LedgerEntryType;
	}

	public void setLedgerEntryType(String ledgerEntryType) {
		LedgerEntryType = ledgerEntryType;
	}

	public String getSequence() {
		return Sequence;
	}

	public void setSequence(String sequence) {
		Sequence = sequence;
	}

}
