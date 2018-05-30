package com.geopia.wallet_ncoin.util;
import java.io.BufferedReader;
import java.io.Closeable;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.math.BigDecimal;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.security.SecureRandom;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.TimeZone;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.crypto.codec.Hex;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.google.gson.JsonSyntaxException;
import com.wiz.android.acoin.WalletImpl;
import com.wiz.android.acoin.WalletLibApi;
import com.geopia.wallet_ncoin.mapper.AcoinAddressMapper;
import com.geopia.wallet_ncoin.dto.AcoinAddressinfoDto;
import com.geopia.wallet_ncoin.dto.AcoinTransactionsDto;
import com.geopia.wallet_ncoin.dto.LedgerDto;
import com.geopia.wallet_ncoin.jsonrpc.dto.AccountDataDto;
import com.geopia.wallet_ncoin.jsonrpc.dto.JsonLedgerDto;
import com.geopia.wallet_ncoin.jsonrpc.dto.JsonRPCAccountTxDto;
import com.geopia.wallet_ncoin.jsonrpc.dto.JsonRPCAccountTxResultDto;
import com.geopia.wallet_ncoin.jsonrpc.dto.JsonRPCDto;
import com.geopia.wallet_ncoin.jsonrpc.dto.JsonRPCWallet_proposeDto;
import com.geopia.wallet_ncoin.jsonrpc.dto.jsonRPCTransactionDto;

public class apiTask {
	private static final Logger LOGGER = LoggerFactory.getLogger(apiTask.class);

	 public static final String RPCURL = "http://13.125.128.108:8080/Test";
	 public static final String APIURL = "http://api.ncoin.news/";
	 
	 public static final String method_history_transaction = "history_transaction.json";
	 public static final String method_newAddress = "newAddress.json";
	 public static final String method_getAccountInfo = "getAccountInfo.json";
	 public static final String method_transaction_submit = "transaction_submit.json";
	 
	 private static int jsonIdSequence = 1;
	 private static Gson gson = new Gson();
	 private static Map<String, AcoinTransactionsDto> map = new HashMap();
	 
	@Autowired
	private AcoinAddressMapper addressinfoDao;
	
	public static void main(String[] args)throws Exception {
		
			System.out.println(account_info(apiTask.RPCURL, "AUdkzBCDQMRi6oGhrzhwUiiVYkJwECWGKd"));
			System.out.println();
			System.out.println(getAccountTxinfo("AUdkzBCDQMRi6oGhrzhwUiiVYkJwECWGKd").getResult());
	}

	public static void ssmain(String[] args) throws Exception {
		System.out.println(account_info(apiTask.RPCURL, "AUWWHA135dvKYRt6TYBgd7JGBmTVpj5n6u"));
		
//		System.out.println(getAccountTxinfo("ApjWNFV1DTV18nJKPJ1X31YUEyQNfGeYrW").getResult().get);
	
//		System.out.println(getAccountTxinfo("AUWWHA135dvKYRt6TYBgd7JGBmTVpj5n6u").getResult().getStatus());
		
	}
	
	
	public static JsonRPCDto getServerInfo() throws Exception{
		List<Map> params = new ArrayList<Map>();
        Map<String, Object> param = new HashMap<String, Object>();
        String ret = sendJsonRpc("server_info", params, RPCURL, "", "");
        System.out.println(ret);
        JsonRPCDto dto=gson.fromJson(ret, JsonRPCDto.class);
//        System.out.println(dto);
        return dto;
	}
	
	public static JsonRPCWallet_proposeDto getNew_Account() throws Exception{
		List<Map> params = new ArrayList<Map>();
        Map<String, Object> param = new HashMap<String, Object>();
        String ret = sendJsonRpc("wallet_propose", params, RPCURL, "", "");
        System.out.println(ret);
        JsonRPCWallet_proposeDto dto=gson.fromJson(ret, JsonRPCWallet_proposeDto.class);
//        System.out.println(dto);
        return dto;
	}
	
	public static AcoinAddressinfoDto getAccountInfo(String account) throws Exception{
		List<Map> params = new ArrayList<Map>();
        Map<String, Object> param = new HashMap<String, Object>();
        String ret = account_info(RPCURL, account);
        JsonParser parser = new JsonParser();
		JsonElement element = parser.parse(ret);
		JsonObject jsonresult = element.getAsJsonObject().getAsJsonObject("result");
		BigDecimal amount = jsonresult.getAsJsonObject("account_data").get("Balance").getAsBigDecimal();
		String sequence = jsonresult.getAsJsonObject("account_data").get("Sequence").getAsString();
		AcoinAddressinfoDto accountinfo = new AcoinAddressinfoDto(account, amount);
		accountinfo.setSequence(sequence);
		return accountinfo;
	}
	
	
	public static JsonRPCDto getPeerList() throws Exception{
		List<Map> params = new ArrayList<Map>();
        Map<String, Object> param = new HashMap<String, Object>();
        String ret = sendJsonRpc("peers", params, RPCURL, "", "");
        JsonRPCDto dto=gson.fromJson(ret, JsonRPCDto.class);
        return dto;
	}
	
	public static JsonRPCAccountTxDto getAccountTxinfo(String account) throws Exception{
		List<Map> params = new ArrayList<Map>();
        Map<String, Object> param = new HashMap<String, Object>();
        param.put("account",  account);
        param.put("binary",  false);
        param.put("forward",  false);
        param.put("ledger_index_max",  -1);
        param.put("ledger_index_min",  -1);
        param.put("limit", 100);
        params.add(param);
        String ret = sendJsonRpc("account_tx", params, RPCURL, "", "");
        LOGGER.debug("param :"+ ret);
        JsonRPCAccountTxDto dto=gson.fromJson(ret, JsonRPCAccountTxDto.class);
        LOGGER.debug("dto :"+ dto);
        
        return dto;
	}
	
	 public static jsonRPCTransactionDto tx_retrieve(String transaction_hash) throws Exception {

	        List<Map> params = new ArrayList<Map>();
	        Map<String, Object> param = new HashMap<String, Object>();
	        param.put("transaction",  transaction_hash);
	        param.put("binary", false);
	        params.add(param);
	        String ret = sendJsonRpc("tx", params, RPCURL, "", "");
	       
	        jsonRPCTransactionDto dto=gson.fromJson(ret, jsonRPCTransactionDto.class);
	        return dto;
	 }
	 
	 public static JsonLedgerDto ledger_retrieve(String ledger_hash) throws Exception {
		 String ret = get_ledger_by_hash_expand(RPCURL, ledger_hash);
		 
		 JsonLedgerDto dto = gson.fromJson(ret, JsonLedgerDto.class);
		 
		 return dto;
	 }
	
	
	
	
	
	
	 public static String account_info(String url, String account) throws Exception {

	        List<Map> params = new ArrayList<Map>();
	        Map<String, Object> param = new HashMap<String, Object>();
	        param.put("account",  account);
	        param.put("strict", true);
	        param.put("ledger_index",  "current");
	        param.put("queue",  false);
	        params.add(param);
	        String ret = sendJsonRpc("account_info", params, url, "", "");
	        return ret;
	  }
	
	        
	 public static String tx_history(String url, int skipover) throws Exception {

	        List<Map> params = new ArrayList<Map>();
	        Map<String, Object> param = new HashMap<String, Object>();
	        param.put("start",  skipover);
	        params.add(param);
	        String ret = sendJsonRpc("tx_history", params, url, "", "");
	        return ret;
	  }
	 
	 public static String sign(String Account
	            ,String amount,String Destination,String sec,String memoStr,String fee) {
		 WalletLibApi api = new WalletImpl();
		 Map<String, Object> tx_json = new HashMap<String, Object>();
	     tx_json.put("Account", Account);
	     tx_json.put("Amount", amount);
	     tx_json.put("Destination",Destination);
	     tx_json.put("TransactionType","Payment");
	     tx_json.put("Fee",fee);
	     if(memoStr!=null) {
	        List<Map> memoList=new ArrayList<Map>();
		        
		    Map<String,String> memo=new HashMap<String,String>();
		    memo.put("MemoType", "687474703a2f2f6578616d706c652e636f6d2f6d656d6f2f67656e65726963");
		    memo.put("MemoData", String.copyValueOf(Hex.encode(memoStr.getBytes())));
			        	
		    Map<String,Object> memos=new HashMap<String,Object>();
		    memos.put("Memo",  memo);
		    memoList.add(memos);
		    tx_json.put("Memos", memoList);
	     }
	     
	     String accountInfo = null;
		try {
			accountInfo = apiTask.account_info(apiTask.RPCURL, Account);
			} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
			
	     JsonRPCDto dot=gson.fromJson(accountInfo, JsonRPCDto.class);
	     AccountDataDto dto=dot.getResult().getAccount_data();
	     String Sequence=dto.getSequence();
	     tx_json.put("Sequence", Sequence);
	     		
	     
	     String tx_blob = null;
	     try {
			tx_blob = api.sign(sec, gson.toJson(tx_json));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	     
	     
	     return tx_blob;
	     
	 }
	 
	
	 
	 
	 public static String payMents(String url,String Account
	            ,String amount,String Destination,String Sequence,String sec,String memoStr,String fee) throws Exception {

	        System.err.println("Account:"+Account);
	        System.err.println("amount:"+amount);
	        System.err.println("Destination:"+Destination);
	        System.err.println("Sequence:"+Sequence);
	        System.err.println("sec:"+sec);
	        System.err.println("memo:"+memoStr);
	        System.err.println("fee"+fee);

	        Map<String, Object> tx_json = new HashMap<String, Object>();
	        tx_json.put("Account", Account);
	        tx_json.put("Amount", Integer.parseInt(amount));
	        tx_json.put("Destination",Destination);
	        tx_json.put("TransactionType","Payment");
	        tx_json.put("Fee",fee);
	        if(memoStr!=null) {
	        	List<Map> memoList=new ArrayList<Map>();
		        
		        Map<String,String> memo=new HashMap<String,String>();
		        memo.put("MemoType", "687474703a2f2f6578616d706c652e636f6d2f6d656d6f2f67656e65726963");
		        memo.put("MemoData", String.copyValueOf(Hex.encode(memoStr.getBytes())));
			        	
		        Map<String,Object> memos=new HashMap<String,Object>();
		        memos.put("Memo",  memo);
		        memoList.add(memos);
		        tx_json.put("Memos", memoList);
	        }
	        
	        
	        List<Map> params = new ArrayList<Map>();
	        Map<String, Object> param = new HashMap<String, Object>();
//			param.put("offline", false);
	        param.put("secret", sec);
	        param.put("tx_json",tx_json);
	        param.put("fee_mult_max",1);

	        params.add(param);
	        String ret = sendJsonRpc("sign", params, url, "", "");
	        Map retObj=gson.fromJson(ret,HashMap.class);
	        Map retulstObj=(Map) retObj.get("result");
	      
	        params.clear();
	        param.clear();
	        param.put("tx_blob",retulstObj.get("tx_blob"));
	        params.add(param);

	        ret = sendJsonRpc("submit", params, url, "", "");

	        return ret;
	    }
	 
	 
	 
	 public static String payMents(String url,String Account
	            ,String amount,String Destination,String Sequence,String sec) throws Exception {

	        System.err.println("Account:"+Account);
	        System.err.println("amount:"+amount);
	        System.err.println("Destination:"+Destination);
	        System.err.println("Sequence:"+Sequence);
	        System.err.println("sec:"+sec);

	        Map<String, Object> tx_json = new HashMap<String, Object>();
	        tx_json.put("Account", Account);
	        tx_json.put("Amount", Integer.parseInt(amount));
	        tx_json.put("Destination",Destination);
	        tx_json.put("TransactionType","Payment");

	        List<Map> params = new ArrayList<Map>();
	        Map<String, Object> param = new HashMap<String, Object>();
//			param.put("offline", false);
	        param.put("secret", sec);
	        param.put("tx_json",tx_json);
	        param.put("fee_mult_max",1);

	        params.add(param);
	        String ret = sendJsonRpc("sign", params, url, "", "");
	        Map retObj=gson.fromJson(ret,HashMap.class);
	        Map retulstObj=(Map) retObj.get("result");
	       
	        params.clear();
	        param.clear();
	        param.put("tx_blob",retulstObj.get("tx_blob"));
	        params.add(param);

	        ret = sendJsonRpc("submit", params, url, "", "");

	        return ret;
	    }
	 
		public static String submit(String tx_blob) throws Exception {
			List<Map> params = new ArrayList<Map>();
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("tx_blob",  tx_blob);
			params.add(param);
			String ret = sendJsonRpc("submit", params, RPCURL, "", "");
			return ret;
		}
	 
	 public static String ledger(String url) throws Exception {

	        List<Map> params = new ArrayList<Map>();
	        Map<String, Object> param = new HashMap<String, Object>();
	        param.put("ledger_index",  "validated");
	        param.put("accounts", false);
	        param.put("full", true);
	        param.put("transactions", false);
	        param.put("expand",  false);
	        param.put("owner_funds",  false);
	        params.add(param);
	        String ret = sendJsonRpc("ledger", params, url, "", "");
	        return ret;
	    }
	 
	 public static String ledger_current(String url) throws Exception {

	        List<Map> params = new ArrayList<Map>();
	        Map<String, Object> param = new HashMap<String, Object>();
	        param.put("ledger_index",  "validated");
	        param.put("accounts", false);
	        param.put("full", false);
	        param.put("transactions", true);
	        param.put("expand",  false);
	        param.put("owner_funds",  false);
	        params.add(param);
	        String ret = sendJsonRpc("ledger", params, url, "", "");
	        return ret;
	    }
	 
	 public static String get_ledger_by_hash(String url, String ledger_hash) throws Exception {

	        List<Map> params = new ArrayList<Map>();
	        Map<String, Object> param = new HashMap<String, Object>();
	        param.put("ledger_hash",  ledger_hash);
	        param.put("accounts", false);
	        param.put("full", false);
	        param.put("transactions", true);
	        param.put("expand",  false);
	        param.put("owner_funds",  false);
	        params.add(param);
	        String ret = sendJsonRpc("ledger", params, url, "", "");
	        return ret;
	    }
	 
	 public static String get_ledger_by_hash_expand(String url, String ledger_hash) throws Exception {

	        List<Map> params = new ArrayList<Map>();
	        Map<String, Object> param = new HashMap<String, Object>();
	        param.put("ledger_hash",  ledger_hash);
	        param.put("accounts", false);
	        param.put("full", false);
	        param.put("transactions", true);
	        param.put("expand",  true);
	        param.put("owner_funds",  false);
	        params.add(param);
	        String ret = sendJsonRpc("ledger", params, url, "", "");
	        return ret;
	    }
	 
	 public static ArrayList<LedgerDto> get_recent_ledger(int count) {
		 JsonParser parser = new JsonParser();
		 JsonElement element;
		 ArrayList<LedgerDto> resultLedgerList = new ArrayList<LedgerDto>();
		
			try {
				element = parser.parse(ledger_current(RPCURL));
				JsonObject ledgerresult = element.getAsJsonObject().getAsJsonObject("result").getAsJsonObject("ledger");
				LedgerDto eachElement = new LedgerDto(); 
				String block_hash = ledgerresult.get("ledger_hash").getAsString();
				String parent_hash = ledgerresult.get("parent_hash").getAsString();
				eachElement.setBlock_hash(block_hash);
				eachElement.setParent_hash(parent_hash);
				resultLedgerList.add(eachElement);
				for (int i = 1; i < count; i++) {
					element = parser.parse(get_ledger_by_hash(RPCURL, parent_hash));
					ledgerresult = element.getAsJsonObject().getAsJsonObject("result").getAsJsonObject("ledger");
					eachElement = new LedgerDto();
					block_hash = ledgerresult.get("ledger_hash").getAsString();
					parent_hash = ledgerresult.get("parent_hash").getAsString();
					eachElement.setBlock_hash(block_hash);
					eachElement.setParent_hash(parent_hash);
					eachElement.setTransaction(gson.fromJson(ledgerresult.getAsJsonArray("transactions").toString(),ArrayList.class));
					eachElement.setTransaction_count(gson.fromJson(ledgerresult.getAsJsonArray("transactions").toString(),ArrayList.class).size());
					resultLedgerList.add(eachElement);
				}
				
			} catch (JsonSyntaxException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
				
			 
		return resultLedgerList;
		 
		 
	 }
	 
	 
	 
	 public LinkedHashMap<String, AcoinTransactionsDto> parse_tx_result_all() {
		 LinkedHashMap<String, AcoinTransactionsDto> parse_all_result = new LinkedHashMap<>();
		 try {
			 for(int i = 0; parse_tx_result(tx_history(RPCURL, i * 20)) != null; i++) {
				 parse_all_result.putAll(parse_tx_result(tx_history(RPCURL, i*20)));
			 }
			 return parse_all_result;
		 }
		 catch(Exception e) {
			 e.printStackTrace();
		 }
		return parse_all_result;
	 }
	 
	
	 
	 
	 public LinkedHashMap<String, AcoinTransactionsDto> parse_tx_result(String result) {
		 JsonParser parser = new JsonParser();
		 JsonElement element = parser.parse(result);
		 JsonObject jsonresult = element.getAsJsonObject().getAsJsonObject("result");
		 if (jsonresult.get("txs").isJsonNull())
			 return null;
		 else {
			 JsonArray txarrayresult = jsonresult.getAsJsonArray("txs");
			 Iterator<JsonElement> txiterator = txarrayresult.iterator();
			 LinkedHashMap<String, AcoinTransactionsDto> transactionsList = new LinkedHashMap<>();
			 while(txiterator.hasNext()) {
				 JsonElement eachElement = txiterator.next();
				 
				 String transaction_type = eachElement.getAsJsonObject().get("TransactionType").getAsString();
				 if (transaction_type.compareTo("Payment") == 0) {
					 String account = eachElement.getAsJsonObject().get("Account").getAsString();
					 BigDecimal amount =new BigDecimal("0");
					 try {
						 amount=BigDecimal.valueOf(Long.valueOf(eachElement.getAsJsonObject().get("Amount").getAsString()));;
					 }catch (Exception e) {
						 LOGGER.error(e.getMessage(),e);
					 }
				
					 String destination = eachElement.getAsJsonObject().get("Destination").getAsString();
					 BigDecimal fee = BigDecimal.valueOf(Long.valueOf(eachElement.getAsJsonObject().get("Fee").getAsString()));
					 String flags = eachElement.getAsJsonObject().get("Flags").getAsString();
					 int seq = eachElement.getAsJsonObject().get("Sequence").getAsInt();
					 String sign_pubkey = eachElement.getAsJsonObject().get("SigningPubKey").getAsString();
					 String sign = eachElement.getAsJsonObject().get("TxnSignature").getAsString();
					 String transaction_hash = eachElement.getAsJsonObject().get("hash").getAsString();
					 int ledger_index = eachElement.getAsJsonObject().get("ledger_index").getAsInt();
					 
					 
					 
					 
					 AcoinTransactionsDto acointransactionsdto = new AcoinTransactionsDto(ledger_index, fee, flags, seq, 
							 sign_pubkey, transaction_type, sign, transaction_hash, amount, destination, account);
					 transactionsList.put(transaction_hash, acointransactionsdto);
					 return transactionsList;
				 }
			 }
		 }
		return null;
	 }
	public static String sendApiCall(String method,HashMap parameters) throws MalformedURLException {
		BufferedReader rd = null;
	    String jsonText = "";
	    OutputStreamWriter wr = null;
	    URLConnection conn = null;
		Map apiwrapper = new HashMap();
		if (parameters != null)
			apiwrapper.putAll(parameters);
		 try {
			URL url = new URL(APIURL + method);
			conn = url.openConnection();
			String basicAuth = "Basic ";
			conn.setRequestProperty("Authorization", basicAuth);
	        conn.setRequestProperty("Content-Type", "application/json");
	        conn.setDoOutput(true);

	        wr = new OutputStreamWriter(conn.getOutputStream());

	        String sendJson = gson.toJson(apiwrapper);
	        wr.write(sendJson);
            wr.flush();
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String line;
            while ((line = rd.readLine()) != null) {
                jsonText += line;
            }
            rd.close();
	        
		} 
		 catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
            close(rd);
            close(wr);
        } 
		return (jsonText);
		
	}
	 
	public static String sendJsonRpc(String method, List parameters, String rpxcurl, String rpcName, String rpcPwd)
            throws Exception {
        BufferedReader rd = null;
        String jsonText = "";
        OutputStreamWriter wr = null;
        URLConnection conn = null;
        try {
            Map rpc = new HashMap();
            rpc.put("method", method);
            if (parameters != null && parameters.size() > 0) {
                rpc.put("params", parameters);
            }
            rpc.put("id", jsonIdSequence++ + "");
            rpc.put("jsonrpc", 1.0 + "");

            String tracUrl = rpxcurl;
            String tracUsername = rpcName;
            String tracPassword = rpcPwd;

            URL url = new URL(tracUrl);
            conn = url.openConnection();
            String userpass = tracUsername + ":" + tracPassword;
            String basicAuth = "Basic ";
            conn.setRequestProperty("Authorization", basicAuth);
            conn.setRequestProperty("Content-Type", "application/json");
            conn.setDoOutput(true);

            wr = new OutputStreamWriter(conn.getOutputStream());

            String sendJson = gson.toJson(rpc);
            wr.write(sendJson);
            wr.flush();

            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String line;

            while ((line = rd.readLine()) != null) {
                jsonText += line;
            }
            rd.close();
        } finally {
            close(rd);
            close(wr);
        }
        if (LOGGER.isDebugEnabled()) {
			LOGGER.debug("jsonText ret: {}", jsonText);
		}
        return (jsonText);
    }
	
	public static void close(Closeable closeable) {
		if(closeable!=null) {
			try {
				closeable.close();
			}catch (Exception e) {
				// TODO: handle exception
			}
		}
	}
	
	
	
	
}
