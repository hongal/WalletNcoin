package com.geopia.wallet_ncoin.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.geopia.wallet_ncoin.dto.NcoinCustomerDto;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface NcoinCustomerMapper {
	public void addcustomer(NcoinCustomerDto ncoincustomerDTO) throws RuntimeException;
	public NcoinCustomerDto findById(@Param("userid")String userid) throws RuntimeException;

/*	@Select("SELECT * FROM ncoin_customer")
	NcoinCustomerDto getById(String userid);*/
}
