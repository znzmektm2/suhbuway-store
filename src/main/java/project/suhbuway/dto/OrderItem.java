package project.suhbuway.dto;

import lombok.Data;

@Data
public class OrderItem {
	int itemId;
	String orderId;
	int productId;
	String breadType;
	String veggies;
	String source;
	int attach;
	String length;
}