package com.geopia.wallet_ncoin.api.dto;

import lombok.Data;

@Data
public class SmsDto {
    String num;
    String id;
    String code;
    String ip_addr;
}
