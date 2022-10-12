package kr.co.bteam.mvc.dao;

import kr.co.bteam.mvc.page.ShopListInter;
import kr.co.bteam.mvc.vo.UserDTO;

public interface UserShopDAOInter extends ShopListInter {
	public int totalUserShop(String name);
	


}
