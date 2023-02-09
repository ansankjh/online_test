package goodee.gdj58.online.service;

import java.util.HashMap;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.gdj58.online.mapper.EmployeeMapper;
import goodee.gdj58.online.vo.Employee;

@Service
@Transactional // 메서드단에서 예외발생하면 디비까지 가지않고 취소 시켜버리는 어노테이션
public class EmployeeService {
	// DI = new EmployeeMapper()
	@Autowired // 필요한 의존 객체의 “타입"에 해당하는 빈을 찾아 주입한다.
	private EmployeeMapper employeeMapper;
	
	// 사원 비밀번호 수정
	public int updateEmployeePw(int empNo, String oldPw, String newPw) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("empNo", empNo);
		paramMap.put("oldPw", oldPw);
		paramMap.put("newPw", newPw);
		return employeeMapper.updateEmployeePw(paramMap);
	}
	
	// 로그인
	public Employee login(Employee employee) {
		return employeeMapper.login(employee);
	}
	// 사원삭제
	public int removeEmployee(int empNo) {
		return employeeMapper.deleteEmployee(empNo);
	}
	// 사원등록
	public int addEmployee(Employee employee) {
		return employeeMapper.insertEmployee(employee);
	}
	
	// 사원아이디 중복체크
	public String getEmployeeId(String empId) {
		// 사용가능한 ID면 "YES" 아니면 "NO"반환
		String resultStr = "NO";
		if(employeeMapper.selectEmployeeId(empId) == null) {
			resultStr = "YES";
		}
		return resultStr;
	}
	// 사원목록수
	public int getEmployeeCount(String searchWord) {
		return employeeMapper.selectEmployeeCount(searchWord);
	}
	// 사원리스트
	public List<Employee> getEmployeeList(int currentPage, int rowPerPage, String searchWord) {
		int beginRow = (currentPage - 1) * rowPerPage;
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("beginRow", beginRow);
		paramMap.put("rowPerPage", rowPerPage);
		paramMap.put("searchWord", searchWord);
		return employeeMapper.selectEmployeeList(paramMap);
	}
	
}
