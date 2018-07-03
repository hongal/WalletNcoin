package com.geopia.wallet_ncoin.api.dto;

import lombok.Data;


public class LoginDto {
    String id;
    boolean otp;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public boolean isOtp() {
        return otp;
    }

    public void setOtp(boolean otp) {
        this.otp = otp;
    }


}
