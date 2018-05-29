package com.geopia.wallet_ncoin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.geopia.wallet_ncoin.dto.NcoinCustomerDto;
import com.geopia.wallet_ncoin.mapper.NcoinCustomerMapper;
import com.geopia.wallet_ncoin.mapper.NcoinCustomerRoleMapper;

public class UserServiceImpl implements UserService {
	 @Autowired
	 private NcoinCustomerMapper userRepository;
	 @Autowired
	 private NcoinCustomerRoleMapper roleRepository;
	 
	 @Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	

	 public NcoinCustomerDto findByUsername(String username) {
	 return userRepository.findById(username);
	 }



	@Override
	public void saveUser(NcoinCustomerDto user) {
		// TODO Auto-generated method stub
		user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
		user.setId(user.getId());
	}
}
