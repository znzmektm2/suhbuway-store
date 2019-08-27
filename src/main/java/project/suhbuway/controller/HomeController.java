package project.suhbuway.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import project.suhbuway.dto.Store;
import project.suhbuway.service.StoreService;
import project.suhbuway.wrapper.OrderListWrapper;

/**
 * 일반적인 사이트 네비게이션 관련 매핑들은 이곳으로..
 */
@Controller
public class HomeController {

   // @Autowired
   // HomeService service;
    
   @Autowired
   StoreService storeService;

    /**
     * 초기페이지로 이동합니다.
     */
    @RequestMapping("/")
    public String index() {
	return "index";
    }
    
    /**
     * 주문 확인
     */
    @RequestMapping("/store/orderList")
    public ModelAndView orderList( Principal principal ) {
    	ModelAndView mv = new ModelAndView();
    	
    	// 시큐리티 로그인 매장 id
     	if( principal!= null ) {
        	String store = principal.getName();
        	store = store.replace("Store(", "" );
        	store = store.replace(")", "" );
        	String [] storedd= store.split(",");
        	
        	String storeId = storedd[0].replace("storeId=", "" );
        	//System.out.println("userId: "+ userdd[0].replace("userId=", "" ) );
        	
        	Store dbstore = storeService.selectStoreById(storeId);
        	mv.addObject("store", dbstore );
    	}
    	
    	mv.setViewName("store/orderList");
    	return mv;
    }
    /**
     * 매출액 확인
     */
    @RequestMapping("/store/salesList")
    public ModelAndView salesList( Principal principal) {
    	ModelAndView mv = new ModelAndView();
    	
    	// 시큐리티 로그인 매장 id
    	if( principal!= null ) {
        	String store = principal.getName();
        	store = store.replace("Store(", "" );
        	store = store.replace(")", "" );
        	String [] storedd= store.split(",");
        	
        	String storeId = storedd[0].replace("storeId=", "" );
        	//System.out.println("userId: "+ userdd[0].replace("userId=", "" ) );
        	
        	Store dbstore = storeService.selectStoreById(storeId);
        	mv.addObject("store", dbstore );
        	
    	}
    	mv.setViewName("store/salesList");
    	return mv;
    }
    
    /*
     * 매출액 검색
     * */
	@ResponseBody
    @RequestMapping("/selectSales")
	public int selectByStoreSales(String min,String storeId) {
    	return storeService.selectByStoreSales(min,storeId);
    }
}
