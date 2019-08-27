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
import project.suhbuway.wrapper.OrderItemWrapper;
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
	public List<OrderListWrapper> selectOrderListByStore(String storeId) {
		List<OrderList> list = orderDAO.selectOrderListByStore(storeId);
		List<OrderListWrapper> orderLists = new ArrayList<OrderListWrapper>();

		//////// 주문번호별 오더리스트 만들기 ////////
		for (OrderList orderList : list) {

			// System.out.println(orderList);

			OrderListWrapper wrapper = new OrderListWrapper();
			List<OrderItemWrapper> subMenu = new ArrayList<OrderItemWrapper>();

			// 주문 기본 정보 넣기 //
			wrapper.setOrderId(orderList.getOrderId());
			wrapper.setUserId(orderList.getUserId());
			wrapper.setStore(storeDAO.selectStoreById2(orderList.getStoreId()));
			wrapper.setTotal(orderList.getTotal());
			wrapper.setOrderState(orderList.getOrderState());
			wrapper.setRegdate(orderList.getRegdate());
			wrapper.setItems(subMenu);

			////// 주문에 속한 제품 정보 subMenu에 넣기 //////
			for (OrderItem orderItem : orderList.getOrderItems()) {

				////// 메인 메뉴들 넣기 //////
				if (orderItem.getAttach() == 0) {
					OrderItemWrapper orderItemWrapper = new OrderItemWrapper();
					orderItemWrapper.setItemId(orderItem.getItemId());
					orderItemWrapper.setMainMenu(productDAO.selectProductById(orderItem.getProductId()));
					orderItemWrapper.setBreadType(orderItem.getBreadType());
					orderItemWrapper.setVeggies(orderItem.getVeggies());
					orderItemWrapper.setSource(orderItem.getSource());
					orderItemWrapper.setLength(orderItem.getLength());
					orderItemWrapper.setSubMenu(new ArrayList<Product>());
					subMenu.add(orderItemWrapper);
				} else {
					////// 메인메뉴들에 속한 서브메뉴들 넣기 //////
					OrderItemWrapper attachTo = subMenu.stream().filter(a -> a.getItemId() == orderItem.getAttach())
							.findFirst().get();

					attachTo.getSubMenu().add(productDAO.selectProductById(orderItem.getProductId()));
				}
			} // 제품 넣는 for문 끝

			////// 오더리스트에 메뉴 리스트들 등록 ///////
			wrapper.setItems(subMenu);

			////// 오더리스트를 컨트롤러로 보낼 리스트에 넣는다 ///////
			orderLists.add(wrapper);

		} // 오더리스트 만드는 for문
		return orderLists;
	}

	/**
	 * 주문을 DB로 넣는 작업
	 */
//	@Override
//	@Transactional
//	public String insertOrder(OrderInsertWrapper[] newOrders, Store store, String userId) {
//
//		/* 주문 아이디를 만들기 */
//		String orderId = new SimpleDateFormat("yyMMddhhmmssSSS").format(new Date());
//		int lastItem = orderDAO.getLastItemId();
//
//		List<OrderItem> list = new ArrayList<OrderItem>();
//
//		/* orderList 생성 및 기본 데이터 입력 */
//		OrderList orderList = new OrderList();
//		orderList.setOrderId(orderId);
//		orderList.setUserId("test1");
//		orderList.setStoreId(store.getStoreId());
//
//		int total = 0; // 주문 총계 계산용
//
//		/* wrapper 에서 orderItem으로 전환하여 list에 저장 */
//		for (OrderInsertWrapper orders : newOrders) {
//			System.out.println(orders);
//			OrderItem main = new OrderItem();
//			main.setItemId(++lastItem);
//			main.setOrderId(orderId);
//			main.setProductId(orders.getProduct().getProductId());
//			main.setBreadType(orders.getBreadType());
//			main.setVeggies(String.join(",", orders.getVeggies()));
//			main.setSource(String.join(",", orders.getSource()));
//			main.setLength(orders.getLength());
//			total += orders.getPrice();
//
//			list.add(main);
//			for (Product subItem : orders.getSubMenu()) {
//				OrderItem sub = new OrderItem();
//				sub.setItemId(++lastItem);
//				sub.setOrderId(orderId);
//				sub.setProductId(subItem.getProductId());
//				sub.setAttach(main.getItemId());
//
//				list.add(sub);
//			}
//		}
//		orderList.setTotal(total);
//
//		/* db에 저장하는 작업 */
//		int result = orderDAO.insertOrder(orderList);
//
//		for (OrderItem item : list) {
//			result = orderDAO.insertItem(item);
//		}
//
//		/* 주문번호 반환 */
//		return orderList.getOrderId();
//	}
}
