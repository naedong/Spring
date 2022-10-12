package kr.co.bteam.mvc.controller.master;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.bteam.mvc.dao.MasterDaoInter;
import kr.co.bteam.mvc.service.pubService;
import kr.co.bteam.mvc.vo.ExpectShopDTO;
import kr.co.bteam.mvc.vo.PopulDTO;
import kr.co.bteam.mvc.vo.ShopDTO;


@Controller
@RequestMapping(value = "/master")
public class MasterController {

	@Autowired
	private pubService service;
	
	@Autowired
	private MasterDaoInter mastercShop;
	
	@RequestMapping(value = "/mypage")
	public String myPage(HttpSession session, Model model) {
		int totalRecord = service.totalboss();
		
		//파이차트
		List<PopulDTO> list = service.getPie();
		model.addAttribute("list", list);
		
		System.out.println("total"+totalRecord);
		session.setAttribute("totalRecord", totalRecord);
		return "master/MyPage";
	}
	
	@GetMapping(value = "/UpdateForm")
	public String Update(Model m, ShopDTO shop) {
		m.addAttribute("sh", shop);
		return "master/UpdateForm";
	}
	
	@RequestMapping(value = "/masterkorea")
	public String Index() {
		return "master/korea";
	}

	@GetMapping(value = "/mastercShop")
	public String mastercShop(Model model, String cPage, String name) {
		name = returnName(name);
		int totalRecord = mastercShop.totalShop(name);
		model.addAttribute("totalRecord", totalRecord);
		return "master/ShopList";
	}
	
	public String returnName(String name) {
		 if(name.contains("Seoul")) {
			 name = "서울";
		 }else if(name.contains("Busan")) {
			 name = "부산";
		 }else if(name.contains("Daegu")) {
			 name = "대구";
		 }else if(name.contains("Incheon")) {
			 name = "인천";
		 }else if(name.contains("Gwangju")) {
			 name = "광주";
		 }else if(name.contains("Daejeon")) {
			 name = "대전";
		 }else if(name.contains("Ulsan")) {
			 name = "울산";
		 }else if(name.contains("Sejong")) {
			 name = "세종";
		 }		 if(name.contains("Gyeonggi-do")) {
			 name = "경기도";
		 }else if(name.contains("Gangwon-do")) {
			 name = "강원도";
		 }else if(name.contains("Chungcheongbuk-do")) {
			 name = "충청북도";
		 }else if(name.contains("Chungcheongnam-do")) {
			 name = "충청남도";
		 }else if(name.contains("Jeollabuk-do")) {
			 name = "전라북도";
		 }else if(name.contains("Jeollanam-do")) {
			 name = "전라남도";
		 }else if(name.contains("Gyeongsangbuk-do")) {
			 name = "경상북도";
		 }else if(name.contains("Gyeongsangnam-do")) {
			 name = "경상남도";
		 }else if(name.contains("Jeju-do")) {
			 name = "제주";
		 }
		return name;
	}
	
	@RequestMapping(value = "/schedule")
	public String shopList(Model model, String cPage) {
		int totalRecord = service.totalshop();
		model.addAttribute("totalRecord", totalRecord);
		model.addAttribute("cPage", cPage);
		return "master/ajax/ajax_edate";
	}
	
	@RequestMapping(value = "/shopList")
	public String masterShop(Model model, @RequestParam(defaultValue = "1") String cPage) {
		model.addAttribute("cPage", cPage);
		return "master/MasterList";
	}

	@PostMapping(value = "confirm")
	public String upConfirm(ShopDTO vo) {
		mastercShop.upConfirm(vo);
		return "redirect:shopList";
	}
	
	@PostMapping(value = "reject")
	public String delConfirm(ShopDTO vo) {
		mastercShop.delConfirm(vo);
		return "redirect:shopList";
	}
	
	@RequestMapping(value = "/piechart")
	public String piechart() {
		return "master/piechart";
	}
	
	@RequestMapping(value = "/expect")
	public String expect(Model m) {
		List<ExpectShopDTO> list = service.expectshop();
		for(ExpectShopDTO e : list) {
			System.out.println(e.getSname());
		}
		m.addAttribute("list", list);
		return "master/expectsales";
	}
	
	@RequestMapping("/email")
	public String emailform() {
		return "master/email";
	}
	
	@PostMapping("/emailsend")
	public String emailSend(Model m, String mymail, String youmail, String title, String cont) {
		List<PopulDTO> list = service.getPie();
		m.addAttribute("list", list);
		return "master/MyPage";
	}
	
}