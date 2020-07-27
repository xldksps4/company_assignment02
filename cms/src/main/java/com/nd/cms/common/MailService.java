package com.nd.cms.common;

//import com.nd.project2.common.MailService.1;
import com.nd.cms.employee.model.vo.Employee;
import java.io.UnsupportedEncodingException;
import java.util.Properties;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.Message.RecipientType;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Service;

@Service
public class MailService {
	private static final Logger logger = LoggerFactory.getLogger(MailService.class);
	private JavaMailSenderImpl mailSender;

	public MailService(JavaMailSenderImpl mailSender) {
		this.mailSender = mailSender;
	}

	public void sendMail(Employee emp, int type) {
      String host = this.mailSender.getHost();
      String username = this.mailSender.getUsername();
      String password = this.mailSender.getPassword();
      String port = this.mailSender.getHost();
      String subject = "";
      String text = "";
      String toAddress = "";
      switch(type) {
      case 1:
         subject = "[���㾾�ؾ�] ȸ������ ���� Ȯ��";
         text = text + "<div style='border: 1px solid gray; background-color: #e6eeff; padding: 20px;'>";
         text = text + "<h1><strong>���㾾�ؾ�</strong> ��°��� �ý��ۿ��� �߼۵� �����Դϴ�. </h1>";
         text = text + "<hr style='border: 1px solid #003399;'>";
         text = text + "<div>";
         text = text + "<h4> " + emp.getEmp_name() + " �Բ��� ȸ������ ���� ��û�� �Ͽ����ϴ�. Ȯ�� �ٶ��ϴ�. </h4>";
         text = text + "<h4>���� ��û�� ���̵� : " + emp.getEmp_id() + "</h4>";
         text = text + "<br>";
         text = text + "<h4><a href='http://cms.ndcc.co.kr/'>�ٷΰ���(Ŭ��)</a></h4>";
         text = text + "<br>";
         text = text + "</div>";
         toAddress = this.mailSender.getUsername();
         break;
      case 2:
         subject = "[���㾾�ؾ�] ȸ�������� �Ϸ�Ǿ����ϴ�.";
         text = text + "<div style='border: 1px solid gray; background-color: #e6eeff; padding: 20px;'>";
         text = text + "<h1><strong>���㾾�ؾ�</strong> ��°��� �ý��ۿ��� �߼۵� �����Դϴ�. </h1>";
         text = text + "<hr style='border: 1px solid #003399;'>";
         text = text + "<div>";
         text = text + "<h4> " + emp.getEmp_name() + " ���� ȸ�������� ���εǾ����ϴ�.</h4>";
         text = text + "<br>";
         text = text + "<h4><a href='http://cms.ndcc.co.kr/'>�ٷΰ���(Ŭ��)</a></h4>";
         text = text + "<br>";
         text = text + "</div>";
         toAddress = emp.getEmail();
         break;
      case 3:
         subject = "[���㾾�ؾ�] " + emp.getEmp_name() + "���� Ż�� ��û Ȯ��";
         text = text + "<div style='border: 1px solid gray; background-color: #e6eeff; padding: 20px;'>";
         text = text + "<h1><strong>���㾾�ؾ�</strong> ��°��� �ý��ۿ��� �߼۵� �����Դϴ�. </h1>";
         text = text + "<hr style='border: 1px solid #003399;'>";
         text = text + "<div>";
         text = text + "<h4> " + emp.getEmp_name() + "���� Ż�� ��û �ȳ� �����Դϴ�.</h4>";
         text = text + "<h4>Ż�� ��û�� ���̵� : " + emp.getEmp_id() + "</h4>";
         text = text + "<br>";
         text = text + "<h4><a href='http://cms.ndcc.co.kr/'>�ٷΰ���(Ŭ��)</a></h4>";
         text = text + "<br>";
         text = text + "</div>";
         toAddress = this.mailSender.getUsername();
         break;
      case 4:
         subject = "[���㾾�ؾ�] " + emp.getEmp_name() + "���� ID ã�� �ȳ� ����";
         text = text + "<div style='border: 1px solid gray; background-color: #e6eeff; padding: 20px;'>";
         text = text + "<h1><strong>���㾾�ؾ�</strong> ��°��� �ý��ۿ��� �߼۵� �����Դϴ�. </h1>";
         text = text + "<hr style='border: 1px solid #003399;'>";
         text = text + "<div>";
         text = text + "<h4> " + emp.getEmp_name() + "���� ID ã�� �ȳ� �����Դϴ�.</h4>";
         text = text + "<h4>ã�� ��û�� ���̵� : " + emp.getEmp_id() + "</h4>";
         text = text + "<br>";
         text = text + "<h4><a href='http://cms.ndcc.co.kr/'>�ٷΰ���(Ŭ��)</a></h4>";
         text = text + "<br>";
         text = text + "</div>";
         toAddress = emp.getEmail();
         break;
      case 5:
         subject = "[���㾾�ؾ�] " + emp.getEmp_name() + "���� �ӽ� ��й�ȣ �ȳ� ����";
         text = text + "<div style='border: 1px solid gray; background-color: #e6eeff; padding: 20px;'>";
         text = text + "<h1><strong>���㾾�ؾ�</strong> ��°��� �ý��ۿ��� �߼۵� �����Դϴ�. </h1>";
         text = text + "<hr style='border: 1px solid #003399;'>";
         text = text + "<div>";
         text = text + "<h4> " + emp.getEmp_name() + "���� �ӽ� ��й�ȣ �ȳ� �����Դϴ�.</h4>";
         text = text + "<h4>�ӽ� ��й�ȣ : " + emp.getEmp_pwd() + "</h4>";
         text = text + "<h4>�α��� �� �� ���� �� ��й�ȣ �������� ��й�ȣ�� �������ּ���.</h4>";
         text = text + "<br>";
         text = text + "<h4><a href='http://cms.ndcc.co.kr/'>�ٷΰ���(Ŭ��)</a></h4>";
         text = text + "<br>";
         text = text + "</div>";
         toAddress = emp.getEmail();
      }

      Properties props = System.getProperties();
      props.put("mail.smtp.host", host);
      props.put("mail.smtp.port", port);
      props.put("mail.smtp.auth", "true");
      props.put("mail.smtp.ssl.enable", "true");
      props.put("mail.smtp.ssl.trust", host);
//      Session session = Session.getDefaultInstance(props, new 1(this, username, password));
//      session.setDebug(true);
//      MimeMessage mimeMessage = new MimeMessage(session);

//      try {
//         mimeMessage.setFrom(new InternetAddress(username, "���㾾�ؾ� ��°����ý���"));
//         mimeMessage.setRecipient(RecipientType.TO, new InternetAddress(toAddress));
//         mimeMessage.setSubject(MimeUtility.encodeText(subject, "UTF-8", "B"));
//         mimeMessage.setText(text);
//         mimeMessage.setContent(text, "text/html; charset=UTF-8");
//         Transport.send(mimeMessage);
//         logger.info("send Mail...");
//      } catch (MessagingException | UnsupportedEncodingException var14) {
//         var14.printStackTrace();
//      }

   }
}