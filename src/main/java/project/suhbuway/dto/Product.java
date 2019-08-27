package project.suhbuway.dto;

import lombok.Data;

@Data
public class Product {
	private int productId;
	private String name;
	private String nameEng;
	private String category;
	private int price;
	private String description;
	private String imgUrl;
	private boolean state;
	private Nutrition nutrition;
}

/* product_id,name,name_eng,category,price,description,img,state */