package com.geopia.wallet_ncoin.api.dto;

import lombok.Data;

@Data
public class TradeListDto {
    String account;
    String destination;
    String amount;
    String reg_date;

}
