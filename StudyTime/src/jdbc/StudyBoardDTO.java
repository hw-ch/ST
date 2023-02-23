package jdbc;

import lombok.AllArgsConstructor;
import lombok.Data;

@AllArgsConstructor
@Data
public class StudyBoardDTO {
	
	public StudyBoardDTO() {
		// TODO Auto-generated constructor stub
	}

	private String bNo, subject, content, nickName, userId, hit, good, bad, regDate, uptDate, replyNum, sNo;

}