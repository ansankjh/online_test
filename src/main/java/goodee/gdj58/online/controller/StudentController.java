package goodee.gdj58.online.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import goodee.gdj58.online.service.IdService;
import goodee.gdj58.online.service.StudentService;
import goodee.gdj58.online.vo.Employee;
import goodee.gdj58.online.vo.Student;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class StudentController {
	@Autowired StudentService studentService;
	@Autowired IdService idService;
	
	// 학생 비밀번호 수정 폼
	@GetMapping("/student/modifyStudentPw")
	public String modifyStudentPw() {
		return "student/modifyStudentPw";
	}
	
	// 학생 비밀번호 수정 액션
	@PostMapping("/student/modifyStudentPw")
	public String modifyStudentPw(HttpSession session
								, @RequestParam(value="oldPw") String oldPw
								, @RequestParam(value="newPw") String newPw) {
		Student loginStudent = (Student)session.getAttribute("loginStudent");
		
		studentService.updateStudentPw(loginStudent.getStudentNo(), oldPw, newPw);
		
		return "redirect:/student/studentList";
	}
	
	// 학생 로그인 폼 loginStudent.jsp
	@GetMapping("/loginStudent")
	public String loginStudent() {
		return "student/loginStudent";
	}
	
	// 학생 로그인 액션 loginStudent.jsp
	@PostMapping("loginStudent")
	public String loginStudent(HttpSession session, Student student) {
		Student resultStudent = studentService.loginStudent(student);
		session.setAttribute("loginStudent", resultStudent);
		return "redirect:/student/studentList";
	}
	
	// 학생 로그아웃
	@GetMapping("/student/studentLogout")
	public String studentLogout(HttpSession session) {
		session.invalidate();
		return "redirect:/student/studentList";
	}
}
