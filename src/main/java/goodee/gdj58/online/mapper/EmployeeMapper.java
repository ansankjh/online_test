package goodee.gdj58.online.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import goodee.gdj58.online.vo.Employee;

@Mapper // sql을 메소드로 쓰기 위해, sql 결과를 정의해놓은 모델로 매핑하기 위한 이름 그대로의 매퍼이다
public interface EmployeeMapper {
	// 사원 비밀번호 수정 modifyEmpPw
	int updateEmployeePw(Map<String, Object> paramMap);
	
	// 사원 로그인 empLogin
	Employee login(Employee employee);
	
	// 사원삭제
	int deleteEmployee(int empNo);
	
	// 사원등록
	int insertEmployee(Employee employee);
	
	// empList 목록의 수 출력
	int selectEmployeeCount();
	
	// empList 출력
	List<Employee> selectEmployeeList(Map<String, Object> paramMap);
	
}
