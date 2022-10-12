package kr.co.bteam.mvc.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import kr.co.bteam.mvc.vo.ExpectShopDTO;
import kr.co.bteam.mvc.vo.ShopDTO;
import kr.co.bteam.mvc.vo.SuperDTO;

@Repository("shopList")
public class ShopDao implements ShopDaoInter{
	
	@Autowired
	private SqlSessionTemplate ss;

	@Override
	public List<? extends SuperDTO> getList(Map<String, Object> map) {
		return ss.selectList("shop.listpage", map);
	}

	@Override
	public int totalshop() {
		return ss.selectOne("shop.totalshop");
	}

	@Override
	public void autodel() {
		ss.delete("shop.autodel");
	}

	@Override
	public void upSname(ShopDTO vo) {
		ss.update("shop.upsname",vo);
	}

	@Override
	public void upScate(ShopDTO vo) {
		ss.update("shop.upscate",vo);
	}

	@Override
	public void upSloc(ShopDTO vo) {
		ss.update("shop.upscloc",vo);
	}

	@Override
	public List<ExpectShopDTO> expectshop() {
		return ss.selectList("shop.expectshop");
	}

	
}
