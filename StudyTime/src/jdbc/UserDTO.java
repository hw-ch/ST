package jdbc;

import lombok.AllArgsConstructor;
import lombok.Data;


@AllArgsConstructor
@Data
public class UserDTO {
	
	private String userId, password, nickName, name, ts, gender, image, phone;
	
}