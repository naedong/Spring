package kr.co.bteam.mvc.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.bteam.mvc.vo.SuperDTO;


@Repository(value = "searchf")
public class SearchDao implements SearchDaoInter{

	@Autowired
	private SqlSessionTemplate ss;

	
	@Override
	public List<? extends SuperDTO> getSearch(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return ss.selectList("shop.selectSearchList", map);
	}

	@Override
	public int Search(Map<String, String> map) {
		return ss.selectOne("shop.searchCount", map);
	}

}
