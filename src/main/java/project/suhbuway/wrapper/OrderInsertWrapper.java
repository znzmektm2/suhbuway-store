package project.suhbuway.wrapper;

import lombok.Data;
import project.suhbuway.dto.Product;

@Data
public class OrderInsertWrapper {
	
	private Product product;
	
	private String length;
	private int price;
	private String breadType;
	private String[] veggies;
	private String[] source;
	
	private Product[] subMenu;
}
