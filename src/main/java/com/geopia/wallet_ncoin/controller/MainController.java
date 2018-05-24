package com.geopia.wallet_ncoin.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController {
    @Value("${spring.application.name}")
    String appName;

    @RequestMapping("/test")
    public String ssss(Model model){
        String current_address = "NHb3CJAWyw4Nj31VRWh36UkukG4b9dtyTs";
        
        model.addAttribute("appName", appName);

        return "tiles/none/login";
    }

    @RequestMapping("/main")
    public String getMainPage(Model model){
        String current_address = "NHb3CJAWyw4Nj31VRWh36UkukG4b9dtyTs";


        return "tiles/default/main";
    }

}
