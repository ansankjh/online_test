package goodee.gdj58.online.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.gdj58.online.mapper.StudentMapper;
import goodee.gdj58.online.vo.Example;
import goodee.gdj58.online.vo.Paper;
import goodee.gdj58.online.vo.Student;
import goodee.gdj58.online.vo.Test;

@Service
@Transactional
public class StudentService {
	@Autowired private StudentMapper studentMapper;
	
	// 성적확인페이지 내가 고른답 정답 비교하기
	
	// 고른답 출력하기
	public List<Paper> getMyScore(int studentNo) {
		return studentMapper.selectMyScore(studentNo);
	}
	
	// 성적확인페이지 시험지 출력
	public List<Map<String, Object>> getPaperByMyScore(int testNo) {
		return studentMapper.selectPaperByMyScore(testNo);
	}
	
	// 정답 개수
	public int getAnswerCount(int testNo, int studentNo, String exampleOx) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("testNo", testNo);
		paramMap.put("studentNo", studentNo);
		paramMap.put("exampleOx", exampleOx);
		return studentMapper.selectAnswerCount(paramMap);
	}
	
	
	// 답안지 시험제목 출력
	public Test getTestByPaper(int testNo) {
		return studentMapper.selectTestByPaper(testNo);
	}
	
	// 시험종료를 위한 답의 개수
	public int getAnswerCnt(int testNo) {
		return studentMapper.selectAnswerCnt(testNo);
	}
	
	// 고른답 출력하기
	public List<Paper> getPaperByScore(int studentNo) {
		return studentMapper.selectPaperByScore(studentNo);
	}
	
	// 답선택or답수정을 위한 조회
	public Paper getPaperOne(int questionNo) {
		return studentMapper.selectPaperOne(questionNo);
	}
	
	// 답안지 수정
	public int modifyPaper(Paper paper) {
		return studentMapper.updatePaper(paper);
	}
	
	// 답안지
	public int addPaper(Paper paper) {
		return studentMapper.insertPaper(paper);
	}
	
	// 시험지
	public List<Map<String, Object>> getPaper(int testNo) {
		return studentMapper.selectPaper(testNo);
	}
	
	// 시험목록
	public List<Test> getTestList() {
		return studentMapper.selectTest();
	}
	
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
