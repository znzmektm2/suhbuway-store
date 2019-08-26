package project.suhbuway.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import project.suhbuway.dao.OrderDAO;
import project.suhbuway.dao.ProductDAO;
import project.suhbuway.dao.StoreDAO;
import project.suhbuway.dto.OrderItem;
import project.suhbuway.dto.OrderList;
import project.suhbuway.dto.Product;
import project.suhbuway.dto.Store;
import project.suhbuway.wrapper.OrderInsertWrapper;
import project.suhbuway.wrapper.OrderListWrapper;

@Service
public class OrderServiceImpl implements OrderService {
	@Autowired
	ProductDAO productDAO;
	@Autowired
	OrderDAO orderDAO;
	@Autowired
	StoreDAO storeDAO;

	/**
	 * 유저별 주문 리스트들을 불러오는 메서드
	 * - 아이디를 통해 지난 주문리스트를 만들어 불러온다.
	 */
	@Override
	@Transactional
	public List<OrderList> selectOrderListByUser(String userId) {
		List<OrderList> list = orderDAO.selectOrderListsByUser(userId);
		List<OrderListWrapper> orderLists = new ArrayList<OrderListWrapper>();

		for (OrderList orderList : list) {
			System.out.println(orderList);
			OrderListWrapper wrapper = new OrderListWrapper();
			List<OrderInsertWrapper> subMenu = new ArrayList<OrderInsertWrapper>();
			
			wrapper.setOrderId(orderList.getOrderId());
			wrapper.setStore(storeDAO.selectStoreById(orderList.getStoreId()));
			wrapper.setTotal(orderList.getTotal());
			wrapper.setOrderState(orderList.getOrderState());
			wrapper.setRegdate(orderList.getRegdate());
			// wrapper.setItems(subMenu);
			
			for (OrderItem orderItem : orderList.getOrderItems()) {
				System.out.println(orderItem);
				OrderInsertWrapper setItem = new OrderInsertWrapper();
			}
			// System.out.println(wrapper);
		}
		return list;
	}

	/**
	 * 주문을 DB로 넣는 작업
	 */
	@Override
	@Transactional
	public String insertOrder(OrderInsertWrapper[] newOrders, Store store, String userId) {

		/* 주문 아이디를 만들기 */
		String orderId = new SimpleDateFormat("yyMMddhhmmssSSS").format(new Date());
		int lastItem = orderDAO.getLastItemId();

		List<OrderItem> list = new ArrayList<OrderItem>();

		/* orderList 생성 및 기본 데이터 입력 */
		OrderList orderList = new OrderList();
		orderList.setOrderId(orderId);
		orderList.setUserId("test1");
		orderList.setStoreId(store.getStoreId());

		int total = 0; // 주문 총계 계산용

		/* wrapper 에서 orderItem으로 전환하여 list에 저장 */
		for (OrderInsertWrapper orders : newOrders) {
			System.out.println(orders);
			OrderItem main = new OrderItem();
			main.setItemId(++lastItem);
			main.setOrderId(orderId);
			main.setProductId(orders.getProduct().getProductId());
			main.setBreadType(orders.getBreadType());
			main.setVeggies(String.join(",", orders.getVeggies()));
			main.setSource(String.join(",", orders.getSource()));
			main.setLength(orders.getLength());
			total += orders.getPrice();

			list.add(main);
			for (Product subItem : orders.getSubMenu()) {
				OrderItem sub = new OrderItem();
				sub.setItemId(++lastItem);
				sub.setOrderId(orderId);
				sub.setProductId(subItem.getProductId());
				sub.setAttach(main.getItemId());

				list.add(sub);
			}
		}
		orderList.setTotal(total);

		/* db에 저장하는 작업 */
		int result = orderDAO.insertOrder(orderList);

		for (OrderItem item : list) {
			result = orderDAO.insertItem(item);
		}

		/* 주문번호 반환 */
		return orderList.getOrderId();
	}
}
