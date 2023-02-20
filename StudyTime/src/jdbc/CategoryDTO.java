package jdbc;

import lombok.AllArgsConstructor;
import lombok.Data;

@AllArgsConstructor
@Data
public class CategoryDTO {
	
	private String cNo, category1, category2;

	public CategoryDTO(String category1) {
		super();
		this.category1 = category1;
	}

	
}