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
import goodee.gdj58.online.vo.DateData;
import goodee.gdj58.online.vo.Student;
import goodee.gdj58.online.vo.Test;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class StudentController {
	@Autowired StudentService studentService;
	@Autowired IdService idService;
	
	// 시험지
	@GetMapping("/student/paper")
	public String paper(Model model
							, @RequestParam(value="testNo") int testNo
							, @RequestParam(value="testTitle") String testTitle) {
		
		List<Map<String, Object>> list = studentService.getPaper(testNo);
		
		model.addAttribute("list", list);
		model.addAttribute("testTitle", testTitle);
		
		return "student/paper";
	}
	// 학생 홈
	@GetMapping("/student/home")
	public String home(Model model
							, HttpServletRequest request
							, DateData dateData, HttpSession session) {
		
		// 시험목록
		List<Test> list = studentService.getTestList();
		
		Calendar cal = Calendar.getInstance();
		DateData calendarData;
			//검색 날짜
		if(dateData.getDate().equals("") && dateData.getMonth().equals("")) {
			dateData = new DateData(String.valueOf(cal.get(Calendar.YEAR))
									,String.valueOf(cal.get(Calendar.MONTH))
									,String.valueOf(cal.get(Calendar.DATE)),null);
		}
		//검색 날짜 end

		Map<String, Integer> today_info =  dateData.today_info(dateData);
		List<DateData> dateList = new ArrayList<DateData>();
			
		//실질적인 달력 데이터 리스트에 데이터 삽입 시작.
		//일단 시작 인덱스까지 아무것도 없는 데이터 삽입
		for(int i = 1; i < today_info.get("start"); i++) {
			calendarData= new DateData(null, null, null, null);
			dateList.add(calendarData);
		}
			
		//날짜 삽입
		for (int i = today_info.get("startDay"); i <= today_info.get("endDay"); i++) {
			
			if(i == today_info.get("today")){
				calendarData = new DateData(String.valueOf(dateData.getYear())
											, String.valueOf(dateData.getMonth()+1)
											, String.valueOf(i)
											, "today");
			} else {
				calendarData= new DateData(String.valueOf(dateData.getYear())
											, String.valueOf(dateData.getMonth()+1)
											, String.valueOf(i)
											, "normal_date");
			}
			dateList.add(calendarData);
		}

			//달력 빈곳 빈 데이터로 삽입
		int index = 7-dateList.size() % 7;
			
		if(dateList.size() % 7 != 0) {
				
		for (int i = 0; i < index; i++) {
				calendarData = new DateData(null, null, null, null);
				dateList.add(calendarData);
			}
		}
		System.out.println(dateList);
		int todayYear = cal.get(Calendar.YEAR);
		int todayMonth = cal.get(Calendar.MONTH) + 1;
		int todayDate = cal.get(Calendar.DATE);
		String testDay = todayYear + "-" + todayMonth + "-" + todayDate;
		if(todayMonth < 10) {
			testDay = todayYear + "-" + "0" + todayMonth + "-" + todayDate;
			todayMonth = Integer.parseInt(testDay.substring(8));
		}
		
		model.addAttribute("list", list);
		//배열에 담음
		model.addAttribute("dateList", dateList);	//날짜 데이터 배열
		model.addAttribute("today_info", today_info);
		model.addAttribute("testDay", testDay);
		model.addAttribute("todayMonth", todayMonth);
		
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
