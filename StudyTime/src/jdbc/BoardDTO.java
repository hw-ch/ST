package jdbc;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@AllArgsConstructor
@Data
public class BoardDTO {
	
	private String bNo, subject, content, nickName, userId, hit, good, bad, regDate, uptDate, replyNum;

}