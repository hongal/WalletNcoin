package com.geopia.wallet_ncoin.controller;


import com.geopia.wallet_ncoin.api.dto.SmsDto;
import com.geopia.wallet_ncoin.mapper.NcoinCustomerMapper;
import com.geopia.wallet_ncoin.mapper.ResetMapper;
import com.geopia.wallet_ncoin.service.SmsService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationTrustResolver;
import org.springframework.security.authentication.AuthenticationTrustResolverImpl;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Random;

@Controller
public class ResetPwController {

    @Autowired
    SmsService smsService;
    @Autowired
    ResetMapper resetMapper;
    @Autowired
    NcoinCustomerMapper ncoinCustomerMapper;

    @RequestMapping("/resetPw")
    public String resetPw(){

        AuthenticationTrustResolver trustResolver = new AuthenticationTrustResolverImpl();

        if(trustResolver.isAnonymous(SecurityContextHolder.getContext().getAuthentication())){
            return "tiles/default/resetPw";
        }else{
            return "redirect:/";
        }

    }

    @RequestMapping(value = "/api/checkSignedHp", method = RequestMethod.POST)
    @ResponseBody
    private String resetSmsSend(@RequestBody SmsDto smsDto) throws Exception{
        System.out.println(smsDto);
        int checkHpRes = resetMapper.checkHp(smsDto.getId(), smsDto.getNum());

        if(checkHpRes > 0){

            int code = new Random().nextInt(10000) + 1000;
            if (code > 10000) {
                code = code - 1000;
            }
            smsDto.setCode(code + "");
            int smsRes = smsService.sendSmsResult(smsDto, "인증번호는 " + code + " 입니다!");
            int updateCodeRes = ncoinCustomerMapper.insertAuthNumber(smsDto);

            if(smsRes > 0 && updateCodeRes > 0){
                return "SmsSendSuccess!!";

            }else{
                return "SmsSendFail!!";
            }

        }else{
            return "WrongInfo!!";
        }
    }

    @RequestMapping(value = "/api/updatePw", method = RequestMethod.POST)
    @ResponseBody
    public String resetPw(@RequestBody SmsDto smsDto) throws Exception{

        int checkRes = ncoinCustomerMapper.chkCode(smsDto);

        System.out.println(smsDto);
        System.out.println(smsDto.getCode());
        System.out.println(smsDto.getNum());

        //인증코드가 맞을경우
        if(checkRes > 0){
            Random rnd = new Random();
            StringBuffer buf =new StringBuffer();

            for(int i=0;i<10;i++){
                if(rnd.nextBoolean()){
                    buf.append((char)((int)(rnd.nextInt(26))+97));
                }else{
                    buf.append((rnd.nextInt(10)));
                }
            }

            System.out.println(buf + "");


            int smsPwSendRes = smsService.sendSmsResult(smsDto, "변경된 비밀번호는 " + buf.toString());

            if(smsPwSendRes > 0){
                int updatePwRes = resetMapper.updatePw(smsDto.getId(), buf.toString());
                if(updatePwRes > 0){
                    return "ChangePwSuccess!!";
                }else{
                    return  "ChangePwFail!!";
                }

            }else{
                return "SendSmsFail!!";
            }
        }else{
            return "CodeChkFail!!";
        }

    }

}
