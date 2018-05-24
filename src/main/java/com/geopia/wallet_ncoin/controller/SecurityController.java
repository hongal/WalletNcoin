package com.geopia.wallet_ncoin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SecurityController {

    @RequestMapping("/security")
    public String getSecurityPage(){

        return "tiles/default/security";
    }

    @RequestMapping("/security/sPw")
    public String getSecPwPage(){

        return "tiles/default/sPw";
    }
}
