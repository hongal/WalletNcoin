package com.geopia.wallet_ncoin.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.geopia.wallet_ncoin.dto.NcoinCustomerDto;

@Mapper
public interface NcoinCustomerMapper {
	public void addcustomer(NcoinCustomerDto ncoincustomerDTO) throws RuntimeException;


}
