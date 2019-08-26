package project.suhbuway.pojo;

import lombok.Data;
import project.suhbuway.dto.Product;

@Data
public class OrderItemWrapper {
	private String itemId;
	private Product[] mainMenu;
	private String breadType;
	private String veggies;
	private String source;
	private String length;
	private Product[] subMenu;
}
