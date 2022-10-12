package kr.co.bteam.mvc.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.bteam.mvc.vo.PopulDTO;

@Repository("populList")
public class PopulDao implements PopulDaoInter{

	@Autowired
	private SqlSessionTemplate ss;
	
	@Override
	public List<PopulDTO> getPie() {
		return ss.selectList("popul.piechart");
	}

}
