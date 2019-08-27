package project.suhbuway.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class OrderList {
	private String orderId;
	private String userId;
	private String storeId;
	private int total;
	private String orderState;
	private String regdate;
}
