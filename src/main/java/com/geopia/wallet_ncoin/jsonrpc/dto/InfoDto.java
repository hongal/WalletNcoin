package com.geopia.wallet_ncoin.jsonrpc.dto;

public class InfoDto {
	private String complete_ledgers;
	private String io_latency_ms;
	private String pubkey_node;
	private String uptime;
	private String hostid;
	private String build_version;

	public String getBuild_version() {
		return build_version;
	}

	public void setBuild_version(String build_version) {
		this.build_version = build_version;
	}

	public String getHostid() {
		return hostid;
	}

	public void setHostid(String hostid) {
		this.hostid = hostid;
	}

	public String getComplete_ledgers() {
		return complete_ledgers;
	}

	public void setComplete_ledgers(String complete_ledgers) {
		this.complete_ledgers = complete_ledgers;
	}

	public String getIo_latency_ms() {
		return io_latency_ms;
	}

	public void setIo_latency_ms(String io_latency_ms) {
		this.io_latency_ms = io_latency_ms;
	}

	public String getPubkey_node() {
		return pubkey_node;
	}

	public void setPubkey_node(String pubkey_node) {
		this.pubkey_node = pubkey_node;
	}

	public String getUptime() {
		return uptime;
	}

	public void setUptime(String uptime) {
		this.uptime = uptime;
	}

	@Override
	public String toString() {
		return "InfoDto [complete_ledgers=" + complete_ledgers + ", io_latency_ms=" + io_latency_ms + ", pubkey_node="
				+ pubkey_node + ", uptime=" + uptime + "]";
	}

}
