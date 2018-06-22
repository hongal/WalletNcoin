package com.geopia.wallet_ncoin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.geopia.wallet_ncoin.domain.AcoinAddressVO;
import com.geopia.wallet_ncoin.mapper.AcoinAddressMapper;

@Controller
public class MainController {
    @Value("${spring.application.name}")
    String appName;
    @Autowired
    private AcoinAddressMapper acoinaddressmapper;
    
    @RequestMapping("/")
    public String getMainPage(Model model){
        model.addAttribute("appName", appName);
        AcoinAddressVO vo;
		try {
			vo = acoinaddressmapper.select("NHb3CJAWyw4Nj31VRWh36UkukG4b9dtyTs");
			model.addAttribute("amount", vo.getAmount());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
        return "tiles/default/main";
    }

}
