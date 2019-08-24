package project.suhbuway.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class Store {
	
	// 컬럼 속성들
	private String storeId;
	private String storePassword;
	private String storeName;
	private String storeAddress;
	private String storePhone;
	private String storeOwner;//점주
	private int storeSales;//매출액
	
}
