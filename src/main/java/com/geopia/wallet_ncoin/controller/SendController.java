package com.geopia.wallet_ncoin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SendController {
    @RequestMapping("/send")
    public String getSendPage(){

        return "tiles/none/send";
    }
}
