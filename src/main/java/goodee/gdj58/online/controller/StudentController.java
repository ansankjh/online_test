package goodee.gdj58.online.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import goodee.gdj58.online.service.StudentService;
import goodee.gdj58.online.vo.Student;

@Controller
public class StudentController {
	@Autowired StudentService studentService;
	
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
	public String addStudent(Student student) {
		int row = studentService.addStudent(student);
		
		return "redirect:/student/studentList";
	}
	
	// 학생목록 studentList.jsp
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
