package goodee.gdj58.online.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HelloController {
	/*
	@GetMapping("/test") // localhost/online-test/abc/123 이라고 요청이 들어오면 
	public String test() { // localhost/online-test/abc/123
		return "test"; // test view를 반환
	}
	
	@RequestMapping(value="/test2", method=RequestMethod.GET)
	public String test2() {
		System.out.println("test2...");
		return "test"; // 뷰이름
	}
	
	@GetMapping("/test")  
	public void test() { // 리턴타입이 void면 메서드 이름이 뷰 이름이다
		System.out.println("test2...");
	}
	
	
	@GetMapping("/test")  
	public ModelAndView test() { // 리턴타입이 void면 메서드 이름이 뷰 이름이다
		System.out.println("ModelAndView test2...");
		ModelAndView mv = new ModelAndView();
		mv.setViewName("test");
		return mv;
	}
	*/
	
}
