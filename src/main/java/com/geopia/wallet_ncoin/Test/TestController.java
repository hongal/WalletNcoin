package com.geopia.wallet_ncoin.Test;

import java.net.MalformedURLException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.geopia.wallet_ncoin.api.dto.HistoryTransactionResultDto;
import com.geopia.wallet_ncoin.domain.AcoinAddressVO;
import com.geopia.wallet_ncoin.mapper.AcoinAddressMapper;
import com.geopia.wallet_ncoin.util.GsonUTCDateAdapter;
import com.geopia.wallet_ncoin.util.apiTask;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

@Controller
@Component
public class TestController {
    @Value("${spring.application.name}")
    String appName;
    Gson gson = new GsonBuilder().registerTypeAdapter(Date.class, new GsonUTCDateAdapter()).create();

    @RequestMapping("/test")
    public String ssss(Model model){
      
    	try {
    		HashMap map = new HashMap();
    		map.put("address", "NHb3CJAWyw4Nj31VRWh36UkukG4b9dtyTs");
    		map.put("limit", 10);
    		map.put("pageNo", 1);
    		
			String ret = apiTask.sendApiCall(apiTask.method_history_transaction, map);
			HistoryTransactionResultDto dto = gson.fromJson(ret, HistoryTransactionResultDto.class);
			System.out.println(dto.getList().size());
			apiTask.sign("NHb3CJAWyw4Nj31VRWh36UkukG4b9dtyTs", "1000000", "NL1h2BBqmBoemDQyQtaDxdkEMwBXVF5A6f", "phoPwNXtMeMyMHBVTgbuqAag1SBTb", null, "100000");
			
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        return "tiles/none/login";
    }
    
}
