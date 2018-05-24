package com.geopia.wallet_ncoin.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;

@Controller
public class ReceiveController {

    @RequestMapping("/receive")
    public String getReceivePage(){

        return "tiles/none/receive";
    }
}
