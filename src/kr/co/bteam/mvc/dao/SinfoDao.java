package kr.co.bteam.mvc.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.bteam.mvc.page.PageListInter;
import kr.co.bteam.mvc.vo.SinfoDTO;
import kr.co.bteam.mvc.vo.SuperDTO;
import kr.co.bteam.mvc.vo.UserDTO;

@Repository("sinfoList")
public class SinfoDao implements SinfoDaoInter {

	@Autowired
	private SqlSessionTemplate ss;
	
	@Override
	public List<? extends SuperDTO> getList(Map<String, Object> map) {
		return ss.selectList("sinfo.sinfolist", map);
	}
	
	@Override
	public int totalsinfo(String snum) {
		return ss.selectOne("sinfo.totalsinfo", snum);
	}

	@Override
	public void addUpBoard(Map<String, Object> map) {
		ss.insert("sinfo.sinfoin", map);
	}

	@Override
	public void upIname(SinfoDTO vo) {
		ss.update("sinfo.upiname",vo);
	}

	@Override
	public void upIprice(SinfoDTO vo) {
		ss.update("sinfo.upiprice",vo);
	}

	@Override
	public void upIstoke(SinfoDTO vo) {
		ss.update("sinfo.upistoke",vo);
	}
}
