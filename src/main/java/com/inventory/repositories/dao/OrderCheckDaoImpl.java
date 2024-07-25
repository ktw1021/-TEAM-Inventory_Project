package com.inventory.repositories.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.inventory.repositories.vo.OrderVo;
import com.inventory.repositories.vo.StockVo;

@Repository("OrderCheckDao")
public class OrderCheckDaoImpl implements OrderCheckDao {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<OrderVo> getOrderDetail(String id) {
		List<OrderVo> list = sqlSession.selectList("orderCheck.selectOrderDetail", id);
		return list;
	}

	@Override
	public long getCount() {
		long count = sqlSession.selectOne("orderCheck.countNewOrder");
		return count;
	}

	@Override
	public int refuseOrder(String no) {
		return sqlSession.update("orderCheck.refuseOrder", no);
	}

	@Override
	public int confirmOrderCode(String no) {
		return sqlSession.update("orderCheck.confirmOrderCode", no);
	}

	@Override
	public int confirmAndInsertStockIn(String orderId, String branchId) {
		Map<String, String> map = new HashMap<>();
		map.put("orderId", orderId);
		map.put("branchId", branchId);
		return sqlSession.insert("orderCheck.confirmAndInsertStockIn", map);
	}

	@Override
	public int getStockIn(String orderId) {
		return sqlSession.selectOne("orderCheck.getStockInIdByOrderId", orderId);
	}

	@Override
	public int confirmAndInsertInDetail(StockVo vo) {
		return sqlSession.insert("orderCheck.confirmAndInsertInDetail", vo);
	}

	@Override
	public String getBranchId(String orderId) {
		return sqlSession.selectOne("orderCheck.getBranchId", orderId);
	}

	@Override
	public List<OrderVo> getBranchList() {
		List<OrderVo> list = sqlSession.selectList("orderCheck.getBranchList");
		return list;
	}

	@Override
	public List<OrderVo> newGetList(Map <String, String> params) {
		return sqlSession.selectList("orderCheck.newOrderCheckList", params);
	}

	@Override
	public List<OrderVo> getSum() {
		return sqlSession.selectList("orderCheck.getSumOrderQuantity");
	}

	@Override
	public List<OrderVo> getOrderQuantity() {
		return sqlSession.selectList("orderCheck.getBranchsOrderQuantity");
	}

	@Override
	public List<String> getOrderId() {
		return sqlSession.selectList("orderCheck.getOrderId");
	}

	@Override
	public int goodOrder(String orderId) {
		return sqlSession.update("orderCheck.goodOrder", orderId);
	}

}
