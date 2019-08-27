package project.suhbuway.service;

import java.util.List;

import project.suhbuway.dto.Store;

public interface StoreService {
	
	/**
	 *  회원가입
	 * */
	int joinStore(Store store);
	
	/**
	 * ID중복체크
	 */
	String idcheck(String id);

	/**
	 * 전체검색
	 */
	List<Store> selectAll();

	/**
	 * ID에 해당하는 회원정보 검색
	 * */
	Store selectStoreById(String id);
	
	/**
	 * 비밀번호 일치 확인
	 */
	boolean selectByStorePassword(String id,String passowrd);

	/**
	 * 회원정보 수정
	 */
	int userUpdate(Store user);
	
	/*
	 * 날짜별 매장 매출 뽑기
	 * */
	int selectByStoreSales(String min);
	
}
