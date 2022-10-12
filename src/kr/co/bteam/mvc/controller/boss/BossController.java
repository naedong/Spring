package kr.co.bteam.mvc.controller.boss;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.server.PathParam;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.bteam.mvc.dao.BossDaoInter;
import kr.co.bteam.mvc.dao.ShopDaoInter;
import kr.co.bteam.mvc.service.pubService;
import kr.co.bteam.mvc.vo.BossDTO;
import kr.co.bteam.mvc.vo.ShopDTO;
import kr.co.bteam.mvc.vo.SinfoDTO;

@Controller
@RequestMapping(value = "/boss")
public class BossController {
	
	
	@Autowired
	private BossDaoInter bossList;
		
	@Autowired
	private pubService service;
	
	
	@RequestMapping(value = "/bossList")
	public String bossList(Model model, String cPage) {
		int totalRecord = bossList.totalboss();
		model.addAttribute("totalRecord", totalRecord);
		return "main/index";
	}
	
	@RequestMapping(value = { "/", "/main" })
	public String Default() {
		return "main/index";
	}
	
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public String mypage(Model m, int uno) {
		ShopDTO sho = service.bossdetail(uno);
		m.addAttribute("sho", sho);
		
		return "boss/MyPage";
	}
	

	@RequestMapping(value = "/entry", method = RequestMethod.GET)
	public String Entry(Model m, int uno) {
		m.addAttribute("uno", uno);
		return "boss/entry";
	}
	
	@RequestMapping("/adressPopup")
	public String popUp() {
		return "boss/adressPopup";
	}
	
	
	@GetMapping(value = "/BoardForm/{bnum}")
	public String boardForm(Model m, @PathVariable Integer bnum) {
		System.out.println(bnum);
		ShopDTO shop = service.myShop(bnum);
		m.addAttribute("shop", shop);
		return "master/BoardForm";
	}
	
	@RequestMapping("/UpdateForm")
	public String upDateForm() {
		return "boss/UpdateForm";
	}
	
	@GetMapping("/upset")
	public String Upset(Model m, HttpServletRequest request, @ModelAttribute("shop") ShopDTO shop) {
		System.out.println("upsetForm"+shop.getSnum());
		
		return "redirect:mypage";
	}
	
	@PostMapping(value = "/entryShop")
    public ModelAndView entryShop(Model m, @ModelAttribute("vo") ShopDTO vo,@RequestParam(defaultValue = "0") int uno) {
        System.out.println("EntryShop ����!");
        System.out.println("------------------------------------------");
        System.out.println("entry SessionNum: "+uno);
        System.out.println("vo.getSnum: "+vo.getSnum());
        System.out.println("vo.getSname: "+vo.getSname());
        System.out.println("vo.getSloc: "+vo.getSloc());
        System.out.println("vo.getScate: "+vo.getScate());
        System.out.println("vo.getOnoff: "+vo.getOnoff());
        
        ModelAndView mav = new ModelAndView("boss/entrycheck");
        mav.addObject("uno",uno);
        
        ShopDTO checkvo = service.checkShop(vo);
        if(checkvo == null) {
        	Map<String, Object> map = new HashMap<>();
        	System.out.println(uno);
            map.put("uno", (int) uno);
            map.put("sno", vo.getSnum());
            map.put("sna", vo.getSname());
            map.put("slo", vo.getSloc());
            map.put("sca", vo.getScate());
            map.put("onof", vo.getOnoff());
            bossList.entryshop(map);
            mav.addObject("msg","�����Ͽ� �����Ͽ����ϴ�.");
        }else if(checkvo.getCtf().equals("�ź�")){
        	System.out.println("���ΰźε� ���� ������: "+checkvo.getEdate());
        	String year = checkvo.getEdate().substring(0, 4);
        	String month = checkvo.getEdate().substring(5, 7);
        	String date = checkvo.getEdate().substring(8,10);
        	String[] edate = checkvo.getEdate().split("-");
        	String msg = "���ΰźε� �����Դϴ�. "+
        					year+"�� "+month+"�� "+date+"�� ���� ��� �����մϴ�.";
        	System.out.println(msg);
        	mav.addObject("msg", msg);
        }else {
        	mav.addObject("msg","�̹� ��ϵ� �����Դϴ�.");
        }
        return mav;
    }
	
	@RequestMapping(value = "/sinfoForm")
	public String sinfoForm() {
		return "boss/sinfoForm";
	}
	
	//�����
	@PostMapping(value = "/uploadpro")
	public String uploadFile(Model m, SinfoDTO dto, Integer uno, HttpServletRequest request) {
		System.out.println("dto.getMfile: "+dto.getMfile());
		System.out.println("uploadpro uno : "+uno);
		//���ε�� �̹����� �̸��� �޾Ƽ� �̹����� ����
		String img_path ="resources\\imgfile";
		
		String r_path = request.getRealPath("/"); //request�� ������ �̹����� ��θ� �޾Ƽ� ���
		long size = dto.getMfile().getSize();	//�̹��� ������
		String oriFn = dto.getMfile().getOriginalFilename(); //�̹��� �̸� Ȯ��
		String contentType = dto.getMfile().getContentType();
		
		System.out.println("r_path: "+r_path);
		System.out.println("oriFn : "+oriFn);	
		System.out.println("����ũ�� : "+size);		
		System.out.println("����Ÿ�� : "+contentType);
		
		//�޸𸮻�(�ӽ������)�� ������ �츮�� ������ ��ο� �����ϰڴ�.
		//�̹����� ����� ��� �����
		StringBuffer path = new StringBuffer();
		path.append(r_path).append(img_path).append("\\");
		path.append(oriFn);
		System.out.println("FullPath : "+path);
		
		//�߻���(�̹����� ������ ���)File ��ü�� ����
		File f = new File(path.toString());
		
		//�ӽø޸𸮿� ��� ��, ���ε��� ������ ���� ������ �� -> FileŬ������ ��η� ����.
		try {
			dto.getMfile().transferTo(f);
			
			// �̹��� �̸���  db�� �����ϱ� ���ؼ� DTO�� ���� �缳��
			dto.setImgn(oriFn);
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		Map<String, Object> map = new HashMap<>();
		map.put("uno", uno);
		map.put("iname", dto.getIname());
		map.put("iprice", dto.getIprice());
		map.put("istoke", dto.getIstoke());
		map.put("imgn", dto.getImgn());
		
		service.addUpBoard(map);
		return "redirect:mypage?uno="+uno;
	}
	
	//�����Ʈ
	@RequestMapping(value = "/sinfoList", method = RequestMethod.GET)
	public String sinfoList(Model model, String cPage, String snum) {
		int totalRecord = service.totalsinfo(snum);
		model.addAttribute("snum", snum);
		model.addAttribute("totalRecord", totalRecord);
		return "boss/sinfoList";
	}
	
	@PostMapping(value = "/upSname")
	public String upSname(ShopDTO vo, int uno) {
		service.upSname(vo);
		return "redirect:mypage?uno="+uno;
	}
	
	@PostMapping(value = "/upScate")
	public String upScate(ShopDTO vo, int uno) {
		service.upScate(vo);
		return "redirect:mypage?uno="+uno;
	}
	
	@PostMapping(value = "/upSloc")
	public String upSloc(ShopDTO vo, int uno) {
		service.upSloc(vo);
		return "redirect:mypage?uno="+uno;
	}
	
	@PostMapping(value = "/upIname")
	public String upIname(SinfoDTO vo, String snum) {
		service.upIname(vo);
		return "redirect:sinfoList?snum="+snum;
	}
	
	@PostMapping(value = "/upIprice")
	public String upIprice(SinfoDTO vo, String snum) {
		service.upIprice(vo);
		return "redirect:sinfoList?snum="+snum;
	}

	@PostMapping(value = "/upIstoke")
	public String upIstoke(SinfoDTO vo, String snum) {
		service.upIstoke(vo);
		return "redirect:sinfoList?snum="+snum;
	}
}
