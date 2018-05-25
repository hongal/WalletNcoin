package com.geopia.wallet_ncoin.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.geopia.wallet_ncoin.dto.AcoinTransactionsDto;
import com.sn.common.pagination.PagedList;
import com.sn.common.pagination.PagingRowBounds;

@Mapper
public interface AcoinTransactionMapper {

	public void addTransaction(AcoinTransactionsDto transactionDTO) throws RuntimeException;
	public PagedList<AcoinTransactionsDto> queryPageTransactioninfo(PagingRowBounds bounds) throws RuntimeException;
	public PagedList<AcoinTransactionsDto> queryPageTransactioninfobyHash(String transaction_hash, PagingRowBounds bounds) throws RuntimeException;
	public PagedList<AcoinTransactionsDto> queryPageTransactioninfobyLedgerindex(Integer ledger_index, PagingRowBounds bounds) throws RuntimeException;
	public PagedList<AcoinTransactionsDto> queryPageTransactioninfobyAccountSend(String account, PagingRowBounds bounds) throws RuntimeException;
	public PagedList<AcoinTransactionsDto> queryPageTransactioninfobyAccountReceive(String account, PagingRowBounds bounds) throws RuntimeException;

}
