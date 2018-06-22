package com.geopia.wallet_ncoin.mapper;

import com.geopia.wallet_ncoin.api.dto.SmsDto;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.geopia.wallet_ncoin.dto.NcoinCustomerDto;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface NcoinCustomerMapper {
	//public void addcustomer(NcoinCustomerDto ncoincustomerDTO) throws RuntimeException;

	@Select("SELECT * from ncoin_customer where id = #{userid}")
	NcoinCustomerDto findById(@Param("userid")String userid) throws RuntimeException;

	@Insert("INSERT into ncoin_customer(id, password, country, phone, reg_date, update_date, enabled) " +
			"values(#{id}, #{password}, #{country}, #{phone}, now(), now(), 2)")
	int addcustomer(NcoinCustomerDto ncoinCustomerDto);

	@Select("SELECT count(*) from ncoin_customer WHERE id = #{id}")
	int idDuplicateChk(String id);

	@Insert("INSERT into ncoin_auth_number (mobile, otp, useYN, reg_date, update_date, ip_addr) " +
			"values(#{num}, #{code}, 'N', now(), now(), #{ip_addr})" +
			"ON DUPLICATE KEY UPDATE mobile = #{num} , otp = #{code}")
	int insertAuthNumber(SmsDto smsDto);

	@Select("SELECT count(*) from ncoin_auth_number WHERE otp = #{sms_code}")
	int chkCode(String otp);
}
