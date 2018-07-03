package com.geopia.wallet_ncoin.mapper;

import org.apache.ibatis.annotations.*;

@Mapper
public interface SecurityMapper {
    @Select("SELECT count(*) FROM ncoin_customer_sec_pw where id = #{id}")
    int checkSecPW(@Param("id")String id);

    @Insert("INSERT into ncoin_customer_sec_pw(id, sec_pw, reg_date, updated) values(#{id}, #{sPw}, now(), now())")
    int insertSecPw(@Param("id")String id, @Param("sPw")String sPw);

    @Update("DELETE FROM ncoin_customer_sec_pw WHERE id IN (" +
            "    SELECT * FROM (" +
            "        SELECT id FROM ncoin_customer_sec_pw where id = #{id} and sec_pw = #{sPw}" +
            "    ) AS p)")
    int deleteSecPw(@Param("id") String id, @Param("sPw")String sPw);

    @Select("SELECT otp_key from ncoin_customer where id = #{id} and otp = 1")
    String getOtpKey(String id);

    @Insert("UPDATE ncoin_customer SET otp_key = #{encodedKey}, otp = 1 where id = #{id}")
    int insertOTP(@Param("id")String id, @Param("encodedKey")String encodedKey);

    @Delete("UPDATE ncoin_customer SET otp_key = '', otp = 0 where id = #{id}")
    int deteteOTP(@Param("id")String id);
}
