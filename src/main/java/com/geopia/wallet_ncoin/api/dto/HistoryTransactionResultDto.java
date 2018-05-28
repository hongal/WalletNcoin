package com.geopia.wallet_ncoin.api.dto;

import java.util.List;

import com.geopia.wallet_ncoin.dto.AcoinTransactionsDto;

public class HistoryTransactionResultDto {
	List<AcoinTransactionsDto> list;
	int detailCode;
	int stateCode;
	Page page;
	public List<AcoinTransactionsDto> getList() {
		return list;
	}
	public void setList(List<AcoinTransactionsDto> list) {
		this.list = list;
	}
	public int getDetailCode() {
		return detailCode;
	}
	public void setDetailCode(int detailCode) {
		this.detailCode = detailCode;
	}
	public int getStateCode() {
		return stateCode;
	}
	public void setStateCode(int stateCode) {
		this.stateCode = stateCode;
	}
	public Page getPage() {
		return page;
	}
	public void setPage(Page page) {
		this.page = page;
	}
	
}
