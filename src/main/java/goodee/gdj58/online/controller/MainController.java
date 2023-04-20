package goodee.gdj58.online.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import goodee.gdj58.online.service.MainService;
import goodee.gdj58.online.vo.Employee;
import goodee.gdj58.online.vo.Student;
import goodee.gdj58.online.vo.Teacher;

@Controller
public class MainController {
	@Autowired MainService mainService;
	
	// 메인페이지
	@GetMapping("/main")
	public String main(HttpSession session, Model model) {
		
		// 로그인 정보 불러오기
		Employee loginEmp = null;
		Teacher loginTeacher = null;
		Student loginStudent = null;
		
		if(session.getAttribute("loginEmp") != null) {
			loginEmp = (Employee)session.getAttribute("loginEmp");
			session.setAttribute("loginEmp", loginEmp);
		} else if(session.getAttribute("loginTeacher") != null) {
			loginTeacher = (Teacher)session.getAttribute("loginTeacher");
			session.setAttribute("loginTeacher", loginTeacher);
		} else if(session.getAttribute("loginStudent") != null) {
			loginStudent = (Student)session.getAttribute("loginStudent");
			session.setAttribute("loginStudent", loginStudent);
		} else if(loginEmp == null && loginTeacher == null && loginStudent == null) {
			return "redirect:/index";
		}
		
		// 강사 인원수, 학생 인원수, 등록된 시험지 수
		int teacherCount = mainService.getTeacherCount();
		int studentCount = mainService.getStudentCount();
		int testCount = mainService.getTestCount();
		
		// 시험목록
		List<Map<String, Object>> testList = mainService.getTestList();
		
		model.addAttribute("teacherCount", teacherCount);
		model.addAttribute("studentCount", studentCount);
		model.addAttribute("testCount", testCount);
		model.addAttribute("testList", testList);
		
		return "main";
	}
}
