package com.geopia.wallet_ncoin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TransListController {
    @RequestMapping("/listtransactions")
    public String getTransListPage(){

        return "tiles/default/listtransactions";
    }


}
