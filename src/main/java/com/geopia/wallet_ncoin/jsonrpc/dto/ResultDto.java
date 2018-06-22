package com.geopia.wallet_ncoin.jsonrpc.dto;

import java.util.List;
import java.util.Map;

public class
ResultDto {

	private Map cluster;
	private List<PeerDetailInfoDto> peers;

	private InfoDto info;

	private AccountDataDto account_data;

	public AccountDataDto getAccount_data() {
		return account_data;
	}

	public void setAccount_data(AccountDataDto account_data) {
		this.account_data = account_data;
	}

	public InfoDto getInfo() {
		return info;
	}

	public void setInfo(InfoDto info) {
		this.info = info;
	}

	public Map getCluster() {
		return cluster;
	}

	public void setCluster(Map cluster) {
		this.cluster = cluster;
	}

	public List<PeerDetailInfoDto> getPeers() {
		return peers;
	}

	public void setPeers(List<PeerDetailInfoDto> peers) {
		this.peers = peers;
	}

	@Override
	public String toString() {
		return "ResultDto [cluster=" + cluster + ", peers=" + peers + ", info=" + info + ", accountDataDto="
				+ account_data + "]";
	}

}
