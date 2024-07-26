package com.inventory.services;

import java.util.List;
import java.util.Map;

import com.inventory.repositories.vo.OrderVo;
import com.inventory.repositories.vo.UserVo;

public interface OrderService {

	public boolean insert(UserVo vo);

	public String getMax();

	public boolean insertDetail(OrderVo vo);

	public List<OrderVo> getOrderList(Map <String, String> params);

	public List<OrderVo> getDetailList(String orderId);
}
