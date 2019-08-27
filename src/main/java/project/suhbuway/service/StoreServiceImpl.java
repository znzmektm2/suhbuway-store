package project.suhbuway.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import project.suhbuway.dao.StoreDAO;
import project.suhbuway.dto.OrderList;
import project.suhbuway.dto.Store;

@Service
public class StoreServiceImpl implements StoreService {
	
	@Autowired
	StoreDAO storeDAO;
	@Autowired  
	PasswordEncoder passwordEncoder;
	
	/**
	 * 전체검색
	 */
	@Override
	public List<Store> selectAll() {
		return storeDAO.selectAll();
	}
	
	/**
	 * 회원가입
	 */
	@Transactional 
	@Override	     
	public int joinStore(Store store) {
		
		// encode(): 패스워드(평문) -> 암호화해서 저장
		if( store.getStorePassword() != null ) {
			String pwd = passwordEncoder.encode( store.getStorePassword() );
			store.setStorePassword(pwd);
		}
		// 회원가입
		int result = storeDAO.insertStore(store);
		if( result==0 ) throw new RuntimeException("가입되지 않았습니다.");
		
		return 0;
	}
	/**
	 * ID중복체크
	 */
	@Override
	public String idcheck(String id) {
		//System.out.println("서비스 id체크: " + id );
		int count=storeDAO.idcheck(id);
		return (count==0) ? "ok"  : "fail"; 	
	}

	/**
	 * ID에 해당하는 회원정보 검색
	 */
	@Override
	public Store selectStoreById(String id) {
		return storeDAO.selectStoreById(id);
	}

	/**
	 * 비밀번호 일치 확인
	 */
	@Override
	public boolean selectByStorePassword(String id,String passowrd) {
		
		// 입력된 비번 복호화
		
		// DB 비번
		Store dbstore = this.selectStoreById(id);
		dbstore.getStorePassword();
		
		// 비밀번호 비교	     // 암호안된거 암호된거
		boolean result = passwordEncoder.matches(passowrd, dbstore.getStorePassword() );
		System.out.println(" 서비스 result: " + result );
		
		return result;
	}
	/**
	 * 회원정보 수정
	 */
	@Override
	public int userUpdate(Store store) {
		
		// encode(): 패스워드(평문) -> 암호화해서 저장
		if( store.getStorePassword() != null ) {
			String pwd = passwordEncoder.encode( store.getStorePassword() );
			store.setStorePassword(pwd);
		}
		
		return storeDAO.storeUpdate(store);
	}

	@Override
	public int selectByStoreSales(String min, String storeId) {
		int total=0;
		String max = min+"/31";
		String min2 = min+"/01";
		List<OrderList> list =storeDAO.selectByStoreSales(min2,max,storeId);
		for(int i=0;i<list.size();i++) {
			total+=list.get(i).getTotal();
		}
		return total;
	}

}
