package smtp;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class PasswordMailTest {

	
	
	private final Properties serverInfo; //서버 정보
	private final Authenticator auth;    //인증 정보
	
	String user = "secure3141@gmail.com";
	String password = "ashjgznhknslqtce";
	
	public PasswordMailTest() {
		//생성자의 2가지 특징
		//1. 클래스명과 동일  2.리턴 타입이 없다. 
		serverInfo = new Properties();
		serverInfo.put("mail.smtp.host", "smtp.gmail.com"); //메일 서버 지정
		serverInfo.put("mail.smtp.port", "465"); // 포트 번호    거의 대부분 통일
		serverInfo.put("mail.smtp.starttls.enable", "true");
		serverInfo.put("mail.smtp.auth", "true");
		serverInfo.put("mail.smtp.debug", "true");
		serverInfo.put("mail.smtp.socketFactory.port", "465");
		serverInfo.put("mail.smtp.socketFactory.class", 
				"javax.net.ssl.SSLSocketFactory");
		serverInfo.put("mail.smtp.socketFactory.fallback", "false");
		
		serverInfo.put("mail.smtp.ssl.protocols", "TLSv1.2"); //맥에서 반드시
		
		// 사용자 인증 정보
		auth = new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(user, password);
			}
		};
	}
}
