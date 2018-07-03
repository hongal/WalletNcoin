package com.geopia.wallet_ncoin.controller;

import com.geopia.wallet_ncoin.mapper.ReceiveMapper;
import netscape.javascript.JSObject;
import org.apache.jasper.tagplugins.jstl.core.Url;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;


@Controller
public class ReceiveController {

    @Autowired
    ReceiveMapper receiveMapper;

    @RequestMapping("/receive")
    public String getReceivePage(Model model) {

        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String id = auth.getName();
        ArrayList<String> addressList = receiveMapper.getAddressList(id);

        model.addAttribute("addressList", addressList);

        return "tiles/default/receive";
    }

    @RequestMapping(value = "/api/createAddress" , method = RequestMethod.GET)
    @ResponseBody
    String createAddess() throws Exception{
        HttpURLConnection connection = null;

        URL url = new URL("http://api.ncoin.news/newAddress.json");
        connection = (HttpURLConnection) url.openConnection();
        connection.setRequestMethod("GET");

        BufferedReader bufferedReader = new BufferedReader(
                new InputStreamReader(connection.getInputStream()));

        String inputLine;
        StringBuffer response = new StringBuffer();

        while ((inputLine = bufferedReader.readLine()) != null){
            response.append(inputLine);
        }

        bufferedReader.close();
        System.out.println(response.toString());

        JSONObject myResponse = new JSONObject(response.toString());

        String ncoin_address = myResponse.getString("account_id");
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String id = authentication.getName();
        System.out.println("ncoin_address : " + ncoin_address);
        System.out.println("id : " + id);
        int insertResult = receiveMapper.insertAddress(id, ncoin_address);

        if(insertResult > 0){
            return "createSuccess!!";
        }else{
            return "createFail!!";
        }
    }

}
