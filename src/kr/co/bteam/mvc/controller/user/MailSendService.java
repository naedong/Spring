package kr.co.bteam.mvc.controller.user;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;
@Component	//�� �ڵ������ ���� ������̼�
public class MailSendService {
	@Autowired
	private JavaMailSenderImpl mailSender;
	private int authNumber;
	
	//�����ڵ� ���� �߻�(6�ڸ�)
	public void makeRandomNumber() {
		int checkNum = (int) (Math.random()*(999999-100000+1))+100000;
		System.out.println("������ȣ : "+checkNum);
		authNumber = checkNum;
	}

	//�̸��� ���
	public String joinEmail(String email) {
		makeRandomNumber();
		String setFrom = "dhwlee@naver.com";	//�ڽ��� �̸����ּ� �Է�
		String toMail = email;
		String title = "[BTEAM2] ȸ������ ���������Դϴ�.";	//�̸��� ����
		
		//�̸��� ����
		StringBuilder sb = new StringBuilder();
		sb.append("Ȩ�������� �湮���ּż� �����մϴ�.").append("<br><br>");
		sb.append("������ȣ�� <b>").append(authNumber).append("</b>�Դϴ�.").append("<br>");
		sb.append("�� ������ȣ�� ������ȣ Ȯ�ζ��� �����Ͽ��ּ���.");
		String content = sb.toString();
		
		mailSend(setFrom, toMail, title, content);
		return Integer.toString(authNumber);
	}
	
	public void mailSend(String setFrom, String toMail, String title, String content) {
		MimeMessage message = mailSender.createMimeMessage();
		try {
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content, true);
			mailSender.send(message);
		} catch (MessagingException e) {
			e.printStackTrace();
		}		
	}
}
