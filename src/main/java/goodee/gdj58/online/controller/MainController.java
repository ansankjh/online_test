package goodee.gdj58.online.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import goodee.gdj58.online.vo.Employee;
import goodee.gdj58.online.vo.Student;
import goodee.gdj58.online.vo.Teacher;

@Controller
public class MainController {
	// 메인페이지
	@GetMapping("/main")
	public String main(HttpSession session) {
		// 로그인 정보 불러오기
		Employee loginEmp = (Employee)session.getAttribute("loginEmp");
		Teacher loginTeacher = (Teacher)session.getAttribute("loginTeacher");
		Student loginStudent = (Student)session.getAttribute("loginStudent");
		
		// 비로그인은 접근불가
		if(loginEmp == null && loginTeacher == null && loginStudent == null) {
			return "index";
		}
		
		
		return "main";
	}
}
