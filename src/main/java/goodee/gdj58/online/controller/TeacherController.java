package goodee.gdj58.online.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import goodee.gdj58.online.service.IdService;
import goodee.gdj58.online.service.TeacherService;
import goodee.gdj58.online.vo.Example;
import goodee.gdj58.online.vo.Question;
import goodee.gdj58.online.vo.Teacher;
import goodee.gdj58.online.vo.Test;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class TeacherController {
	@Autowired TeacherService teacherService;
	@Autowired IdService idService;
	
	// 시험문제 수정 폼
	@GetMapping("/teacher/modifyQuestion")
	public String modifyQuestion(Model model, Question question
									, @RequestParam(value="questionNo") int questionNo) {
		log.debug(questionNo + "<-- 문제수정페이지에서 문제 번호 디버깅");
		
		Question q = teacherService.getQuestionByModify(questionNo);
		List<Example> e = teacherService.getExampleByModify(questionNo);
		
		log.debug(q + "<-- 문제번호와 문제내용 출력 디버깅");
		
		model.addAttribute("q", q);
		model.addAttribute("e", e);
		return "teacher/modifyQuestion";
	}
	
	// 시험문제 출력
	@GetMapping("/teacher/questionByTeacher")
	public String questionByTeacher(Model model
									, @RequestParam(value="testNo") int testNo) {
		
		log.debug(testNo + "<--testNo 디버깅");
		
		// 문제 출력 메서드
		List<Map<String, Object>> list = teacherService.getQuestionByTeacher(testNo);
		List<Map<String, Object>> eList = teacherService.getExampleByTeacher(testNo);
		// 문제 개수 출력
		int questionCnt = teacherService.getQuestionCount(testNo);
		model.addAttribute("list", list);
		model.addAttribute("eList", eList);
		model.addAttribute("questionCnt", questionCnt);
		model.addAttribute("testNo", testNo);
		
		return "teacher/questionByTeacher";
	}
	
	// 시험문제 등록 폼
	@GetMapping("/teacher/addQuestion")
	public String addQuestion(Model model, @RequestParam(value="testNo") int testNo) {
		log.debug(testNo + "<-- 문제추가페이지에서 testNo 디버깅");
		model.addAttribute("testNo", testNo);
		return "teacher/addQuestion";
	}
	// 시험문제 등록 액션
	@PostMapping("/teacher/addQuestion")
	public String addQuestion(Model model, Question question, Example example
								, @RequestParam(value="testNo") int testNo) {
		// 보기값 여러개
		List<Example> exampleList = example.getExampleList();
		
		int row = teacherService.addQuestion(question, exampleList);
		// row 출력
		log.debug(row + "<-- 문제 추가 성공시 row가 몇이 나오는지 확인");
		// 5가 아니면 실패 원래 값들 다시 입력되게금
		if(row != 5) {
			model.addAttribute("msg", "문제 등록에 실패했습니다.");
			model.addAttribute("q", question);
			return "teacher/addQuestion";
		}
		
		return "redirect:/teacher/questionByTeacher?testNo="+testNo;
	}
	
	// 시험회차 삭제
	@GetMapping("/teacher/removeTest")
	public String removeTest(@RequestParam(value="testNo") int testNo) {
		// testNo 디버깅
		log.debug(testNo + "<-- 삭제에 필요한 testNo");
		
		int row = teacherService.removeTest(testNo);
		
		return "redirect:/teacher/testListByTeacher";
	}
	
	// 시험회차 수정 폼
	@GetMapping("/teacher/modifyTest")
	public String modifyTest(Model model
								, @RequestParam(value="testNo") int testNo) {
		
		// testNo 디버깅
		log.debug(testNo + "<--testNo");
		
		HashMap<String, Object> test = teacherService.getTestByUpdate(testNo);
		
		model.addAttribute("test", test);
		
		return "teacher/modifyTest";
	}
	
	// 시험회차 수정 액션
	@PostMapping("/teacher/modifyTest")
	public String modifyTest(Test test) {
		// 수정 메서드 호출
		int row = teacherService.modifyTest(test);
		return "redirect:/teacher/testListByTeacher";
	}
	
	// 시험회차 등록
	@GetMapping("/teacher/addTest")
	public String addTest(HttpSession session) {
		if(session.getAttribute("loginTeacher") != null) {
			Teacher loginTeacher = (Teacher)session.getAttribute("loginTeacher");
			session.setAttribute("loginTeacher", loginTeacher);
		}
		return "teacher/addTest";
	}
	
	@PostMapping("/teacher/addTest")
	public String addTest(Test test, HttpSession session) {
		// 회차등록 메서드 호출
		int row = teacherService.addTest(test);
		return "redirect:/teacher/testListByTeacher";
	}
	
	// 시험회차 목록
	@GetMapping("/teacher/testListByTeacher")
	public String testListByTeacher(Model model
									, @RequestParam(value="currentPage", defaultValue = "1") int currentPage
									, @RequestParam(value="rowPerPage", defaultValue = "10") int rowPerPage
									, @RequestParam(value="searchWord", defaultValue = "") String searchWord) {
		
		// 메서드 호출
		List<Map<String, Object>> list = teacherService.getTestListByTeacher(currentPage, rowPerPage, searchWord);
		int count = teacherService.getTestCountByTeacher(searchWord);
		int lastPage = count / rowPerPage;
		// 총목록이 페이지당 표시할 목록수로 나누어떨어지지 않을때
		if(count % rowPerPage != 0) {
			lastPage = lastPage + 1;
		}
		model.addAttribute("list", list);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("rowPerPage", rowPerPage);
		model.addAttribute("searchWord", searchWord);
		model.addAttribute("lastPage", lastPage);
		
		return "teacher/testListByTeacher";
	}
	
	/*--------------------------------------------선생님-----------------------------------------*/
	
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
		return "redirect:/teacher/testListByTeacher";
	}
	
	// 선생님 로그아웃
	@GetMapping("/teacher/teacherLogout")
	public String teacherLogout(HttpSession session) {
		session.invalidate();
		return "redirect:/loginTeacher";
	}
}
