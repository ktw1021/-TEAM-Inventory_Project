package com.inventory.services;

import java.util.List;

import com.inventory.repositories.vo.OrderVo;
import com.inventory.repositories.vo.StockVo;

public interface OrderCheckService {

	public List <OrderVo> getList ();
	
	public List <OrderVo> getBranchsList(String id);
	
	public List <OrderVo> getOrderDetail(String id);
	
	public long getCount();
	
	public int refuseOrder(String no);
	
	public int confirmOrderCode(String no);
	
	public int confirmAndInsertStockIn(String orderId, String branchId);
	
	public int getStockIn(String orderId);
	
	public int confirmAndInsertInDetail(StockVo vo);
	
	String getBranchId(String orderId);
	
	List<OrderVo> getBranchList();

	
	//동현
	
	public List<OrderVo> getBranchListSummary();

	public List<OrderVo> selectAllBookOrders();
	
}


