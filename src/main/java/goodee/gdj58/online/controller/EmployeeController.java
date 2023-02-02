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
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class EmployeeController {
	// 필요한 의존 객체의 “타입"에 해당하는 빈을 찾아 주입한다.
	@Autowired EmployeeService employeeService;
	@Autowired IdService idService;
	
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
		return "redirect:/employee/empList";
	}
	
	// 로그아웃
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
							, @RequestParam(value="startPage", defaultValue = "1") int startPage
							, @RequestParam(value="endPage", defaultValue = "10") int endPage
							, HttpSession session) { 
							// request.getParameter("")를 대신하는 코드
							// null로 들어오면 1로 디폴트값 정해주기
		log.debug(searchWord + "<-- searchWord");
		log.debug(currentPage + "<-- currentPage");
		log.debug(rowPerPage + "<-- rowPerPage");
		List<Employee> list = employeeService.getEmployeeList(currentPage, rowPerPage, searchWord);
		int count = employeeService.getEmployeeCount(searchWord);
		int lastPage = 0;
		if(count % rowPerPage == 0) {
			lastPage = count / rowPerPage;
		} else if(count % rowPerPage != 0) {
			lastPage = (count / rowPerPage) + 1;
		}
		log.debug(lastPage + "<-- lastPage");
		
		if(currentPage > lastPage) {
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
