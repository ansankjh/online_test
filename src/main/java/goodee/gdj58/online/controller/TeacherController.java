package goodee.gdj58.online.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import goodee.gdj58.online.service.IdService;
import goodee.gdj58.online.service.TeacherService;
import goodee.gdj58.online.vo.Teacher;

@Controller
public class TeacherController {
	@Autowired TeacherService teacherService;
	@Autowired IdService idService;
	
	// 비밀번호 수정 폼
	@GetMapping("/teacher/modifyTeacherPw")
	public String updateTeacherPw() {
		return "teacher/modifyTeacherPw";
	}
	
	// 비밀번호 수정 액션
	@PostMapping("/teacher/modifyTeacherPw")
	public String updateTeacherPw(HttpSession session
									, @RequestParam(value="oldPw") String oldPw
									, @RequestParam(value="newPw") String newPw) {
		Teacher loginTeacher = (Teacher)session.getAttribute("loginTeacher");
		
		int row = teacherService.updateTeacherPw(loginTeacher.getTeacherNo(), oldPw, newPw);
		
		return "redirect:/teacher/teacherList";
	}
	
	// 선생님 로그인 폼
	@GetMapping("/loginTeacher")
	public String loginTeacher() {
		return "teacher/loginTeacher";
	}
	
	// 선생님 로그인 액션
	@PostMapping("/loginTeacher")
	public String loginTeacher(HttpSession session, Teacher teacher) {
		Teacher resultTeacher = teacherService.loginTeacher(teacher);
		session.setAttribute("loginTeacher", resultTeacher);
		return "redirect:/teacher/teacherList";
	}
	
	// 선생님 로그아웃
	@GetMapping("/teacher/teacherLogout")
	public String teacherLogout(HttpSession session) {
		session.invalidate();
		return "redirect:/loginTeacher";
	}
	
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
	public String addTeacher(Model model, Teacher teacher) {
		// 회원가입 아이디 중복방지
		String idCheck = idService.getIdCheck(teacher.getTeacherId());
		if(idCheck != null) {
			model.addAttribute("msg", "아이디 중복");
			return "teacher/addTeacher";
		}
		// 회원가입 실패시
		int row = teacherService.addTeacher(teacher);
		if(row == 0) {
			model.addAttribute("msg", "시스템 에러로 등록 실패");
			return "teacher/addTeacher";
		}
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
