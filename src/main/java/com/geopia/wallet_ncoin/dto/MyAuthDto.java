package com.geopia.wallet_ncoin.dto;

import lombok.Data;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.GrantedAuthority;

import java.util.List;

@Data
public class MyAuthDto extends UsernamePasswordAuthenticationToken {

    NcoinCustomerDto ncoinCustomerDto;

    public MyAuthDto(String id, String password, List<GrantedAuthority> grantedAuthorityList, NcoinCustomerDto ncoinCustomerDto) {
        super(id, password, grantedAuthorityList);
        this.ncoinCustomerDto = ncoinCustomerDto;
    }
}
