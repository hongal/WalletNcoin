package com.geopia.wallet_ncoin.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.ArrayList;

@Mapper
public interface ReceiveMapper {
    @Select("SELECT ncoin_address from ncoin_address_info WHERE id = #{id}")
    ArrayList<String> getAddressList(String id);

    @Insert("INSERT into ncoin_address_info (id, ncoin_address, reg_date) values(#{id}, #{ncoin_address}, now()) ")
    int insertAddress(@Param("id")String id, @Param("ncoin_address")String ncoin_address);
}
