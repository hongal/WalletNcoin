package com.geopia.wallet_ncoin.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.geopia.wallet_ncoin.dto.AcoinTransactionsDto;
import com.geopia.wallet_ncoin.mapper.AcoinTransactionMapper;
import com.sn.common.pagination.PagedList;
import com.sn.common.pagination.PagingRowBounds;


@Controller
public class TransListController {
	
	@Autowired
	AcoinTransactionMapper acointransactionmapper;
	
    @RequestMapping("/listtransactions")
    public String getTransListPage(){

        return "tiles/none/tradeLog";
    }
    
    @RequestMapping("/tradeLog")
	public String viewSendMoney(Map<String, Object> param, ModelMap  mv, PagingRowBounds bounds, HttpServletRequest request) {
		String current_account = "NHb3CJAWyw4Nj31VRWh36UkukG4b9dtyTs";
		String type = request.getParameter("type") != null ? request.getParameter("type") : "";
		String searchType = request.getParameter("searchType") != null ? request.getParameter("searchType") : "";
		String query = request.getParameter("query") != null ? request.getParameter("query") : "";
		
		PagedList<AcoinTransactionsDto> list = null;
		if (type.compareTo("send") == 0)
		{
			System.out.println(type);
			list = acointransactionmapper.queryPageTransactioninfobyAccountSend(current_account, bounds);
		}
		else {
			System.out.println(type);
			list = acointransactionmapper.queryPageTransactioninfobyAccountReceive(current_account, bounds);
		}
		
		
		Integer pageNo = bounds.getPageNo();
		Integer limitCnt = bounds.getLimit();
		
		Integer seqNoStart = (pageNo * limitCnt) - limitCnt;
		
		
		Integer totalCnt = list.size();
		
		if (totalCnt < limitCnt * pageNo)
		{
			limitCnt = totalCnt % limitCnt;
		}
		for (int i = 0; i < limitCnt; i++) {
			AcoinTransactionsDto dto = list.get(i);
			dto.setRow_num(totalCnt - seqNoStart - i);
		}
		mv.addAttribute("page", list.getPager());
		mv.addAttribute("list", list);
		
		return "tiles/none/tradeLog";
	}

	

}
