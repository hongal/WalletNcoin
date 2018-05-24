package com.geopia.wallet_ncoin.dto;

import java.math.BigDecimal;
import java.util.Date;

public class AcoinTransactionsDto {
	private int ledger_index;
	private int row_num;
	private BigDecimal fee;
	private String flags;
	private int seq;
	private String sign_pubkey;
	private String transaction_type;
	private String sign;
	private String ledger_hash;
	private String transaction_hash;
	private BigDecimal amount = new BigDecimal(0);
	private String destination;
	private String account;
	private Date confirm_datetime;
	private long confirm_datetime_long;
	private java.sql.Timestamp update_time;
	private java.sql.Timestamp reg_date;

	public java.sql.Timestamp getUpdate_time() {
		return update_time;
	}

	public void setUpdate_time(java.sql.Timestamp update_time) {
		this.update_time = update_time;
	}

	public java.sql.Timestamp getReg_date() {
		return reg_date;
	}

	public void setReg_date(java.sql.Timestamp reg_date) {
		this.reg_date = reg_date;
	}

	public AcoinTransactionsDto() {
		// TODO Auto-generated constructor stub
	}
	
	public AcoinTransactionsDto(int ledger_index, BigDecimal fee, String flags, int seq, String sign_pubkey,
			String transaction_type, String sign, String transaction_hash, BigDecimal amount, String destination,
			String account) {
		super();
		this.ledger_index = ledger_index;
		this.fee = fee;
		this.flags = flags;
		this.seq = seq;
		this.sign_pubkey = sign_pubkey;
		this.transaction_type = transaction_type;
		this.sign = sign;
		this.transaction_hash = transaction_hash;
		this.amount = amount;
		this.destination = destination;
		this.account = account;
	}

	public long getConfirm_datetime_long() {
		return confirm_datetime_long;
	}

	public void setConfirm_datetime_long(long confirm_datetime_long) {
		this.confirm_datetime_long = confirm_datetime_long;
	}

	public int getLedger_index() {
		return ledger_index;
	}

	public void setLedger_index(int ledger_index) {
		this.ledger_index = ledger_index;
	}

	public String getLedger_hash() {
		return ledger_hash;
	}

	public void setLedger_hash(String ledger_hash) {
		this.ledger_hash = ledger_hash;
	}

	public String getTransaction_hash() {
		return transaction_hash;
	}

	public void setTransaction_hash(String transaction_hash) {
		this.transaction_hash = transaction_hash;
	}

	public BigDecimal getAmount() {
		return amount;
	}

	public void setAmount(BigDecimal amount) {
		this.amount = amount;
	}

	public String getDestination() {
		return destination;
	}

	public void setDestination(String destination) {
		this.destination = destination;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public Date getConfirm_datetime() {
		return confirm_datetime;
	}

	public void setConfirm_datetime(Date confirm_datetime) {
		this.confirm_datetime = confirm_datetime;
	}

	public BigDecimal getFee() {
		return fee;
	}

	public void setFee(BigDecimal fee) {
		this.fee = fee;
	}

	public String getFlags() {
		return flags;
	}

	public void setFlags(String flags) {
		this.flags = flags;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getSign_pubkey() {
		return sign_pubkey;
	}

	public void setSign_pubkey(String sign_pubkey) {
		this.sign_pubkey = sign_pubkey;
	}

	public String getTransaction_type() {
		return transaction_type;
	}

	public void setTransaction_type(String transaction_type) {
		this.transaction_type = transaction_type;
	}

	public String getSign() {
		return sign;
	}

	public void setSign(String sign) {
		this.sign = sign;
	}

	public void setRow_num(int i) {
		// TODO Auto-generated method stub
		this.row_num = i;
	}
	
	public int getRow_num() {
		return this.row_num;
	}

}
