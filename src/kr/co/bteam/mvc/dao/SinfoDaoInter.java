package kr.co.bteam.mvc.dao;

import java.util.Map;

import kr.co.bteam.mvc.page.PageListInter;
import kr.co.bteam.mvc.vo.SinfoDTO;
import kr.co.bteam.mvc.vo.UserDTO;


public interface SinfoDaoInter extends PageListInter {
	public int totalsinfo(String snum);
	public void addUpBoard(Map<String, Object> map);
	public void upIname(SinfoDTO vo);
	public void upIprice(SinfoDTO vo);
	public void upIstoke(SinfoDTO vo);
}
