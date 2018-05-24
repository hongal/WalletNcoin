package com.geopia.wallet_ncoin.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.context.annotation.Configuration;

import com.geopia.wallet_ncoin.domain.AcoinAddressVO;

@Mapper
public interface AcoinAddressMapper {

	public AcoinAddressVO select(@Param("address")String address) throws Exception;
}
