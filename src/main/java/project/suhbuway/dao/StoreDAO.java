package project.suhbuway.dao;

import java.util.List;

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
	 * ID에 해당하는 회원정보 검색??????? 스토어인데????
	 * */
	Store selectStoreById(String id);
	
	/**
	 * StoreId로 검색 비밀번호 삭제
	 */
	public Store selectStoreById2(String id); 
	
	/**
	 * 회원정보 수정
	 */
	int storeUpdate(Store store);
	
	/**
	 * 매출액 조회 - 매장에 따른 Order table의 월별 매출액 조회
	 */
	
}
