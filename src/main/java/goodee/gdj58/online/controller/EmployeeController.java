package goodee.gdj58.online.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import goodee.gdj58.online.service.EmployeeService;
import goodee.gdj58.online.service.IdService;
import goodee.gdj58.online.service.StudentService;
import goodee.gdj58.online.service.TeacherService;
import goodee.gdj58.online.vo.Employee;
import goodee.gdj58.online.vo.Student;
import goodee.gdj58.online.vo.Teacher;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class EmployeeController {
	// 필요한 의존 객체의 “타입"에 해당하는 빈을 찾아 주입한다.
	@Autowired StudentService studentService;
	@Autowired TeacherService teacherService;
	@Autowired EmployeeService employeeService;
	@Autowired IdService idService;
	
	/*------ 학생 --------*/
	
	// 학생 삭제 emp
	@GetMapping("/employee/removeStudent")
	public String removeStudent(int studentNo) {
		int row = studentService.removeStudent(studentNo);
		
		return "redirect:/employee/studentList";
	}
	
	// 학생 등록 addStudent.jsp 폼 emp
	@GetMapping("/employee/addStudent")
	public String addStudent() {
		return "employee/addStudent";
	}
	
	// 학생 등록 addStudent.jsp 액션 emp
	@PostMapping("/employee/addStudent")
	public String addStudent(Model model, Student student) {
		// 아이디 중복체크
		String idCheck = idService.getIdCheck(student.getStudentId());
		if(idCheck != null) {
			model.addAttribute("msg", "중복된아이디");
			return "employee/addStudent";
		}
		
		int row = studentService.addStudent(student);
		if(row == 0) {
			model.addAttribute("msg", "시스템 에러로 등록 실패");
			return "employee/addStudent";
		}
		return "redirect:/employee/studentList";
	}
	
	// 학생목록 studentList.jsp employee가 보는 학생 목록 emp
	@GetMapping("/employee/studentList")
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
		
		return "employee/studentList";
	}
	
	/*------ 강사 --------*/
	
	// 선생님 삭제 emp
	@GetMapping("/employee/removeTeacher")
	public String removeTeacher(int teacherNo) {
		int row = teacherService.removeTeacher(teacherNo);
		
		return "redirect:/employee/teacherList";
	}
	
	// 선생님 등록 폼 emp
	@GetMapping("/employee/addTeacher")
	public String addTeacher() {
		return "employee/addTeacher";
	}

	// 선생님 등록 액션 emp
	@PostMapping("/employee/addTeacher")
	public String addTeacher(Model model, Teacher teacher) {
		// 회원가입 아이디 중복방지
		String idCheck = idService.getIdCheck(teacher.getTeacherId());
		if(idCheck != null) {
			model.addAttribute("msg", "아이디 중복");
			return "employee/addTeacher";
		}
		// 회원가입 실패시
		int row = teacherService.addTeacher(teacher);
		if(row == 0) {
			model.addAttribute("msg", "시스템 에러로 등록 실패");
			return "employee/addTeacher";
		}
		return "redirect:/employee/teacherList";
	}
	
	// 선생님 목록 emp
	@GetMapping("/employee/teacherList")
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
		
		return "employee/teacherList";
	}
	
	/*------ 사원 --------*/
	
	// 사원 비밀번호 수정 폼 modifyEmpPw
	@GetMapping("/employee/modifyEmpPw")
	public String modifyEmpPw() {
		return "employee/modifyEmpPw";
	}
	
	// 사원 비밀번호 수정 액션 modifyEmpPw
	@PostMapping("/employee/modifyEmpPw")
	public String modifyEmpPw(HttpSession session
								, @RequestParam(value="oldPw") String oldPw
								, @RequestParam(value="newPw") String newPw) {
		
		Employee loginEmp = (Employee)session.getAttribute("loginEmp");
		
		employeeService.updateEmployeePw(loginEmp.getEmpNo(), oldPw, newPw);
		
		return "redirect:/employee/empList";
	}
	
	// 사원로그인 폼 loginEmp
	@GetMapping("/loginEmp")
	public String loginEmp() {
		return "employee/loginEmp";
	}
	
	// 사원로그인 액션 loginEmp
	@PostMapping("/loginEmp")
	public String loginEmp(HttpSession session, Employee employee) {
		Employee resultEmp = employeeService.login(employee);
		session.setAttribute("loginEmp", resultEmp);
		return "redirect:/main";
	}
	
	// 로그아웃
	@GetMapping("/employee/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/loginEmp";
	}
	
	/*
	 *  로그인 후에 사용가능한 기능
	 */
	
	// 사원삭제 removeEmp
	@GetMapping("/employee/removeEmp")
	public String removeEmp(@RequestParam("empNo") int empNo) {
		int row = employeeService.removeEmployee(empNo);
		return "redirect:/employee/empList";
	}
	
	// 사원등록 폼 addEmp
	@GetMapping("/employee/addEmp")
	public String addEmp() {
		return "employee/addEmp";
	}
	
	// 사원등록 액션 addEmp
	@PostMapping("/employee/addEmp")
	public String addEmp(Model model, Employee employee) {
		String idCheck = idService.getIdCheck(employee.getEmpId());
		if(idCheck != null) {
			model.addAttribute("errorMsg", "중복된ID");
			return "employee/addEmp";
		}
		
		int row = employeeService.addEmployee(employee);
		if(row == 0) {
			model.addAttribute("errorMsg", "시스템에러로 등록실패");
			return "employee/addEmp";
		}
		
		return "redirect:/employee/empList"; // sendRedirect , CM -> C
	}
	
	// empList 사원목록
	@GetMapping("/employee/empList")
	public String empList(Model model
							, @RequestParam(value="currentPage", defaultValue = "1") int currentPage
							, @RequestParam(value="rowPerPage", defaultValue = "10") int rowPerPage
							, @RequestParam(value="searchWord", defaultValue = "") String searchWord
							, HttpSession session) { 
							// request.getParameter("")를 대신하는 코드
							// null로 들어오면 1로 디폴트값 정해주기
		log.debug(searchWord + "<-- searchWord");
		log.debug(currentPage + "<-- currentPage");
		log.debug(rowPerPage + "<-- rowPerPage");
		List<Employee> list = employeeService.getEmployeeList(currentPage, rowPerPage, searchWord);
		int count = employeeService.getEmployeeCount(searchWord);
		int lastPage = count / rowPerPage;
		if(count % rowPerPage != 0) {
			lastPage = lastPage + 1;
		}
		log.debug(lastPage + "<-- lastPage");
		int startPage = (((currentPage - 1) / 10) * 10) + 1;
		int endPage = startPage + 9;
		if(startPage < 1) {
			startPage = 1;
		} 
		if(endPage > lastPage) {
			endPage = lastPage;
		}
		
		// request.setAttribute("list", list); 컨트롤러에서 request 안씀
		model.addAttribute("list", list);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("lastPage", lastPage);
		model.addAttribute("searchWord", searchWord);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		return "employee/empList";
	}
}
