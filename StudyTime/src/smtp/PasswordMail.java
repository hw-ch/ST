package smtp;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import jdbc.UserDAO;

public class PasswordMail {
public static void sending(String id, String name, String phone) {
		
		//인증코드 생성 숫자 , 랜덤 대문자 섞기
		Random ran = new Random();
		StringBuffer br = new StringBuffer();
		for(int i =0; i<6; i++) {
			if(ran.nextBoolean()) {
				br.append((int)(ran.nextInt(10))); // 0~9까지 랜덤 한 숫자
			}	else {
				br.append((char)((int)(Math.random()*26)+65));	// 아스키 코드 65 ~ 90은 대문자 
			}
		}
		String br1 = br.toString();	//Stringbuffer를 String으로 바꾸기
		
		
		Map<String, String> emailInfo = new HashMap<String, String>();

		emailInfo.put("from", "secure3141@gmail.com"); //보내는 사람 , 변동 불가, 반드시 본인의 메일주소
		emailInfo.put("to", id); //받는 사람
		emailInfo.put("subject", "STUDY TIME 계정 - 비밀번호 변경 안내");// 메일 제목
		emailInfo.put("content", name + " 회원님 비밀번호 변경을 도와드리겠습니다.\n"
									  + "임시 비밀번호는 [" + br + "]" + "입니다.\n"
									  + "비밀번호 변경 페이지에서 임시 비밀번호를 이용해 비밀번호 변경 부탁드립니다.");// 메일 내용

		emailInfo.put("format", "text/plain;charset=UTF-8");// 메일의 형식을 설정 일단 text 로 고정

		UserDAO.updatePw(id, br1);	//임시비밀번호로 변경.
		
		try {
			GoogleSMTP smtpServer = new GoogleSMTP(); //메일 전송 객체 생성
			smtpServer.emailSending(emailInfo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
}
