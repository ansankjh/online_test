package goodee.gdj58.online.vo;

import java.util.List;

import lombok.Data;

@Data
public class Example {
	private int exampleNo;
	private int questionNo;
	private int exampleIdx;
	private String exampleTitle;
	private String ox;
	
	// 보기 여러개 받기 위한 list
	private List<Example> exampleList;
}
