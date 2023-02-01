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
import goodee.gdj58.online.vo.Employee;

@Controller
public class EmployeeController {
	// 필요한 의존 객체의 “타입"에 해당하는 빈을 찾아 주입한다.
	@Autowired EmployeeService employeeService;
	@Autowired IdService idService;
	
	// 사원 비밀번호 수정 폼 modifyEmpPw
	@GetMapping("/employee/modifyEmpPw")
	public String modifyEmpPw(HttpSession session) {
		// 비로그인시 로그인폼으로
		Employee loginEmp = (Employee)session.getAttribute("loginEmp");
		if(loginEmp == null) {
			return "redirect:/employee/loginEmp";
		}
		return "employee/modifyEmpPw";
	}
	
	// 사원 비밀번호 수정 액션 modifyEmpPw
	@PostMapping("/employee/modifyEmpPw")
	public String modifyEmpPw(HttpSession session
								, @RequestParam(value="oldPw") String oldPw
								, @RequestParam(value="newPw") String newPw) {
		// 비로그인시 로그인폼으로
		Employee loginEmp = (Employee)session.getAttribute("loginEmp");
		if(loginEmp == null) {
			return "redirect:/employee/loginEmp";
		}
		
		employeeService.updateEmployeePw(loginEmp.getEmpNo(), oldPw, newPw);
		
		return "redirect:/employee/empList";
	}
	
	// 사원로그인 폼 loginEmp
	@GetMapping("/employee/loginEmp")
	public String loginEmp(HttpSession session) {
		// 이미 로그인 중이라면 redirect:/employee/empList
		Employee loginEmp = (Employee)session.getAttribute("loginEmp");
		if(loginEmp != null) {
			return "redirect:/employee/empList";
		}
		return "employee/loginEmp";
	}
	
	// 사원로그인 액션 loginEmp
	@PostMapping("/employee/loginEmp")
	public String loginEmp(HttpSession session, Employee employee) {
		Employee resultEmp = employeeService.login(employee);
		if(resultEmp == null) { // 로그인 실패
			return "redirect:/employee/loginEmp"; 
		}
		session.setAttribute("loginEmp", resultEmp);
		return "redirect:/employee/empList";
	}
	
	@GetMapping("/employee/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/employee/loginEmp";
	}
	
	/*
	 *  로그인 후에 사용가능한 기능
	 */
	
	// 사원삭제 removeEmp
	@GetMapping("/employee/removeEmp")
	public String removeEmp(HttpSession session, @RequestParam("empNo") int empNo) {
		// 이미 로그인 중이라면 redirect:/employee/empList
		Employee loginEmp = (Employee)session.getAttribute("loginEmp");
		if(loginEmp == null) { // 로그인 실패
			return "redirect:/employee/loginEmp"; 
		}
		int row = employeeService.removeEmployee(empNo);
		return "redirect:/employee/empList";
	}
	
	// 사원등록 폼 addEmp
	@GetMapping("/employee/addEmp")
	public String addEmp(HttpSession session) {
		// 이미 로그인 중이라면 redirect:/employee/empList
		Employee loginEmp = (Employee)session.getAttribute("loginEmp");
		if(loginEmp == null) { // 로그인 실패
			return "redirect:/employee/loginEmp"; 
		}
		return "employee/addEmp";
	}
	
	// 사원등록 액션 addEmp
	@PostMapping("/employee/addEmp")
	public String addEmp(HttpSession session, Model model, Employee employee) {
		Employee loginEmp = (Employee)session.getAttribute("loginEmp");
		if(loginEmp == null) {
			return "redirect:/employee/loginEmp";
		}
		
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
							, HttpSession session) { 
							// request.getParameter("")를 대신하는 코드
							// null로 들어오면 1로 디폴트값 정해주기
		// 이미 로그인 중이라면 redirect:/employee/empList
		Employee loginEmp = (Employee)session.getAttribute("loginEmp");
		List<Employee> list = employeeService.getEmployeeList(currentPage, rowPerPage);
		int count = employeeService.getEmployeeCount();
		int lastPage = 0;
		if(count % rowPerPage == 0) {
			lastPage = count / rowPerPage;
		} else if(count % rowPerPage != 0) {
			lastPage = count / rowPerPage;
		}
		// request.setAttribute("list", list); 컨트롤러에서 request 안씀
		model.addAttribute("list", list);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("lastPage", lastPage);
		return "employee/empList";
	}
}
