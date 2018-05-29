package com.geopia.wallet_ncoin.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.geopia.wallet_ncoin.dto.Role;

@Mapper
public interface NcoinCustomerRoleMapper {

	public Role findByRole(@Param("role_name")String role_name);
	
}
