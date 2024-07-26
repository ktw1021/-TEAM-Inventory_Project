package com.inventory.services;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.inventory.repositories.dao.OrderCheckDao;
import com.inventory.repositories.vo.OrderVo;
import com.inventory.repositories.vo.StockVo;

@Service("OrderCheckService")
public class OrderCheckServiceImpl implements OrderCheckService {

	@Autowired
	private OrderCheckDao OrderCheckDao;

	@Override
	public List<OrderVo> getOrderDetail(String id) {
		List <OrderVo> list = OrderCheckDao.getOrderDetail(id);
		return list;
	}
	
	@Override
	public long getCount() {
		return OrderCheckDao.getCount();
	}

	@Override
	public int refuseOrder(String no) {
		return OrderCheckDao.refuseOrder(no);
	}

	@Override
	public int confirmOrderCode(String no) {
		return OrderCheckDao.confirmOrderCode(no);
	}

	@Override
	public int confirmAndInsertStockIn(String orderId, String branchId) {
		return OrderCheckDao.confirmAndInsertStockIn(orderId, branchId);
	}

	@Override
	public int getStockIn(String orderId) {
		return OrderCheckDao.getStockIn(orderId);
	}

	@Override
	public int confirmAndInsertInDetail(StockVo vo) {
		return OrderCheckDao.confirmAndInsertInDetail(vo);
	}

	@Override
	public String getBranchId(String orderId) {
		return OrderCheckDao.getBranchId(orderId);
	}

	@Override
	public List<OrderVo> getBranchList() {
		List<OrderVo> list = OrderCheckDao.getBranchList();
		return list;
	}

	@Override
	public List<OrderVo> newGetList(Map <String, String> params) {
		return OrderCheckDao.newGetList(params);
	}

	@Override
	public List<OrderVo> getSum(List<Integer> orderIds) {
		return OrderCheckDao.getSum(orderIds);
	}

	@Override
	public List<OrderVo> getOrderQuantity(List<Integer> orderIds) {
		return OrderCheckDao.getOrderQuantity(orderIds);
	}

	@Override
	public int goodGije() {
		List <Integer> list = OrderCheckDao.getOrderId();
		int success = 0;
		
		Map<String, Integer> params = new HashMap<>();
		
		int groupId = OrderCheckDao.getGroupIdSeq();
		params.put("groupId", groupId);
		
		for (int orderId :list) {
			success = OrderCheckDao.goodOrder(orderId);
			params.put("orderId", orderId);
			success += OrderCheckDao.insertConfirm(params);
		}
		
		return success;
	}

	@Override
	public int deleteStockIn(String orderId) {
		return OrderCheckDao.deleteStockIn(orderId);
	}

	@Override
	public List<OrderVo> getHistoryList() {
		return OrderCheckDao.getHistoryList();
	}
	
}
