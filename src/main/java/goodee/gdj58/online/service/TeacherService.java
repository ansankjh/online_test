package goodee.gdj58.online.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.gdj58.online.mapper.TeacherMapper;
import goodee.gdj58.online.vo.Employee;
import goodee.gdj58.online.vo.Example;
import goodee.gdj58.online.vo.Question;
import goodee.gdj58.online.vo.Teacher;
import goodee.gdj58.online.vo.Test;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class TeacherService {
	@Autowired private TeacherMapper teacherMapper;
	
	// 보기수정폼
	public Example selectExampleByModify(int exampleNo) {
		return teacherMapper.selectExampleByModify(exampleNo);
	}
	
	// 문제수정
	public int modifyQuestion(Question question) {
		return teacherMapper.updateQuestion(question);
	}
	
	// 보기삭제
	public int removeExample(int exampleNo) {
		return teacherMapper.deleteExample(exampleNo);
	}
	
	// 보기수정
	public int modifyExample(Example example) {
		return teacherMapper.updateExample(example);
	}
	
	// 보기등록
	public int addExample(Example example) {
		return teacherMapper.insertExample(example);
	}
	
	// 보기목록
	public List<Map<String, Object>> getExampleList(int questionNo) {
		return teacherMapper.selectExampleList(questionNo);
	}
	
	// 보기페이지에 questionTitle
	public Question getQuestion(int questionNo) {
		return teacherMapper.selectQuestion(questionNo);
	}
	
	// 문제삭제
	public int removeQuestion(int questionNo) {
		return teacherMapper.deleteQuestion(questionNo);
	}
	
	// test
	public Test getTest(int testNo) {
		return teacherMapper.selectTest(testNo);
	}
	
	// 문제등록
	public int addQuestion(Question question) {
		return teacherMapper.insertQuestion(question);
	}
	
	// 시험회차목록
	public List<Question> getQuestionList(int testNo) {
		return teacherMapper.selectQuestionList(testNo);
	}
	
	// 시험회차 수정
	public int modifyTest(Test test) {
		return teacherMapper.updateTest(test);
	}
	
	// 시험회차 삭제
	public int removeTest(int testNo) {
		return teacherMapper.deleteTest(testNo);
	}
	
	// 시험회차 삭제시 문제 유무 확인
	public List<Question> getQuestionIdx(int testNo) {
		return teacherMapper.selectQuestionIdx(testNo);
	}
	
	// 시험회차 등록
	public int addTest(Test test) {
		return teacherMapper.insertTest(test);
	}
	
	// 시험회차 목록수
	public int getTestCountByTeacher(String searchWord) {
		return teacherMapper.selectTestCountByTeacher(searchWord);
	}
	
	// 시험회차 목록
	public List<Map<String, Object>> getTestListByTeacher(int currentPage, int rowPerPage, String searchWord) {
		int beginRow = (currentPage - 1) * rowPerPage;
		Map<String, Object>paramMap = new HashMap<String, Object>();
		paramMap.put("beginRow", beginRow);
		paramMap.put("rowPerPage", rowPerPage);
		paramMap.put("searchWord", searchWord);
		return teacherMapper.selectTestListByTeacher(paramMap);
	}
	/*--------------------------------선생님-------------------------------------------*/
	
	// 기존비밀번호 확인(강사 비밀번호 변경시)
	public Teacher getTeacher(String teacherId, String oldPw) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("teacherId", teacherId);
		paramMap.put("oldPw", oldPw);
		return teacherMapper.selectTeacher(paramMap);
	}
	
	// 비밀번호 수정 
	public int updateTeacherPw(String teacherId, String oldPw, String newPw) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("teacherId", teacherId);
		paramMap.put("oldPw", oldPw);
		paramMap.put("newPw", newPw);
		return teacherMapper.updateTeacherPw(paramMap);
	}
	
	// 선생님 로그인
	public Teacher loginTeacher(Teacher teacher) {
		return teacherMapper.loginTeacher(teacher);
	}

	// 선생님 삭제
	public int removeTeacher(int teacherNo) {
		return teacherMapper.deleteTeacher(teacherNo);
	}
	
	// 선생님 등록
	public int addTeacher(Teacher teacher) {
		return teacherMapper.insertTeacher(teacher);
	}
	
	// 선생님 아이디 중복체크
	public String getTeacherId(String teacherId) {
		// 아이디가 중복이면 NO
		String resultStr = "NO";
		// 아이디 사용가능하면 YES
		if(teacherMapper.selectTeacherId(teacherId) == null) {
			resultStr = "YES";
		}
		return resultStr;
	}
	
	// 선생님 목록수
	public int getTeacherCount() {
		return teacherMapper.selectTeacherCount();
	}
	
	// 선생님 목록
	public List<Teacher> getTeacherList(int currentPage, int rowPerPage) {	
		int beginRow = (currentPage - 1) * rowPerPage;
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("beginRow", beginRow);
		paramMap.put("rowPerPage", rowPerPage);
		return teacherMapper.selectTeacherList(paramMap);
	}
}
