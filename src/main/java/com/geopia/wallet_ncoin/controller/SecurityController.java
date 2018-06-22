package com.geopia.wallet_ncoin.controller;

import com.geopia.wallet_ncoin.mapper.SecurityMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class SecurityController {

    @Autowired
    SecurityMapper securityMapper;

    @RequestMapping("/security")
    public String getSecurityPage(){

        return "tiles/default/security";
    }

    @RequestMapping("/security/sPw")
    public String getSecPwPage(){

        return "tiles/default/sPw";
    }

    @RequestMapping("/api/checkSecPw")
    @ResponseBody
    public String checkSecPw(){
        String id = SecurityContextHolder.getContext().getAuthentication().getName();
        int checkResult = securityMapper.checkSecPW(id);

        if(checkResult > 0){
            return "secPwExist!!";
        }else{
            return "secPwNone!!";
        }
    }

    @RequestMapping("/api/setSecPw")
    @ResponseBody
    public String setSecPw(@RequestParam("sPw") String sPw){
        String id = SecurityContextHolder.getContext().getAuthentication().getName();

        int setResult = securityMapper.insertSecPw(id, sPw);

        if(setResult > 0){
            return "setSuccess!!";
        }else{
            return "setFail!!";
        }
    }

    @RequestMapping("/api/deleteSecPw")
    @ResponseBody
    public String deleteSecPw(@RequestParam("sPw") String sPw){
        String id = SecurityContextHolder.getContext().getAuthentication().getName();

        int deleteResult = securityMapper.deleteSecPw(id, sPw);

        if(deleteResult > 0){
            return "sPwDeleteSuccess!!";
        }else{
            return "sPwDeleteFail!!";
        }
    }
}
