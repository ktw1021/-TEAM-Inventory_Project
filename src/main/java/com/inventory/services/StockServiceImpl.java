package com.inventory.services;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.inventory.repositories.dao.StockDao;
import com.inventory.repositories.vo.StockVo;

@Service("StockService")
public class StockServiceImpl implements StockService {

	@Autowired
	StockDao stockDao;
	
	@Override
	public List<StockVo> getStockInList(Map<String, String> params) {
		List<StockVo>list = stockDao.getStockInList(params); 
		return list;
	}

	@Override
	public List<StockVo> getStockInDetail(String inId) {
		List<StockVo>list = stockDao.getStockInDetail(inId);
		return list;
	}
	
	@Override
	public boolean stockInCheck(String inId, String userName) {
		Map <String, String> params = new HashMap <>();
		params.put("userName", userName);
		params.put("inId", inId);
		return stockDao.stockInCheck(params);
	}

	@Override
	public boolean confirmStockIn(StockVo vo) {
		return stockDao.confirmStockIn(vo);
	}

	@Override
	public int getInId(String branchId) {
		return stockDao.getInId(branchId);
	}

	@Override
	public int initialStockIn(String orderId, String branchId, String userName) {
		return stockDao.initialStockIn(orderId, branchId, userName);
	}

	@Override
	public List<StockVo> getStockOutList(Map <String, String> params) {
		return stockDao.getStockOutList(params);
	}
	
	@Override
	public List<StockVo> getStockOutDetail(String outId) {
		return stockDao.getStockOutDetail(outId);
	}

	@Override
	public int insertStockOut(String branchId, String userName) {
		return stockDao.insertStockOut(branchId, userName);
	}

	@Override
	public int getStockOutId(String branchId) {
		return stockDao.getStockOutId(branchId);
	}

	@Override
	public int insertOutDetail(StockVo vo) {
		return stockDao.insertOutDetail(vo);
	}

	@Override
	public int confirmStockOut(StockVo vo) {
		return stockDao.confirmStockOut(vo);
	}
}
