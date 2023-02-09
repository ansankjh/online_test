package goodee.gdj58.online.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.gdj58.online.mapper.TeacherMapper;
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
	
	//시험 문제 수정

	// 시험문제 수정 폼- 보기
	public List<Example> getExampleByModify(int questionNo) {
		return teacherMapper.selectExampleByModify(questionNo);
	}
	
	// 시험문제 수정 폼 - 문제
	public Question getQuestionByModify(int questionNo) {
		return teacherMapper.selectQuestionByModify(questionNo);
	}
	
	// 시험문제 보기 출력
	public List<Map<String, Object>> getExampleByTeacher(int testNo) {
		return teacherMapper.selectExampleByTeacher(testNo);
	}
	
	// 시험문제 출력
	public List<Map<String, Object>> getQuestionByTeacher(int testNo) {
		return teacherMapper.selectQuestionByTeacher(testNo);
	}
	
	// 시험문제 등록
	public int addQuestion(Question question, List<Example> exampleList) {
		log.debug(exampleList + "<-- 서비스단에서 보기리스트 디버깅");
		
		// 문제 추가
		int row = teacherMapper.insertQuestion(question);
		// Mapper에서 문제 추가되면 question 기본키 가져오기
		int questionNo = question.getQuestionNo();
		
		for(Example e : exampleList) {
			e.setQuestionNo(questionNo);
			row = row + teacherMapper.insertExample(e);
		}
		
		return row;
	}
	// 문제 개수 출력
	public int getQuestionCount(int testNo) {
		return teacherMapper.selectQuestionCount(testNo);
	}
	
	// 보기 개수 출력
	public int getExampleCount(int questionNo) {
		return teacherMapper.selectExampleCount(questionNo);
	}
	
	// 시험회차 삭제
	public int removeTest(int testNo) {
		return teacherMapper.deleteTest(testNo);
	}
	
	// 시험회차 수정을 위한 조회
	public HashMap<String, Object> getTestByUpdate(int testNo) {
		return teacherMapper.selectTestByUpdate(testNo);
	}
	
	// 시험회차 수정
	public int modifyTest(Test test) {
		return teacherMapper.updateTest(test);
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
	
	// 비밀번호 수정 
	public int updateTeacherPw(int teacherNo, String oldPw, String newPw) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("teacherNo", teacherNo);
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
