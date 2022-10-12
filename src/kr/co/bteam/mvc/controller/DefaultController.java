package kr.co.bteam.mvc.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.annotation.JacksonInject.Value;

import kr.co.bteam.mvc.controller.user.MailSendService;
import kr.co.bteam.mvc.dao.SearchDaoInter;
import kr.co.bteam.mvc.service.pubService;
import kr.co.bteam.mvc.vo.ShopDTO;

@Controller
public class DefaultController {

	
	@Autowired
	private MailSendService mailService;
	
	@Autowired
	private pubService service;
	
	
	@Autowired
	private SearchDaoInter searchf;
	
	
	@RequestMapping(value = { "/", "/main" })
	public String defaultIndex() {
		return "main/index";
	}
	
	@RequestMapping(value = "/mailCheck", method = RequestMethod.GET)
	@ResponseBody	//비동기 응답본문, url이 아닌 String값 자체 반환
	public String mailCheck(String email) {
		System.out.println("From Ajax Email : "+email);
		return mailService.joinEmail(email);
	}
	
	@RequestMapping(value =  "/korea")
	public String Index() {
		return "main/korea";
	}
	
	@GetMapping(value =  "/indexJson")
	public String Indexjson() {
		return "main/korea";
	}
	
	
	@RequestMapping(value =  "/main/searchf", produces = "application/text;charset=euc-kr", method = RequestMethod.GET)
	public String searchf(Model model, String cPage, @RequestParam(name = "type") String type, @RequestParam( name="keyword") String keyword ){

		System.out.println("여기값"+keyword);
		System.out.println("값"+type);
	Map<String, String> map = new HashMap<String, String>();
	String sname = null;
	String sloc = null;
	if(type.equals("sname")) {
		sname = type;
		map.put("sname", sname);
		System.out.println("keyword"+keyword);
		model.addAttribute("sname", sname);	
	}else if( type.equals("sloc")) {
		sloc = type;
		map.put("sloc", sloc);
		System.out.println(sloc);
		model.addAttribute("sloc", sloc);
	}
	model.addAttribute("keyword", keyword);
	map.put("keyword", keyword);
	int totalRecord = searchf.Search(map);
	
		model.addAttribute("totalRecord", totalRecord);
		return "main/SearchList";
	}
	
}
