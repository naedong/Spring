package kr.co.bteam.mvc.controller.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.bteam.mvc.dao.UserDaoInter;
import kr.co.bteam.mvc.dao.UserShopDAOInter;
import kr.co.bteam.mvc.service.pubService;
import kr.co.bteam.mvc.vo.BossDTO;
import kr.co.bteam.mvc.vo.UserDTO;

@Controller
@RequestMapping(value = "/user")
public class UserController {

	@Autowired
	private MailSendService mailService;

	@Autowired
	private UserDaoInter userList;

	@Autowired
	private UserShopDAOInter usercShop;

	@Autowired
	private pubService service;

	@RequestMapping(value = "/userForm")
	public String userForm() {
		return "user/userForm";
	}

	// 일반유저 회원가입
	@PostMapping(value = "/userSign")
	public String userSign(UserDTO vo) {
		userList.insertuser(vo);
		return "redirect:/main";
	}

	// 보스유저 회원가입
	@PostMapping(value = "/bossSign")
	public String bossSign(UserDTO vo) {
		service.insertBoss(vo);
		return "redirect:/main";
	}

	@RequestMapping(value = "/mypage")
	public String userMypage() {
		return "user/MyPage";
	}

	@RequestMapping(value = "/setUP")
	public String userUP(BossDTO vo) {
		return "user/MyPage";
	}

	@RequestMapping(value = "/stat")
	public String userstat(BossDTO vo) {
		return "user/MyPage";
	}

	@RequestMapping(value = "/userList")
	public String userList(Model model, String cPage) {
		int totalRecord = userList.totalUser();
		model.addAttribute("totalRecord", totalRecord);
		return "master/UserList";
	}

	@RequestMapping(value = "/idcheck", method = RequestMethod.GET)
	public String idcheck(Model m, @RequestParam("id") String id) {
		System.out.println("Ajax InputID : " + id);
		int cnt = userList.idcheck(id);
		System.out.println("IDCHECK CNT: " + cnt);
		m.addAttribute("msg", cnt);
		return "user/login/idchk";
	}

	@RequestMapping(value = "/mailCheck", method = RequestMethod.GET)
	@ResponseBody // 비동기 응답본문, url이 아닌 String값 자체 반환
	public String mailCheck(String email) {
		System.out.println("From Ajax Email : " + email);
		return mailService.joinEmail(email);
	}

	@GetMapping(value = "/usercShop")
	public String usercShop(Model model, String cPage, String name) {
		 if(name.contains("Seoul")) {
			 name = "서울";
			 System.out.println("name"+name);
		 }else if(name.contains("Busan")) {
			 name = "부산";
		 }else if(name.contains("Daegu")) {
			 name = "대전";
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
			 name = "경상북도";
		 }else if(name.contains("Chungcheongnam-do")) {
			 name = "경상남도";
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
	
		int num = usercShop.totalUserShop(name);
		model.addAttribute("totalRecord", num);
		return "user/ShopList";
	}
	
	@GetMapping(value = "/delete")
    public String getDel(Model m, String cPage,String nu) {
        service.deluser(Integer.parseInt(nu));
        return "redirect:userList";
    }
}
