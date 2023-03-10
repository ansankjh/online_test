package goodee.gdj58.online.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import goodee.gdj58.online.vo.Employee;
import goodee.gdj58.online.vo.Student;
import goodee.gdj58.online.vo.Teacher;

@Controller
public class IndexController {
	// 로그인 페이지
	@GetMapping("/index")
	public String index(HttpSession session) {
		return "index";
	}
}
