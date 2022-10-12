package kr.co.bteam.mvc.dao;



import java.util.List;
import kr.co.bteam.mvc.page.PageListInter;
import kr.co.bteam.mvc.vo.ExpectShopDTO;
import kr.co.bteam.mvc.vo.ShopDTO;



public interface ShopDaoInter extends PageListInter {
	public int totalshop();
	public void autodel();
	public void upSname(ShopDTO vo);
	public void upScate(ShopDTO vo);
	public void upSloc(ShopDTO vo);
	public List<ExpectShopDTO> expectshop();
}
