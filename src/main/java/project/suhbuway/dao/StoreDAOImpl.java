package project.suhbuway.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.suhbuway.dto.OrderList;
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
	@Override
	public List<OrderList> selectByStoreSales(String max, String min2) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("max", max);
		map.put("min2", min2);
		return session.selectList("orderListMapper.selectByStoreSales", map);
	}

}
