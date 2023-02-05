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
	@Autowired private StudentService studentService;
	@Autowired private IdService idService;
	
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
	
	// 학생 삭제
	@GetMapping("/student/removeStudent")
	public String removeStudent(int studentNo) {
		int row = studentService.removeStudent(studentNo);
		
		return "redirect:/student/studentList";
	}
	
	// 학생 등록 addStudent.jsp 폼
	@GetMapping("/student/addStudent")
	public String addStudent() {
		return "student/addStudent";
	}
	
	// 학생 등록 addStudent.jsp 액션
	@PostMapping("/student/addStudent")
	public String addStudent(Model model, Student student) {
		// 아이디 중복체크
		String idCheck = idService.getIdCheck(student.getStudentId());
		if(idCheck != null) {
			model.addAttribute("msg", "중복된아이디");
			return "student/addStudent";
		}
		
		int row = studentService.addStudent(student);
		if(row == 0) {
			model.addAttribute("msg", "시스템 에러로 등록 실패");
			return "student/addStudent";
		}
		return "redirect:/student/studentList";
	}
	
	// 학생목록 studentList.jsp employee가 보는 학생 목록
	@GetMapping("/student/studentList")
	public String studentList(Model model
								, @RequestParam(value="currentPage", defaultValue="1") int currentPage
								, @RequestParam(value="rowPerPage", defaultValue="10") int rowPerPage) {
		List<Student> list = studentService.getStudentList(currentPage, rowPerPage);
		int count = studentService.getStudentCount();
		int lastPage = 0;
		if(count % rowPerPage == 0) {
			lastPage = count / rowPerPage;
		} else if(count % rowPerPage != 0) {
			lastPage = (count / rowPerPage) + 1;
		}
		model.addAttribute("list", list);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("lastPage", lastPage);
		
		return "student/studentList";
	}
}
