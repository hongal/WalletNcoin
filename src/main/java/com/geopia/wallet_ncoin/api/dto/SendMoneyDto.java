package com.geopia.wallet_ncoin.api.dto;

public class SendMoneyDto {
	private String recipient_address;
	private String tag;
	private String sendAmount;
	private String fee;
	private String sender_address;
	private String secret_key;

	public String getRecipient_address() {
		return recipient_address;
	}

	public void setRecipient_address(String recipient_address) {
		this.recipient_address = recipient_address;
	}

	public String getTag() {
		return tag;
	}

	public void setTag(String tag) {
		this.tag = tag;
	}

	public String getSendAmount() {
		return sendAmount;
	}

	public void setSendAmount(String sendAmount) {
		this.sendAmount = sendAmount;
	}

	public String getFee() {
		return fee;
	}

	public void setFee(String fee) {
		this.fee = fee;
	}

	public String getSender_address() {
		return sender_address;
	}

	public void setSender_address(String sender_address) {
		this.sender_address = sender_address;
	}

	public String getSecret_key() {
		return secret_key;
	}

	public void setSecret_key(String secret_key) {
		this.secret_key = secret_key;
	}

	@Override
	public String toString() {
		return "SendMoneyDto [recipient_address=" + recipient_address + ", tag=" + tag + ", sendAmount=" + sendAmount
				+ ", fee=" + fee + ", sender_address=" + sender_address + ", secret_key=" + secret_key + "]";
	}

}
