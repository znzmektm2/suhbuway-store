package project.suhbuway.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.suhbuway.dto.Store;

@Repository
public class StoreDAOImpl implements StoreDAO {

	@Autowired  
	private SqlSession session;
	
	/**
	 * 전체검색
	 */
	public List<Store> selectAll(){
		return null;
	}
	/**
	 *  회원가입
	 */
	@Override
	public int insertStore(Store store) {
		return session.insert("storeMapper.insertStore",store);
	}
	
	/**
	 *  전체검색, 부분검색
	 */
	@Override
	public Store selectStoreById(String id) {
		return session.selectOne("storeMapper.selectStoreById",id);
	}
	
	public Store selectStoreById2(String id) {
		Store result = session.selectOne("storeMapper.selectStoreById",id);
		result.setStorePassword(""); // 비밀번호는 삭제함 -_-.
		return result;
	}
	/**
	 * ID중복체크
	 */
	@Override
	public int idcheck(String id) {
		//System.out.println("userDAOImpl id: " + id );
		return session.selectOne("storeMapper.idcheck",id);
	}
	
	
	/**
	 * 회원정보 수정
	 */
	@Override
	public int storeUpdate(Store store) {
		return session.update("storeMapper.updateStore",store);
	}

}
