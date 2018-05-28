package com.geopia.wallet_ncoin.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.geopia.wallet_ncoin.dto.NcoinCustomerDto;
import com.geopia.wallet_ncoin.mapper.NcoinCustomerMapper;

@Controller
public class RegisterController {
	
	@Autowired
	NcoinCustomerMapper ncoincustomermapper;
	
    @RequestMapping("/register")
    public String getRegisterPage(){

        return "tiles/none/register";
    }
    
    @RequestMapping("signin")
    public String getSignin() {
    	
    	return "tiles/none/signin";
    }
    

	@RequestMapping("/join")
	public String join(Map<String, Object> param,ModelMap  mv,NcoinCustomerDto customerdto) {
		
		try {
			ncoincustomermapper.addcustomer(customerdto);
			mv.addAttribute("isSuccess", "true");
		} catch (Exception e) {
			
			
			mv.addAttribute("isSuccess", "false");
			mv.addAttribute("errMsg", e.getMessage());
		}
		
		return "tiles/none/login";
	}
	
	@RequestMapping("/login")
	public String login(Map<String, Object> param,ModelMap  mv) {
		
		
		
		return "tiles/none/login";
	}
}
