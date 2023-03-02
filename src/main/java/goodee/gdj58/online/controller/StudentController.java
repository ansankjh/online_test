package goodee.gdj58.online.controller;


import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import goodee.gdj58.online.service.IdService;
import goodee.gdj58.online.service.StudentService;
import goodee.gdj58.online.service.TeacherService;
import goodee.gdj58.online.vo.DateData;
import goodee.gdj58.online.vo.Example;
import goodee.gdj58.online.vo.Paper;
import goodee.gdj58.online.vo.Question;
import goodee.gdj58.online.vo.Student;
import goodee.gdj58.online.vo.Test;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class StudentController {
	@Autowired StudentService studentService;
	@Autowired TeacherService teacherService;
	@Autowired IdService idService;
	
	// 점수확인
	@GetMapping("/student/myScore")
	public String myScore(Model model, Paper paper, HttpSession session
							, @RequestParam(value="testNo") int testNo
							, @RequestParam(value="exampleOx", defaultValue = "정답") String exampleOx) {
		
		Student loginStudent = (Student)session.getAttribute("loginStudent");
		int studentNo = loginStudent.getStudentNo();
		// System.out.println(studentNo);
		paper.setStudentNo(studentNo);
		paper.setTestNo(testNo);
		
		// 성적확인페이지 문제 출력
		List<Question> list = studentService.getQuestionByMyScore(paper);
		
		// 성적확인페이지 보기 출력
		List<Example> list2 = studentService.getExampleByMyScore(paper);
		
		// 성적 확인페이지 내가 고른 답 출력
		List<Paper> list3 = studentService.getMyAnswerByMyScore(paper);
		
		// 성적 확인페이지 정답 출력
		List<Example> list4 = studentService.getExampleAnswerByMyScore(exampleOx, testNo, studentNo);
		
		// 정답개수
		int count = studentService.getAnswerCount(testNo, studentNo, exampleOx);
		int score = count * 10;
		
		model.addAttribute("list", list);
		model.addAttribute("list2", list2);
		model.addAttribute("list3", list3);
		model.addAttribute("list4", list4);
		model.addAttribute("s", score);
		return "student/myScore";
	}
	
	// 시험종료
	@PostMapping("/student/score")
	public String score(@RequestParam(value="testNo") int testNo) {
		log.debug(testNo + "<--점수확인페이지 testNo 디버깅");
		return "redirect:/student/myScore?testNo="+testNo;
	}
	
	// 답안지
	@PostMapping("/student/addPaper")
	public String addPaper(Model model, Paper paper
							, @RequestParam(value="testNo") int testNo
							, @RequestParam(value="questionNo") int questionNo) {
		
		log.debug(paper.getStudentNo() + "<-- 답안지 studentNo 디버깅");
		log.debug(paper.getQuestionNo() + "<-- 답안지 questionNo 디버깅");
		log.debug(paper.getAnswer() + "<-- 답안지 answer 디버깅");
		log.debug(testNo + "<-- 답안지 testNo 디버깅");
		log.debug(questionNo + "<-- 답안지 questionNo 디버깅");
		// 답선택or수정
		Paper p = studentService.getPaperOne(questionNo);
		// p가 null이면(아직 답선택x)
		if(p == null) {
			// 답안지 작성 메서드
			studentService.addPaper(paper);
		} else {
			// 답안지 수정 메서드
			studentService.modifyPaper(paper);
		}
		
		return "redirect:/student/paper?testNo="+testNo;
	}
	
	// 시험지
	@GetMapping("/student/paper")
	public String paper(Model model, HttpSession session
							, @RequestParam(value="testNo") int testNo) {
		
		Student loginStudent = (Student)session.getAttribute("loginStudent");
		session.setAttribute("loginStudent", loginStudent);
		int s = loginStudent.getStudentNo();
		// 시험지 출력 메서드
		List<Map<String, Object>> list = studentService.getPaper(testNo);
		// 시험지 회차제목 출력 메서드
		Test t = studentService.getTestByPaper(testNo);
		// 고른답 출력하기
		List<Paper> pList = studentService.getPaperByScore(s);
		// 시험종료를 위한 답의 개수
		int cnt = studentService.getAnswerCnt(testNo);
		// 답안지 넘기기 위한 조회
		
		model.addAttribute("list", list);
		model.addAttribute("testNo", testNo);
		model.addAttribute("t", t);
		model.addAttribute("s", pList);
		model.addAttribute("cnt", cnt);
		
		return "student/paper";
	}
	// 학생 홈
	@GetMapping("/student/home")
	public String home(Model model
							, HttpSession session) {
		
		// 시험목록
		List<Test> list = studentService.getTestList();
		
		
		model.addAttribute("list", list);
		return "student/home";
	}
	
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
	@PostMapping("/loginStudent")
	public String loginStudent(HttpSession session, Student student) {
		Student resultStudent = studentService.loginStudent(student);
		session.setAttribute("loginStudent", resultStudent);
		return "redirect:/student/home";
	}
	
	// 학생 로그아웃
	@GetMapping("/student/studentLogout")
	public String studentLogout(HttpSession session) {
		session.invalidate();
		return "redirect:/login";
	}
}
