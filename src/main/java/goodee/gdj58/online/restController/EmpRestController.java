package goodee.gdj58.online.restController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import goodee.gdj58.online.service.EmployeeService;

@RestController
public class EmpRestController {
	@Autowired EmployeeService employeeService;
	
	@GetMapping("/employeeIdck")
	public String empIdck(@RequestParam(value = "empId") String empId) {
		return employeeService.getEmployeeId(empId);
	}
}
