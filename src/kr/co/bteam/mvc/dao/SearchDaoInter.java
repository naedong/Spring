package kr.co.bteam.mvc.dao;

import java.util.Map;

import kr.co.bteam.mvc.page.SearchListInet;

public interface SearchDaoInter extends SearchListInet{
	public int Search(Map<String, String> map);
}
