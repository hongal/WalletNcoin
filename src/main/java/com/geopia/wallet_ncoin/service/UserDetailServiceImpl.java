package com.geopia.wallet_ncoin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.geopia.wallet_ncoin.dto.NcoinCustomerDto;
import com.geopia.wallet_ncoin.mapper.NcoinCustomerMapper;

public class UserDetailServiceImpl implements UserDetailsService {

	@Autowired
	private NcoinCustomerMapper mapper;
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		// TODO Auto-generated method stub
		NcoinCustomerDto customer = mapper.findById(username);
		if (customer == null)
			throw new UsernameNotFoundException(username);
		return new User(customer.getId(), customer.getPassword(), AuthorityUtils.createAuthorityList("USER"));
	}

}
