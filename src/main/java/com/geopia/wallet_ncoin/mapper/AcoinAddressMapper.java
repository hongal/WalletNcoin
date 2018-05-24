package com.geopia.wallet_ncoin.mapper;

import org.apache.ibatis.annotations.Param;

import com.geopia.wallet_ncoin.domain.AcoinAddressVO;

public interface AcoinAddressMapper {

	public AcoinAddressVO select(@Param("address")String address) throws Exception;
}
