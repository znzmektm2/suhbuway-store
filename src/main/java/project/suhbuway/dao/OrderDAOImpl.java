package project.suhbuway.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.suhbuway.dto.OrderItem;
import project.suhbuway.dto.OrderList;

@Repository
public class OrderDAOImpl implements OrderDAO {

	@Autowired
	SqlSession session;

	@Override
	public List<OrderList> selectOrderListByStore(String storeId) {
		List<OrderList> list = session.selectList("orderMapper.selectOrderListForStore", storeId);
		return list;
	}
	
	///////////////////////////////////////// 이하 밑에서 카피해옴 /////////////////////////////////////
	
	@Override
	public int insertOrder(OrderList orderList) {
		int result = session.insert("orderMapper.insertOrderList",orderList);
		return result;
	}
	
	@Override
	public int insertItem(OrderItem orderItem) {
		int result = session.insert("orderMapper.insertOrderItem",orderItem);
		return result;
	}
	
	@Override
	public int getLastItemId() {
		return session.selectOne("orderMapper.getLastItemId");
	}
}
