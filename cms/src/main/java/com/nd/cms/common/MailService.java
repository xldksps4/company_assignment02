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
         subject = "[내담씨앤씨] 회원가입 승인 확인";
         text = text + "<div style='border: 1px solid gray; background-color: #e6eeff; padding: 20px;'>";
         text = text + "<h1><strong>내담씨앤씨</strong> 경력관리 시스템에서 발송된 메일입니다. </h1>";
         text = text + "<hr style='border: 1px solid #003399;'>";
         text = text + "<div>";
         text = text + "<h4> " + emp.getEmp_name() + " 님께서 회원가입 승인 요청을 하였습니다. 확인 바랍니다. </h4>";
         text = text + "<h4>가입 요청한 아이디 : " + emp.getEmp_id() + "</h4>";
         text = text + "<br>";
         text = text + "<h4><a href='http://cms.ndcc.co.kr/'>바로가기(클릭)</a></h4>";
         text = text + "<br>";
         text = text + "</div>";
         toAddress = this.mailSender.getUsername();
         break;
      case 2:
         subject = "[내담씨앤씨] 회원가입이 완료되었습니다.";
         text = text + "<div style='border: 1px solid gray; background-color: #e6eeff; padding: 20px;'>";
         text = text + "<h1><strong>내담씨앤씨</strong> 경력관리 시스템에서 발송된 메일입니다. </h1>";
         text = text + "<hr style='border: 1px solid #003399;'>";
         text = text + "<div>";
         text = text + "<h4> " + emp.getEmp_name() + " 님의 회원가입이 승인되었습니다.</h4>";
         text = text + "<br>";
         text = text + "<h4><a href='http://cms.ndcc.co.kr/'>바로가기(클릭)</a></h4>";
         text = text + "<br>";
         text = text + "</div>";
         toAddress = emp.getEmail();
         break;
      case 3:
         subject = "[내담씨앤씨] " + emp.getEmp_name() + "님의 탈퇴 요청 확인";
         text = text + "<div style='border: 1px solid gray; background-color: #e6eeff; padding: 20px;'>";
         text = text + "<h1><strong>내담씨앤씨</strong> 경력관리 시스템에서 발송된 메일입니다. </h1>";
         text = text + "<hr style='border: 1px solid #003399;'>";
         text = text + "<div>";
         text = text + "<h4> " + emp.getEmp_name() + "님의 탈퇴 요청 안내 메일입니다.</h4>";
         text = text + "<h4>탈퇴 요청한 아이디 : " + emp.getEmp_id() + "</h4>";
         text = text + "<br>";
         text = text + "<h4><a href='http://cms.ndcc.co.kr/'>바로가기(클릭)</a></h4>";
         text = text + "<br>";
         text = text + "</div>";
         toAddress = this.mailSender.getUsername();
         break;
      case 4:
         subject = "[내담씨앤씨] " + emp.getEmp_name() + "님의 ID 찾기 안내 메일";
         text = text + "<div style='border: 1px solid gray; background-color: #e6eeff; padding: 20px;'>";
         text = text + "<h1><strong>내담씨앤씨</strong> 경력관리 시스템에서 발송된 메일입니다. </h1>";
         text = text + "<hr style='border: 1px solid #003399;'>";
         text = text + "<div>";
         text = text + "<h4> " + emp.getEmp_name() + "님의 ID 찾기 안내 메일입니다.</h4>";
         text = text + "<h4>찾기 요청한 아이디 : " + emp.getEmp_id() + "</h4>";
         text = text + "<br>";
         text = text + "<h4><a href='http://cms.ndcc.co.kr/'>바로가기(클릭)</a></h4>";
         text = text + "<br>";
         text = text + "</div>";
         toAddress = emp.getEmail();
         break;
      case 5:
         subject = "[내담씨앤씨] " + emp.getEmp_name() + "님의 임시 비밀번호 안내 메일";
         text = text + "<div style='border: 1px solid gray; background-color: #e6eeff; padding: 20px;'>";
         text = text + "<h1><strong>내담씨앤씨</strong> 경력관리 시스템에서 발송된 메일입니다. </h1>";
         text = text + "<hr style='border: 1px solid #003399;'>";
         text = text + "<div>";
         text = text + "<h4> " + emp.getEmp_name() + "님의 임시 비밀번호 안내 메일입니다.</h4>";
         text = text + "<h4>임시 비밀번호 : " + emp.getEmp_pwd() + "</h4>";
         text = text + "<h4>로그인 후 내 정보 → 비밀번호 수정에서 비밀번호를 변경해주세요.</h4>";
         text = text + "<br>";
         text = text + "<h4><a href='http://cms.ndcc.co.kr/'>바로가기(클릭)</a></h4>";
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
//         mimeMessage.setFrom(new InternetAddress(username, "내담씨앤씨 경력관리시스템"));
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