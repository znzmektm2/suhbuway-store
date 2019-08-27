package project.suhbuway.dto;

import lombok.Data;

@Data
public class Nutrition {
	private int productId;
	private String weight;
	private String calory;
	private String sugar;
	private String protein;
	private String fat;
	private String salt;
}

/* product_id,weight,calory,sugars,protein,fat,salt */