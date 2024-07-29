package com.inventory.repositories.dao;

import java.util.List;
import java.util.Map;

import com.inventory.repositories.vo.StockVo;

public interface StockDao {
	public List <StockVo> getStockInList (Map <String, String> params);
	public List <StockVo> getStockInDetail(String inId);
	public boolean stockInCheck(Map <String, String> params);
	public boolean confirmStockIn(StockVo vo);
	
	public int getInId (String branchId);
	public int initialStockIn(String orderId, String branchId, String userName);
	
	public List <StockVo> getStockOutList (Map <String, String> params);
	public List <StockVo> getStockOutDetail(String outId);
	public int insertStockOut(Map <String, String> params);
	public int getStockOutId(String branchId);
	public int insertOutDetail(StockVo vo);
	public int confirmStockOut(StockVo vo);
}
