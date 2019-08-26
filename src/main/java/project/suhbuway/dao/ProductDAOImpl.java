package project.suhbuway.dao;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.suhbuway.dto.Product;

@Repository
public class ProductDAOImpl implements ProductDAO {

	@Autowired
	private SqlSession session;

	@Override
	public List<Product> selectProductsByCategory(String category) {
		List<Product> list = session.selectList("productMapper.selectProductsByCategory", category);
		return list;
	}

	@Override
	public Product selectProductById(int id) {
		Product result = session.selectOne("productMapper.selectProductByIdForMenu", id);
		return result;
	}

	@Override
	public List<String> selectMenuListByMenu(String menu) {
		List<String> result = session.selectList("productMapper.selectMenuListByMenu", menu);
		return result;
	}

	@Override
	public List<Product> selectAll() {
		List<Product> list = session.selectList("productMapper.selectAll");
		return list;
	}
}
