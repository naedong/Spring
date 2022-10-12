package kr.co.bteam.mvc.aop;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;

import kr.co.bteam.mvc.page.PageListInter;
import kr.co.bteam.mvc.page.SearchListInet;
import kr.co.bteam.mvc.page.ShopListInter;

import kr.co.bteam.mvc.vo.SuperDTO;

@Component
@Aspect
public class PageModulesAdvice {

	@Autowired
	private ApplicationContext applicationContext;

	private int nowPage = 1;
	private int nowBlock = 1;
	private int totalRecord = 0;
	private int numPerPage = 10;
	private int pagePerBlock = 5;
	private int totalPage = 0;
	private int totalBlock = 0;
	private int beginPerPage = 0;
	private int endPerPage = 0;

	@Around("execution(* kr.co.bteam.mvc.controller.*.*Controller.*List(..))")
	public String pageModule(ProceedingJoinPoint jp) {
		Object[] args = jp.getArgs();
		String keyword = null;
		String type = null;
		Model m = (Model) args[0];
		String cPage = (String) args[1];
		String snum = null;
		// snum���ڸ� �޴� �޼��带 ���� �߰�
		if (args.length > 2) {
			snum = (String) args[2];
		}
		String myDao = jp.getSignature().getName();
		PageListInter pageListInter = applicationContext.getBean(myDao, PageListInter.class);
		String url = null;
		try {
			url = (String) jp.proceed();
			totalRecord = (int) m.asMap().get("totalRecord");
			totalPage = (int) Math.ceil(totalRecord / (double) numPerPage);
			totalBlock = (int) Math.ceil((double) totalPage / pagePerBlock);
			String s_page = cPage;
			if (s_page != null) {
				nowPage = Integer.parseInt(s_page);
			}
			beginPerPage = (nowPage - 1) * numPerPage + 1;
			endPerPage = (beginPerPage - 1) + numPerPage;
			Map<String, Object> map = new HashMap<String, Object>(); // <String, Object> Ÿ������ ����
			map.put("begin", beginPerPage);
			map.put("end", endPerPage);
			if (snum != null) { // snum�� �ޱ����� 3��° ���ڰ� �����Ҷ� snum�� Map�� ����
				map.put("snum", snum);
			}
			List<? extends SuperDTO> list = pageListInter.getList(map);
			m.addAttribute("list", list);
			int startPage = (int) ((nowPage - 1) / pagePerBlock) * pagePerBlock + 1;
			int endPage = startPage + pagePerBlock - 1;
			if (endPage > totalPage) {
				endPage = totalPage;
			}
			m.addAttribute("startPage", startPage);
			m.addAttribute("endPage", endPage);
			m.addAttribute("nowPage", nowPage);
			m.addAttribute("pagePerBlock", pagePerBlock);
			m.addAttribute("totalPage", totalPage);
		} catch (Throwable e) {
			e.printStackTrace();
		}
		System.out.println("url=>" + url);
		return url;
	}
	
	@Around("execution(* kr.co.bteam.mvc.controller.*.*Controller.*cShop(..))")
	public String pageShopModule(ProceedingJoinPoint jp) {
		 Object[] args = jp.getArgs();
		 Model m = (Model) args[0];
		 String cPage = (String) args[1];
		 String name = (String) args[2];
		 name = returnName(name);
		 m.addAttribute("name", name);
		 String myDao = jp.getSignature().getName();
		 ShopListInter pageListInter =  applicationContext.getBean( myDao,ShopListInter.class);
		 String url=null;
		 try {
			url = (String) jp.proceed();
			 totalRecord = (int) m.asMap().get("totalRecord");
			 totalPage = (int) Math.ceil(totalRecord/(double)numPerPage);	 		 
			 totalBlock = (int) Math.ceil((double) totalPage/pagePerBlock);
			String s_page = cPage;
			if(s_page != null){
				nowPage = Integer.parseInt(s_page);
		    }
			beginPerPage = (nowPage - 1) * numPerPage + 1;
			endPerPage = (beginPerPage-1) + numPerPage;
			Map<String, Object> map = new HashMap<String, Object>();
		    map.put("begin", beginPerPage);
		    map.put("end", endPerPage);
		    map.put("name", name);
		    List<? extends SuperDTO> list = pageListInter.getShop(map); 
		    m.addAttribute("list", list);
			int startPage = (int)((nowPage-1)/pagePerBlock)*pagePerBlock+1;
			int endPage = startPage + pagePerBlock - 1;
			if(endPage > totalPage){
				endPage = totalPage;
		    }
			m.addAttribute("startPage", startPage);
			m.addAttribute("endPage", endPage);
			m.addAttribute("nowPage", nowPage);
			m.addAttribute("pagePerBlock", pagePerBlock);
			m.addAttribute("totalPage",totalPage);
		} catch (Throwable e) {
			e.printStackTrace();
		}
		 return url; 
	 }
	
	public String returnName(String name) {
		 if(name.contains("Seoul")) {
			 name = "����";
		 }else if(name.contains("Busan")) {
			 name = "�λ�";
		 }else if(name.contains("Daegu")) {
			 name = "�뱸";
		 }else if(name.contains("Incheon")) {
			 name = "��õ";
		 }else if(name.contains("Gwangju")) {
			 name = "����";
		 }else if(name.contains("Daejeon")) {
			 name = "����";
		 }else if(name.contains("Ulsan")) {
			 name = "���";
		 }else if(name.contains("Sejong")) {
			 name = "����";
		 }		 if(name.contains("Gyeonggi-do")) {
			 name = "��⵵";
		 }else if(name.contains("Gangwon-do")) {
			 name = "������";
		 }else if(name.contains("Chungcheongbuk-do")) {
			 name = "��û�ϵ�";
		 }else if(name.contains("Chungcheongnam-do")) {
			 name = "��û����";
		 }else if(name.contains("Jeollabuk-do")) {
			 name = "����ϵ�";
		 }else if(name.contains("Jeollanam-do")) {
			 name = "���󳲵�";
		 }else if(name.contains("Gyeongsangbuk-do")) {
			 name = "���ϵ�";
		 }else if(name.contains("Gyeongsangnam-do")) {
			 name = "��󳲵�";
		 }else if(name.contains("Jeju-do")) {
			 name = "����";
		 }
		return name;
	}
	
	@Around("execution(* kr.co.bteam.mvc.controller.*Controller.searchf(..))")
	public String searchModule(ProceedingJoinPoint jp) {
		Object[] args = jp.getArgs();
		Model m = (Model) args[0];
		String cPage = (String) args[1];

		
		String myDao = jp.getSignature().getName();
		SearchListInet pageListInter = applicationContext.getBean(myDao, SearchListInet.class);
		String url = null;
		try {
			url = (String) jp.proceed();
			String keyword =  (String) m.asMap().get("keyword");
			keyword = (String) args[3];
			
			totalRecord = (int) m.asMap().get("totalRecord");
			totalPage = (int) Math.ceil(totalRecord / (double) numPerPage);
			totalBlock = (int) Math.ceil((double) totalPage / pagePerBlock);
			String s_page = cPage;
			if (s_page != null) {
				nowPage = Integer.parseInt(s_page);
			}
			beginPerPage = (nowPage - 1) * numPerPage + 1;
			endPerPage = (beginPerPage - 1) + numPerPage;
			Map<String, Object> map = new HashMap<String, Object>(); // <String, Object> Ÿ������ ����
			map.put("begin", beginPerPage);
			map.put("end", endPerPage);
			map.put("keyword", keyword);
			
			
			if(m.asMap().get("sname") != null) {
				String sname = (String) m.asMap().get("sname");
				map.put("sname", sname);

				System.out.println("KeyWord"+sname);
			}else if(m.asMap().get("sloc") != null) {
				String sloc = (String) m.asMap().get("sloc");
				map.put("sloc", sloc);
			}
		
			List<? extends SuperDTO> list = pageListInter.getSearch(map);
			m.addAttribute("list", list);

			int startPage = (int) ((nowPage - 1) / pagePerBlock) * pagePerBlock + 1;
			int endPage = startPage + pagePerBlock - 1;
			if (endPage > totalPage) {
				endPage = totalPage;
			}
			m.addAttribute("startPage", startPage);
			m.addAttribute("endPage", endPage);
			m.addAttribute("nowPage", nowPage);
			m.addAttribute("pagePerBlock", pagePerBlock);
			m.addAttribute("totalPage", totalPage);
		} catch (Throwable e) {
			e.printStackTrace();
		}
		return url;
	}
}
