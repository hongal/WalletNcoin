package com.geopia.wallet_ncoin.service;

import com.geopia.wallet_ncoin.dto.NcoinCustomerDto;

public interface UserService {
	
	//public void saveUser(NcoinCustomerDto user);

	NcoinCustomerDto findByUsername(String username, String password);
}
