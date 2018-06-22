package com.geopia.wallet_ncoin.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

@Mapper
public interface MemberMapper {

    @Update("UPDATE ncoin_customer SET password = #{password} where id = #{id}")
    int changePassword(@Param("id")String id, @Param("password")String password);

    @Select("SELECT count(*) FROM ncoin_customer where phone = #{phone}")
    int checkHp(@Param("phone") String phone);

    @Update("UPDATE ncoin_customer SET phone = #{phone} where id = #{id}")
    int changeHp(@Param("id") String id, @Param("phone") String phone);
}
