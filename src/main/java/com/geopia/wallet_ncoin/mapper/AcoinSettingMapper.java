package com.geopia.wallet_ncoin.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.geopia.wallet_ncoin.api.dto.SettingDto;

@Mapper
public interface AcoinSettingMapper {

	public SettingDto selectSetting() throws Exception;

}
