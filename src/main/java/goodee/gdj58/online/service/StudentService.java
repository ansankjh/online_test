package goodee.gdj58.online.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.gdj58.online.mapper.StudentMapper;
import goodee.gdj58.online.vo.Student;

@Service
@Transactional
public class StudentService {
	@Autowired private StudentMapper studentMapper;
	
	// 학생 비밀번호 수정 폼
	public int updateStudentPw(int studentNo, String oldPw, String newPw) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("studentNo", studentNo);
		paramMap.put("oldPw", oldPw);
		paramMap.put("newPw", newPw);
		return studentMapper.updateStudentPw(paramMap);
	}
	
	// 학생 로그인
	public Student loginStudent(Student student) {
		return studentMapper.loginStudent(student);
	}
	
	// 학생삭제
	public int removeStudent(int studentNo) {
		return studentMapper.deleteStudent(studentNo);
	}
	
	// 학생등록 addStudent.jsp
	public int addStudent(Student student) {
		return studentMapper.insertStudent(student);
	}
	
	// 학생 아이디 중복 체크
	public String getStudentId(String studentId) {
		// 사용불가(null이 아님)면 NO
		String resultStr = "NO";
		// 사용가능(null)하면 YES를 반환
		if(studentMapper.selectStudentId(studentId) == null) {
			resultStr = "YES";
		}
		return resultStr;
	}
	
	// 학생 리스트 목록수 studentList.jsp
	public int getStudentCount() {
		return studentMapper.selectStudentCount();
	}
	
	// 학생 리스트 studentList.jsp
	public List<Student> getStudentList(int currentPage, int rowPerPage) {
		int beginRow = (currentPage - 1) * rowPerPage;
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("beginRow", beginRow);
		paramMap.put("rowPerPage", rowPerPage);
		return studentMapper.selectStudentList(paramMap);
	}
}
