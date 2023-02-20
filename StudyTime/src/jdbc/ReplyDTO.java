package jdbc;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@AllArgsConstructor
@Data
public class ReplyDTO {
	private String rNo, bNo, content, nickname, userid, regDate;
}
