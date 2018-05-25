package com.geopia.wallet_ncoin.jsonrpc.dto;

public class JsonRPCWallet_proposeResultDto {
	private String account_id;
	private String key_type;
	private String master_key;
	private String master_seed;
	public String getMaster_seed() {
		return master_seed;
	}
	public void setMaster_seed(String master_seed) {
		this.master_seed = master_seed;
	}
	private String master_seed_hex;
	public String getAccount_id() {
		return account_id;
	}
	public void setAccount_id(String account_id) {
		this.account_id = account_id;
	}
	public String getKey_type() {
		return key_type;
	}
	public void setKey_type(String key_type) {
		this.key_type = key_type;
	}
	public String getMaster_key() {
		return master_key;
	}
	public void setMaster_key(String master_key) {
		this.master_key = master_key;
	}
	public String getMaster_seed_hex() {
		return master_seed_hex;
	}
	public void setMaster_seed_hex(String master_seed_hex) {
		this.master_seed_hex = master_seed_hex;
	}
	public String getPublic_key() {
		return public_key;
	}
	public void setPublic_key(String public_key) {
		this.public_key = public_key;
	}
	public String getPublic_key_hex() {
		return public_key_hex;
	}
	public void setPublic_key_hex(String public_key_hex) {
		this.public_key_hex = public_key_hex;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	private String public_key;
	private String public_key_hex;
	private String status;
}
