package com.geopia.wallet_ncoin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.geopia.wallet_ncoin.domain.AcoinAddressVO;
import com.geopia.wallet_ncoin.mapper.AcoinAddressMapper;

@Controller
public class SendController {
	@Autowired
	AcoinAddressMapper acoinaddressmapper;
	
    @RequestMapping("/send")
    public String getSendPage(Model model){
    	 AcoinAddressVO vo;
 		try {
 			vo = acoinaddressmapper.select("NHb3CJAWyw4Nj31VRWh36UkukG4b9dtyTs");
 			model.addAttribute("address", vo.getAddress());
 		} catch (Exception e) {
 			// TODO Auto-generated catch block
 			e.printStackTrace();
 		}
 		System.out.println("abaa");
        return "tiles/none/sendMoney";
    }
}
