package com.geopia.wallet_ncoin.dto;

import java.io.Serializable;

public class WizLedgerInfoDto implements Serializable {

	private String ledger_hash;
	private String ledger_index;

	public String getLedger_hash() {
		return ledger_hash;
	}

	public void setLedger_hash(String ledger_hash) {
		this.ledger_hash = ledger_hash;
	}

	public String getLedger_index() {
		return ledger_index;
	}

	public void setLedger_index(String ledger_index) {
		this.ledger_index = ledger_index;
	}

	@Override
	public String toString() {
		return "WizLedgerInfoDto [ledger_hash=" + ledger_hash + ", ledger_index=" + ledger_index + "]";
	}

}
