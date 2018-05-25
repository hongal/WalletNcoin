package com.geopia.wallet_ncoin.jsonrpc.dto;

import java.util.Map;

public class LedgerResultDto {
	
	private LedgerDetailDto ledger;
	private String status;
	@Override
	public String toString() {
		return "LedgerResultDto [ledger=" + ledger + ", status=" + status + "]";
	}
	public LedgerDetailDto getLedger() {
		return ledger;
	}
	public void setLedger(LedgerDetailDto ledger) {
		this.ledger = ledger;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
}
