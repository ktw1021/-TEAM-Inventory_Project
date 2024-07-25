package com.inventory.repositories.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.inventory.repositories.vo.OrderVo;
import com.inventory.repositories.vo.UserVo;

@Repository("OrderDao")
public class OrderDaoImpl implements OrderDao {

	@Autowired
	SqlSession sqlSession;

	@Override
	public int insert(UserVo vo) {
		int insertedCount = sqlSession.insert("order.insert", vo);
		return insertedCount;
	}

	@Override
	public String getMax() {

		return sqlSession.selectOne("order.getMax");
	}

	@Override
	public int insertDetail(OrderVo vo) {

		return sqlSession.insert("order.insertDetail", vo);
	}

	@Override
	public List<OrderVo> getOrderList(String branchId) {
		List<OrderVo> list = sqlSession.selectList("order.selectOrderList", branchId);
		return list;
	}

	@Override
	public List<OrderVo> getDetailList(String orderId) {
		List<OrderVo> list = sqlSession.selectList("order.selectDetailList", orderId);
		return list;
	}
	
	

}
