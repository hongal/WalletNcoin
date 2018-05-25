package com.geopia.wallet_ncoin.api.dto;

public class SettingDto {
	private String fee;
	private String update_time;
	
	@Override
	public String toString() {
		return "SettingDto [fee=" + fee + ", update_time=" + update_time + "]";
	}

	public String getUpdate_time() {
		return update_time;
	}

	public void setUpdate_time(String update_time) {
		this.update_time = update_time;
	}

	public String getFee() {
		return fee;
	}

	public void setFee(String fee) {
		this.fee = fee;
	}
}
