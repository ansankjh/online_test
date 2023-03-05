package goodee.gdj58.online.controller;

import java.util.Calendar;
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
	
	// 문제수정
	@PostMapping("/teacher/modifyQuestion")
	public String modifyQuestion(Question question
									, @RequestParam(value="questionNo") int questionNo) {
		//System.out.println(questionNo + "<--문제수정 문제번호");
		
		// 문제수정 메서드 호출
		teacherService.modifyQuestion(question);
		
		return "redirect:/teacher/exampleList?questionNo="+questionNo;
	}
	
	// 보기삭제
	@GetMapping("/teacher/removeExample")
	public String removeExample(@RequestParam(value="exampleNo") int exampleNo
									, @RequestParam(value="questionNo") int questionNo) {
		
		/*
		System.out.println(exampleNo + "<--보기삭제 보기번호");
		System.out.println(questionNo + "<--보기삭제 문제번호");
		*/
		
		teacherService.removeExample(exampleNo);
		
		return "redirect:/teacher/exampleList?questionNo="+questionNo;
	}
	
	// 보기수정
	@PostMapping("/teacher/modifyExample")
	public String modifyExample(Example example
									, @RequestParam(value="questionNo") int questionNo
									, @RequestParam(value="exampleNo") int exampleNo) {
		/*
		System.out.println(questionNo + "<-- 보기수정 문제번호");
		System.out.println(exampleNo + "<-- 보기수정 보기번호");
		log.debug(example.getExampleTitle() +  "<-- 보기수정 보기내용");
		log.debug(example.getExampleOx() + "<-- 보기수정 정답체크");
		*/
		
		// 수정 메서드 호출
		teacherService.modifyExample(example);
		
		return "redirect:/teacher/exampleList?questionNo="+questionNo;
	}
	
	// 보기등록
	@PostMapping("/teacher/addExample")
	public String addExample(Example example
								, @RequestParam(value="questionNo") int questionNo) {
		teacherService.addExample(example);
		
		return "redirect:/teacher/exampleList?questionNo="+questionNo;
	}
	
	// 보기목록
	@GetMapping("/teacher/exampleList")
	public String exampleList(Model model
								, @RequestParam(value="questionNo") int questionNo) {
		
		List<Map<String, Object>> list = teacherService.getExampleList(questionNo);
		Question question = teacherService.getQuestion(questionNo);
		
		int idx = 1;
		for(Map<String, Object> e : list) {
			idx = idx + 1;
		}
		
		model.addAttribute("list", list);
		model.addAttribute("q", question);
		model.addAttribute("questionNo", questionNo);
		model.addAttribute("idx", idx);
		
		return "teacher/exampleList";
	}
	
	// 문제삭제
	@GetMapping("/teacher/removeQuestion")
	public String removeQuestion(int questionNo
									, @RequestParam(value="testNo") int testNo) {
		teacherService.removeQuestion(questionNo);
		return "redirect:/teacher/questionList?testNo="+testNo;
	}
	
	// 문제등록
	@PostMapping("/teacher/addQuestion")
	public String addQuestion(Question question
								, @RequestParam(value = "testNo") int testNo) {
		// 문제등록 메서드
		teacherService.addQuestion(question);
	
		return "redirect:/teacher/questionList?testNo="+testNo;
	}
	
	// 문제페이지
	@GetMapping("/teacher/questionList")
	public String selectQuestionList(Model model
										, @RequestParam(value="testNo") int testNo) {
		
		List<Question> list = teacherService.getQuestionList(testNo);
		Test test = teacherService.getTest(testNo);
		int questionIdx = 1;
		for(Question q : list) {
			questionIdx = questionIdx + 1;
		}
		
		model.addAttribute("list", list);
		model.addAttribute("test", test);
		model.addAttribute("testNo", testNo);
		model.addAttribute("questionIdx", questionIdx);
		
		
		return "teacher/questionList";
	}
	
	// 시험회차 수정
	@PostMapping("/teacher/modifyTest")
	public String modifyTest(Test test) {
		// 회차 수정 메서드
		teacherService.modifyTest(test);
		// 성공
		return "redirect:/teacher/testList";
	}
	
	// 시험회차 삭제
	@GetMapping("/teacher/removeTest")
	public String removeTest(Model model, int testNo) {
		// 회차 삭제 메서드
		teacherService.removeTest(testNo);
		
		return "redirect:/teacher/testList";
	}
	
	// 시험회차 등록 액션
	@PostMapping("/teacher/addTest")
	public String addTest(Model model, Test test) {
		// 회차추가 메서드
		int row = teacherService.addTest(test);
		if(row == 0) {
			model.addAttribute("msg", "회차추가 실패");
			return "teacher/testList";
		}
		return "redirect:/teacher/testList";
	}
	
	// 시험회차 목록
	@GetMapping("/teacher/testList")
	public String testListByTeacher(Model model, HttpSession session
									, @RequestParam(value="currentPage", defaultValue = "1") int currentPage
									, @RequestParam(value="rowPerPage", defaultValue = "10") int rowPerPage
									, @RequestParam(value="searchWord", defaultValue = "") String searchWord) {
		
		Teacher loginTeacher = (Teacher)session.getAttribute("loginTeacher");
		session.setAttribute("loginTeacher", loginTeacher);
		
		// 오늘 날짜 출력
		Calendar day = Calendar.getInstance();
		int year = day.get(Calendar.YEAR);
		int month = day.get(Calendar.MONTH)+1;
		int date = day.get(Calendar.DATE);
		String today = year+"-"+month+"-"+date;
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
		model.addAttribute("today", today);
		
		return "teacher/testList";
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
		return "redirect:/teacher/testList";
	}
	
	// 선생님 로그아웃
	@GetMapping("/teacher/teacherLogout")
	public String teacherLogout(HttpSession session) {
		session.invalidate();
		return "redirect:/loginTeacher";
	}
}
