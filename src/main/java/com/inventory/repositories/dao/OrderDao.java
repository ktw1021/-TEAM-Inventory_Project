package com.inventory.repositories.dao;

import java.util.List;


import com.inventory.repositories.vo.OrderVo;
import com.inventory.repositories.vo.UserVo;

public interface OrderDao {

	public int insert(UserVo vo);
	
	public String getMax();
	
	public int insertDetail(OrderVo vo);
	
	public List<OrderVo> getOrderList(String branchId);
	
	public List<OrderVo> getDetailList(String orderId);
}
