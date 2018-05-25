package com.geopia.wallet_ncoin.api.dto;

public class GetAccountInfoDto {

	private Integer limit;
	private Integer PageNo;
	private String address;
	
	@Override
	public String toString() {
		return "GetAccountInfoDto [limit=" + limit + ", PageNo=" + PageNo + ", address=" + address + "]";
	}
	public Integer getLimit() {
		return limit;
	}
	public void setLimit(Integer limit) {
		this.limit = limit;
	}
	public Integer getPageNo() {
		return PageNo;
	}
	public void setPageNo(Integer pageNo) {
		PageNo = pageNo;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
}
