package goodee.gdj58.online.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class mainController {
	// 로그인 페이지
	@GetMapping("/main")
	public String main() {
		return "main";
	}
}
