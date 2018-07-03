package com.geopia.wallet_ncoin.controller;

import com.geopia.wallet_ncoin.mapper.SecurityMapper;
import com.sun.xml.internal.ws.api.ha.StickyFeature;
import org.apache.commons.codec.binary.Base32;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Random;

@Controller
public class SecurityController {

    @Autowired
    SecurityMapper securityMapper;

    @RequestMapping("/security")
    public String getSecurityPage(Model model){
        String id = SecurityContextHolder.getContext().getAuthentication().getName();

        String otp_key = securityMapper.getOtpKey(id);

        ArrayList<String> arrayList = new ArrayList<>();
        arrayList.add(id + "@ncoin.com");
        arrayList.add(otp_key);

        model.addAttribute("otpInfo", arrayList);

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

    @RequestMapping("/api/createOtp")
    @ResponseBody
    public ArrayList<String> createOtp(){
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String id = authentication.getName();
        // Allocating the buffer
//      byte[] buffer = new byte[secretSize + numOfScratchCodes * scratchCodeSize];
        byte[] buffer = new byte[5 + 5 * 5];

        // Filling the buffer with random numbers.
        // Notice: you want to reuse the same random generator
        // while generating larger random number sequences.
        new Random().nextBytes(buffer);

        // Getting the key and converting it to Base32
        Base32 codec = new Base32();
//      byte[] secretKey = Arrays.copyOf(buffer, secretSize);
        byte[] secretKey = Arrays.copyOf(buffer, 5);
        byte[] bEncodedKey = codec.encode(secretKey);

        // 생성된 Key!
        String encodedKey = new String(bEncodedKey);

        System.out.println("encodedKey : " + encodedKey);

        ArrayList<String> arrayList = new ArrayList<>();

        arrayList.add(id + "@ncoin.com");
        arrayList.add(encodedKey);

        int insertResult = securityMapper.insertOTP(id, encodedKey);

        if(insertResult > 0){
            return arrayList;
        }else{
            return null;
        }
    }

    @RequestMapping("/api/deleteOTP")
    @ResponseBody
    public String deleteOTP(){
        String id = SecurityContextHolder.getContext().getAuthentication().getName();
        int deleteResult = securityMapper.deteteOTP(id);

        if(deleteResult > 0){
            return "deleteSuccess!!";
        }else{
            return "deleteFail!!";
        }
    }



}
