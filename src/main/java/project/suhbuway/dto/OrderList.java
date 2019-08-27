package project.suhbuway.dto;

import java.util.List;
import lombok.Data;

@Data
public class OrderList {

	private String orderId;
	private String userId;
	private String storeId;
	private int total;
	private String orderState;
	private String regdate;

	private List<OrderItem> orderItems;
}
