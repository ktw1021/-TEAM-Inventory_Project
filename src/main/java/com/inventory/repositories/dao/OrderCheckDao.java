package com.inventory.repositories.dao;

import java.util.List;
import java.util.Map;

import com.inventory.repositories.vo.OrderVo;
import com.inventory.repositories.vo.StockVo;

public interface OrderCheckDao {
	
	public List <OrderVo> getOrderDetail(String id);
	
	public long getCount();
	
	public int refuseOrder(String no);
	
	public int confirmOrderCode(String no);
	
	public int confirmAndInsertStockIn(String orderId, String branchId);
	
	public int getStockIn(String orderId);
	
	public int confirmAndInsertInDetail(StockVo vo);
	
	public String getBranchId(String orderId);
	
	public List<OrderVo> getBranchList();
	
	public List <OrderVo> newGetList(Map <String, String> params);
	
	public List <OrderVo> getSum(List<Integer> orderIds);
	public List <OrderVo> getOrderQuantity(List<Integer> orderIds);
	
	public List <Integer> getOrderId();
	public int goodOrder (int orderId);
	
	public int deleteStockIn(String orderId);
	
	public int getGroupIdSeq();
	public int insertConfirm(Map<String, Integer>params);
	
	public List <OrderVo> getHistoryList();
}
