package com.geopia.wallet_ncoin.controller;

import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import com.geopia.wallet_ncoin.api.dto.SmsDto;
import com.geopia.wallet_ncoin.mapper.MemberMapper;
import com.geopia.wallet_ncoin.service.SmsService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationTrustResolver;
import org.springframework.security.authentication.AuthenticationTrustResolverImpl;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import com.geopia.wallet_ncoin.dto.NcoinCustomerDto;
import com.geopia.wallet_ncoin.mapper.NcoinCustomerMapper;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
public class RegisterController {

	@Autowired
	SmsService smsService;
	@Autowired
	NcoinCustomerMapper ncoincustomermapper;
	@Autowired
	MemberMapper memberMapper;
	
    @RequestMapping("/register")
    public String getRegisterPage(){

        return "tiles/none/register";
    }
    
    @RequestMapping("/signin")
    public String getSignin() {
		AuthenticationTrustResolver trustResolver = new AuthenticationTrustResolverImpl();

		if(trustResolver.isAnonymous(SecurityContextHolder.getContext().getAuthentication())){
			return "tiles/default/signin";
		}else{
			return "redirect:/";
		}

    }
    

	@RequestMapping(method = RequestMethod.POST, value = "/api/addCustomer")
	@ResponseBody
	public String addCustomer(@RequestBody NcoinCustomerDto customerdto) {
		int result = ncoincustomermapper.addcustomer(customerdto);

		if(result > 0){
			System.out.print("success");
			return "addSuccess!!";
		}else{
			return "addFail";
		}
	}

	@RequestMapping(method = RequestMethod.GET, value = "/api/idDuplicateChk")
	@ResponseBody
	public String idDuplicateChk(@RequestParam("id")String id){

    	int result = ncoincustomermapper.idDuplicateChk(id);
    	if(result > 0){
			return "idDuplicated";
		}else{
			return "idUseable";
		}
	}

	@RequestMapping("/api/hpDuplicateChk")
	@ResponseBody
	public String chkDupHp(@Param("phone") String phone){

    	int hpChkRes = memberMapper.checkHp(phone);

    	if(hpChkRes > 0){
    		return "HpDuplicated!!";
		}else{
			return "HpNotDuplictaed!!";
		}
	}

	//문자 전송 후 db입력
	@RequestMapping(method = RequestMethod.POST, value = "/api/sendSms")
	@ResponseBody
	public String smsSend(@RequestBody SmsDto smsDto) throws Exception{
    	//?id=geopia&pwd=wldhsms&code=$code&snum=027868200&rnum=$mobile&msg=$msg&userid=geopia&ipAddr=$_SERVER[REMOTE_ADDR]
		int code = new Random().nextInt(10000) + 1000;
		if (code > 10000) {
			code = code - 1000;
		}

		smsDto.setCode(code + "");

		int connectionResult = smsService.sendSmsResult(smsDto, "Ncoin 인증번호는 " + smsDto.getCode() + " 입니다 ");

		if(connectionResult == 200){
			int result = ncoincustomermapper.insertAuthNumber(smsDto);
			if(result > 0){
				return "sendSuccess!!";
			}else{
				return "insertFail";
			}

		}else{
			System.out.print(connectionResult + "");
			return "fail";
		}

	}

	//인증하기
	@RequestMapping(value = "/api/chkCode", method = RequestMethod.POST)
	@ResponseBody
	public String chkOtp(@RequestBody SmsDto smsDto){
		int result = ncoincustomermapper.chkCode(smsDto);

		if(result > 0){
			return "codeChkSuccess!!";
		}else{
			return "codeChkFailed!!";
		}
	}

}
