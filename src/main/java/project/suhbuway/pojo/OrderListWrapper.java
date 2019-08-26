package project.suhbuway.pojo;

import java.util.List;

import lombok.Data;
import project.suhbuway.dto.Product;
import project.suhbuway.dto.Store;

@Data
public class OrderListWrapper {
	
	private String orderId;
	private String userId;
	private Store store;
	private int total;
	private String orderState;
	private String regdate;
	
	private List<OrderItemWrapper> items;
}
