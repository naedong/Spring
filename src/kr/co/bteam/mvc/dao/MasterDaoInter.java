package kr.co.bteam.mvc.dao;

import java.util.List;
import java.util.Map;

import kr.co.bteam.mvc.page.PageListInter;
import kr.co.bteam.mvc.page.ShopListInter;
import kr.co.bteam.mvc.vo.ShopDTO;
import kr.co.bteam.mvc.vo.SuperDTO;

public interface MasterDaoInter extends ShopListInter{
	public int totalShop(String name);
	public void upConfirm(ShopDTO vo);
	public void delConfirm(ShopDTO vo);
	public void deluser(int nu);
}
