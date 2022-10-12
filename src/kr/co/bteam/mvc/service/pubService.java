package kr.co.bteam.mvc.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.bteam.mvc.dao.BossDaoInter;
import kr.co.bteam.mvc.dao.MasterDaoInter;
import kr.co.bteam.mvc.dao.PopulDaoInter;
import kr.co.bteam.mvc.dao.SearchDaoInter;
import kr.co.bteam.mvc.dao.ShopDaoInter;
import kr.co.bteam.mvc.dao.SinfoDaoInter;
import kr.co.bteam.mvc.dao.UserDaoInter;
import kr.co.bteam.mvc.page.PageListInter;
import kr.co.bteam.mvc.vo.BossDTO;
import kr.co.bteam.mvc.vo.ExpectShopDTO;
import kr.co.bteam.mvc.vo.PopulDTO;
import kr.co.bteam.mvc.vo.ShopDTO;
import kr.co.bteam.mvc.vo.SinfoDTO;
import kr.co.bteam.mvc.vo.SuperDTO;
import kr.co.bteam.mvc.vo.UserDTO;

@Service
public class pubService {

	@Autowired
	private UserDaoInter userList;

	@Autowired
	private BossDaoInter bossList;

	@Autowired
	private ShopDaoInter shopList;

	@Autowired
	private SinfoDaoInter sinfoList;
	
	@Autowired
	private SearchDaoInter searchf;
	
	@Autowired
	private PopulDaoInter populList;
	
	@Autowired
    private MasterDaoInter mastercShop;

	@Transactional
	public void insertBoss(UserDTO vo) {
		userList.insertuser(vo);
		bossList.bossin();
	}

	public ShopDTO bossdetail(int unum) {
		return bossList.bossdetail(unum);
	}

	@Transactional
	public ShopDTO myShop(int bnum) {
		return bossList.myshop(bnum);
	}

	@Transactional
	public int totalboss() {
		return bossList.totalboss();
	}

	public int totalshop() {
		return shopList.totalshop();
	}

	// 220718 추가
	@Transactional
	public int totalsinfo(String snum) {
		return sinfoList.totalsinfo(snum);
	}

	@Transactional
	public ShopDTO checkShop(ShopDTO vo) {
		return bossList.checkShop(vo);
	}

	// 스케쥴러 리스트
	@Transactional
	public List<? extends SuperDTO> shopList(Map<String, Object> map) {
		return shopList.getList(map);
	}

	public void addUpBoard(Map<String, Object> map) {
		sinfoList.addUpBoard(map);
	}
	
	public void upSname(ShopDTO vo) {
		shopList.upSname(vo);
	}
	
	public void upScate(ShopDTO vo) {
		shopList.upScate(vo);
	}
	
	public void upSloc(ShopDTO vo) {
		shopList.upSloc(vo);
	}
	
	public List<ExpectShopDTO> expectshop() {
		return shopList.expectshop();
	}
	
	public void upIname(SinfoDTO vo) {
		sinfoList.upIname(vo);
	}
	
	public void upIprice(SinfoDTO vo) {
		sinfoList.upIprice(vo);
	}
	
	public void upIstoke(SinfoDTO vo) {
		sinfoList.upIstoke(vo);
	}
	
	public List<PopulDTO> getPie(){
		return populList.getPie();
	}
	
	public void deluser(int nu) {
        mastercShop.deluser(nu);
    }
}
