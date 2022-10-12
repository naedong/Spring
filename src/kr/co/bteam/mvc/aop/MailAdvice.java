package kr.co.bteam.mvc.aop;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import kr.co.bteam.mvc.controller.user.MailSendService;
import kr.co.bteam.mvc.dao.UserDaoInter;
import kr.co.bteam.mvc.vo.MyLoginLogDTO;

@Component
@Aspect
public class MailAdvice {
	
	@Autowired
	private MailSendService mailService;
	
	
	@Pointcut("execution(* kr.co.bteam.mvc.controller.master.MasterController.*Send(..))")
	public void dumi() {}
	
	@Around(value = "dumi()")
	public String mailLogger(ProceedingJoinPoint jp) {
		String url = null;
		Object[] args = jp.getArgs();
		try {
			url = (String) jp.proceed();
			String mymail = (String) args[1];
			String youmail = (String) args[2];
			String title = (String) args[3];
			String cont = (String) args[4];
			mailService.mailSend(mymail, youmail, title, cont);
		} catch (Throwable e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return url;
	}
}

