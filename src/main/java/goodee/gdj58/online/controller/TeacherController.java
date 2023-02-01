package goodee.gdj58.online.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import goodee.gdj58.online.service.TeacherService;
import goodee.gdj58.online.vo.Teacher;

@Controller
public class TeacherController {
	@Autowired TeacherService teacherService;

	// 선생님 삭제
	@GetMapping("/teacher/removeTeacher")
	public String removeTeacher(int teacherNo) {
		int row = teacherService.removeTeacher(teacherNo);
		
		return "redirect:/teacher/teacherList";
	}
	
	// 선생님 등록 폼
	@GetMapping("/teacher/addTeacher")
	public String addTeacher() {
		return "teacher/addTeacher";
	}

	// 선생님 등록 액션
	@PostMapping("/teacher/addTeacher")
	public String addTeacher(Teacher teacher) {
		int row = teacherService.addTeacher(teacher);
		return "redirect:/teacher/teacherList";
	}
	
	// 선생님 목록
	@GetMapping("/teacher/teacherList")
	public String teacherList(Model model
								, @RequestParam(value="currentPage", defaultValue="1") int currentPage
								, @RequestParam(value="rowPerPage", defaultValue="10") int rowPerPage) {
		List<Teacher> list = teacherService.getTeacherList(currentPage, rowPerPage);
		int count = teacherService.getTeacherCount();
		int lastPage = 0;
		if(count % rowPerPage == 0) {
			lastPage = count / rowPerPage;
		} else if(count % rowPerPage != 0) {
			lastPage = (count / rowPerPage) + 1;
		}
		
		model.addAttribute("list", list);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("lastPage", lastPage);
		
		return "teacher/teacherList";
	}
}
