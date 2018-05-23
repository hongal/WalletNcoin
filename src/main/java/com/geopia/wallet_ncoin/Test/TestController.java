package com.geopia.wallet_ncoin.Test;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class TestController {
    @Value("${spring.application.name}")
    String appName;

    @RequestMapping("/")
    public String ssss(Model model){
        System.out.print(appName);
        model.addAttribute("appName", appName);

        return "login";
    }
}
