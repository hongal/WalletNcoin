package com.geopia.wallet_ncoin.dto;

import java.util.Set;

public class Role {
	private Long customer_id;
	private String role_name;
	private Set<NcoinCustomerDto> users;
	public Long getCustomer_id() {
		return customer_id;
	}
	public void setCustomer_id(Long customer_id) {
		this.customer_id = customer_id;
	}
	public String getRole_name() {
		return role_name;
	}
	public void setRole_name(String role_name) {
		this.role_name = role_name;
	}
	public Set<NcoinCustomerDto> getUsers() {
		return users;
	}
	public void setUsers(Set<NcoinCustomerDto> users) {
		this.users = users;
	}
	
}
