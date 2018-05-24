package com.geopia.wallet_ncoin.dto;

public class TradeLogDto {
	private Integer row_num;
	private Integer seq;
	private String content;

	public Integer getSeq() {
		return seq;
	}

	public void setSeq(Integer seq) {
		this.seq = seq;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Integer getRow_num() {
		return row_num;
	}

	public void setRow_num(Integer row_num) {
		this.row_num = row_num;
	}
}