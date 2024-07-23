package com.inventory.services;

import java.util.List;

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
	public List<OrderVo> getList() {
		List<OrderVo> list = OrderCheckDao.getAllList();
		return list;
	}

	@Override
	public List<OrderVo> getBranchsList(String id) {
		List<OrderVo> list = OrderCheckDao.getBranchsList(id);
		return list;
	}

	@Override
	public List<OrderVo> getOrderDetail(String id) {
		List<OrderVo> list = OrderCheckDao.getOrderDetail(id);
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

	// 동현
	@Override
	public List<OrderVo> getBranchListSummary() {
		List<OrderVo> list = OrderCheckDao.getBranchListSummary();
		return list;
	}

	@Override
	public List<OrderVo> selectAllBookOrders() {
		List<OrderVo> list = OrderCheckDao.selectAllBookOrders();
		return list;
	}

	@Override
	public List<OrderVo> selectOrdersByDate(String date) {
		List<OrderVo> list = OrderCheckDao.selectOrdersByDate(date);
		return list;
	}
	

}
