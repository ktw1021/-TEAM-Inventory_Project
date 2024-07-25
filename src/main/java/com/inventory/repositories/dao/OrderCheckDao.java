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
	
	public List <OrderVo> getSum();
	public List <OrderVo> getOrderQuantity();
	
	public List <String> getOrderId();
	public int goodOrder (String orderId);
}
