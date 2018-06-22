package com.geopia.wallet_ncoin.controller;

import com.geopia.wallet_ncoin.api.dto.SmsDto;
import com.geopia.wallet_ncoin.mapper.MemberMapper;
import com.geopia.wallet_ncoin.mapper.NcoinCustomerMapper;
import com.geopia.wallet_ncoin.service.SmsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Random;

@Controller
public class MemberController {

    @Autowired
    MemberMapper memberMapper;
    @Autowired
    SmsService smsService;
    @Autowired
    NcoinCustomerMapper ncoincustomermapper;

    @RequestMapping("/member/modify")
    public String getModifyPage(){

        return "tiles/default/modify";
    }

    @RequestMapping(value = "/api/changePw", method = RequestMethod.GET)
    @ResponseBody
    public String changePw(@RequestParam("password") String password){
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String id = authentication.getName();

        int result = memberMapper.changePassword(id, password);
        if (result > 0){
            return "pwChangeSuccess!!";
        }else{
            return "pwChangeFail!!";
        }

    }

    @RequestMapping(value = "/api/changeHp", method = RequestMethod.GET)
    @ResponseBody
    public String changeHp(@RequestParam("phone") String phone){
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String id = authentication.getName();

        int result = memberMapper.changeHp(id, phone);

        if(result > 0){
            return "HpChangeSuccess!!";
        }else{
            return "HpChangeFail!!";
        }
    }

    @RequestMapping(value = "/api/checkHp", method = RequestMethod.POST)
    @ResponseBody
    public String checkHp(@RequestBody SmsDto smsDto, HttpServletResponse response) throws Exception {
        int code = new Random().nextInt(10000) + 1000;
        if (code > 10000) {
            code = code - 1000;
        }

        smsDto.setCode(code + "");


        String phone = smsDto.getNum();
        int result = memberMapper.checkHp(phone);

        System.out.println(result);
        if(result > 0){
            return "HpDuplicated!!";
        }else{


            int connectionResult = smsService.sendSmsResult(smsDto, "Ncoin 인증번호는 " + smsDto.getCode() + " 입니다 ");


            if(connectionResult == 200){
                int insertHpResult = ncoincustomermapper.insertAuthNumber(smsDto);

                if(insertHpResult>0){
                    return "HpCheckComplete!!";
                }else{
                    return "HpCheckFail!!";
                }
            }else{
                System.out.print(connectionResult + "");
                return "sendFail!!";
            }

        }
    }


}

