package com.geopia.wallet_ncoin.jsonrpc.dto;

public class PeerDetailInfoDto {

	private String num;
	private String address;
	private String complete_ledgers;
	private String inbound;
	private String latency;
	private String ledger;
	private String load;
	private String public_key;
	private String uptime;
	private String version;

	public String getNum() {
		return num;
	}

	public void setNum(String num) {
		this.num = num;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getComplete_ledgers() {
		return complete_ledgers;
	}

	public void setComplete_ledgers(String complete_ledgers) {
		this.complete_ledgers = complete_ledgers;
	}

	public String getInbound() {
		return inbound;
	}

	public void setInbound(String inbound) {
		this.inbound = inbound;
	}

	public String getLatency() {
		return latency;
	}

	public void setLatency(String latency) {
		this.latency = latency;
	}

	public String getLedger() {
		return ledger;
	}

	public void setLedger(String ledger) {
		this.ledger = ledger;
	}

	public String getLoad() {
		return load;
	}

	public void setLoad(String load) {
		this.load = load;
	}

	public String getPublic_key() {
		return public_key;
	}

	public void setPublic_key(String public_key) {
		this.public_key = public_key;
	}

	public String getUptime() {
		return uptime;
	}

	public void setUptime(String uptime) {
		this.uptime = uptime;
	}

	public String getVersion() {
		return version;
	}

	public void setVersion(String version) {
		this.version = version;
	}

	@Override
	public String toString() {
		return "PeerDetailInfoDto [address=" + address + ", complete_ledgers=" + complete_ledgers + ", inbound="
				+ inbound + ", latency=" + latency + ", ledger=" + ledger + ", load=" + load + ", public_key="
				+ public_key + ", uptime=" + uptime + ", version=" + version + "]";
	}

}