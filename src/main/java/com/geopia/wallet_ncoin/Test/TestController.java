package com.geopia.wallet_ncoin.Test;

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
public class TestController {
    @Value("${spring.application.name}")
    String appName;
    
    @Autowired
    private AcoinAddressMapper acoinaddressmapper;

    @RequestMapping("/")
    public String ssss(Model model){
        System.out.println(appName);
        model.addAttribute("appName", appName);
        AcoinAddressVO vo;
		try {
			vo = acoinaddressmapper.select("NHb3CJAWyw4Nj31VRWh36UkukG4b9dtyTs");
			 System.out.println(vo.getAmount());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("abaa");
        
        return "tiles/none/login";
    }
}
