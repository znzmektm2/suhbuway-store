package project.suhbuway.dao;

import java.util.List;

import project.suhbuway.dto.OrderList;
import project.suhbuway.dto.Store;

public interface StoreDAO {
	
	/**
	 *  회원가입
	 * */
	int insertStore(Store store);
	
	/**
	 * ID중복체크
	 */
	int idcheck(String id);

	/**
	 * 전체검색
	 */
	List<Store> selectAll();

	/**
	 * ID에 해당하는 회원정보 검색
	 * */
	Store selectStoreById(String id);

	/**
	 * 회원정보 수정
	 */
	int storeUpdate(Store store);
	
	/*
	 * 날짜별 매장 매출 뽑기
	 * */
	List<OrderList> selectByStoreSales(String max,String min2);
	
}
