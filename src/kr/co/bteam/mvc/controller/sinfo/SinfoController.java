package kr.co.bteam.mvc.controller.sinfo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.bteam.mvc.dao.ShopDaoInter;
import kr.co.bteam.mvc.dao.SinfoDaoInter;


@Controller
@RequestMapping(value = "/sinfo")
public class SinfoController {
		
	@Autowired
	private SinfoDaoInter sinfoList;
		
}
