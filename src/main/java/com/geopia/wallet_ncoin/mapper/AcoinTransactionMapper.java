package com.geopia.wallet_ncoin.mapper;

import com.geopia.wallet_ncoin.api.dto.TradeListDto;
import org.apache.ibatis.annotations.Mapper;

import com.geopia.wallet_ncoin.dto.AcoinTransactionsDto;
import com.sn.common.pagination.PagedList;
import com.sn.common.pagination.PagingRowBounds;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.ArrayList;

@Mapper
public interface AcoinTransactionMapper {

	public void addTransaction(AcoinTransactionsDto transactionDTO) throws RuntimeException;
	public PagedList<AcoinTransactionsDto> queryPageTransactioninfo(PagingRowBounds bounds) throws RuntimeException;
	public PagedList<AcoinTransactionsDto> queryPageTransactioninfobyHash(String transaction_hash, PagingRowBounds bounds) throws RuntimeException;
	public PagedList<AcoinTransactionsDto> queryPageTransactioninfobyLedgerindex(Integer ledger_index, PagingRowBounds bounds) throws RuntimeException;
	public PagedList<AcoinTransactionsDto> queryPageTransactioninfobyAccountSend(String account, PagingRowBounds bounds) throws RuntimeException;
	public PagedList<AcoinTransactionsDto> queryPageTransactioninfobyAccountReceive(String account, PagingRowBounds bounds) throws RuntimeException;
	@Select("Select ncoin_address from ncoin_address_info where id = #{id}")
	ArrayList<String> getAddress(String id);


	@Select("SELECT account, destination, amount, DATE_FORMAT(reg_date, '%m:%d %H:%i') as reg_date FROM wiz_acoin_transactions " +
			"where destination = #{account} or account = #{account} order by reg_date desc")
	ArrayList<TradeListDto> getTradeLog(@Param("account") String account);

/*	@Select("SELECT * FROM wiz_acoin_transactions where destination = #{account} or account = #{account}")
	ArrayList<TradeListDto> getTradeLog(String account);*/
}
