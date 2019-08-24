package project.suhbuway.security;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

import project.suhbuway.dao.StoreDAO;
import project.suhbuway.dto.Store;

/**  인증처리 객체 - 입력값 DB와 비교
  */
@Component // id="memberAuthenticationProvider"
public class StoreAuthenticationProvider implements AuthenticationProvider {
	
	@Autowired  
	private StoreDAO userDAO;	
	@Autowired // PasswordEncoder : 암호화된건 평문이랑 비교 못해서 필요 ( sercurity.xml에서 생성 )
	private PasswordEncoder passwordEncoder;
	//@Autowired // AuthoritiesDAO: DB와 입력값 비교 성공시, 권한을 꺼내오는 DAO
	//private AuthoritiesDAO authoritiesDAO;

	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		
		if( !supports(authentication.getClass()) ) {
			return null;
		}
		
		// 아이디 비교
		Store store = userDAO.selectStoreById( authentication.getName() );// id
		if(store==null) throw new UsernameNotFoundException("아이디 또는 비밀번호가 틀렸습니다");
		
		// 비밀번호 비교
		String pass = authentication.getCredentials().toString(); //  getCredentials(): 평문비교, Object여서 String으로 바꿈
		if( !passwordEncoder.matches( pass, store.getStorePassword() ) ) { // matches(): 암호문을 복호화해서 비교 
			throw new UsernameNotFoundException("id 또는 비밀번호가 틀렸습니다.");
		}
		
		List<SimpleGrantedAuthority> grantedList = new ArrayList<>();
		grantedList.add( new SimpleGrantedAuthority( "ROLE_STORE" ) );
		return new UsernamePasswordAuthenticationToken( store , null , grantedList );
		
	}
	
	@Override
	public boolean supports(Class<?> authentication) {
		//return UsernamePasswordAuthenticationToken.class.isAssignableFrom(authentication); // 검증
		return true;
	}

}
