package com.geopia.wallet_ncoin.service;

import com.geopia.wallet_ncoin.api.dto.SmsDto;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

@Service
public class SmsService {

    public int sendSmsResult(SmsDto smsDto, String message) throws Exception{

        String link = "http://api.geopia.com/sms/sms.php";
        URL url = new URL(link);
        HttpURLConnection connection = (HttpURLConnection) url.openConnection();

        connection.setRequestMethod("GET");
        Map<String, String> parameters = new HashMap<>();
        parameters.put("id", "geopia");
        parameters.put("pwd", "wldhsms");
        parameters.put("code", "ncoin_joinSms");
        parameters.put("snum", "027868200");
        parameters.put("rnum", smsDto.getNum());
        parameters.put("msg", message);
        if(smsDto.getId() == null){
            parameters.put("userid", SecurityContextHolder.getContext().getAuthentication().getName());
        }else{
            parameters.put("userid", smsDto.getId());
        }
        parameters.put("ipAddr", smsDto.getIp_addr());

        StringBuilder stringBuilder = new StringBuilder();

        for(Map.Entry<String, String> entry : parameters.entrySet()){
            stringBuilder.append(URLEncoder.encode(entry.getKey(), "EUC-KR"));
            stringBuilder.append("=");
            stringBuilder.append(URLEncoder.encode(entry.getValue(), "EUC-KR"));
            stringBuilder.append("&");
        }

        String paramsResult = stringBuilder.toString();
        System.out.println(paramsResult);
        connection.setDoOutput(true);

        OutputStream outputStream = connection.getOutputStream();
        outputStream.write(paramsResult.getBytes("EUC-KR"));
        outputStream.flush();
        outputStream.close();
        connection.connect();

        return connection.getResponseCode();
    }
}
