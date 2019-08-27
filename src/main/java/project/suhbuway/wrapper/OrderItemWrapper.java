package project.suhbuway.wrapper;

import java.util.List;

import lombok.Data;
import project.suhbuway.dto.Product;

@Data
public class OrderItemWrapper {
    private int itemId;
    private Product mainMenu;
    private String breadType;
    private String veggies;
    private String source;
    private String length;
    private List<Product> subMenu;
}
