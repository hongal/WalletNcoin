package com.geopia.wallet_ncoin.Main;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {

    @RequestMapping("/main")
    public String getMainPage(){

        return "tiles/none/main";
    }
}
