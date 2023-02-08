package goodee.gdj58.online.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import goodee.gdj58.online.vo.Example;
import goodee.gdj58.online.vo.Question;
import goodee.gdj58.online.vo.Teacher;
import goodee.gdj58.online.vo.Test;

@Mapper
public interface TeacherMapper {
	
	// 시험문제 보기 출력
	List<Map<String, Object>> selectExampleByTeacher(int testNo);

	// 시험문제 출력
	List<Map<String, Object>> selectQuestionByTeacher(int testNo);
	
	// 시험문제 등록
	int insertQuestion(Question question);
	
	// 보기 등록
	int insertExample(Example example);
	
	// 시험회차 삭제
	int deleteTest(int testNo);
	
	// 시험회차 수정을 위한 조회
	HashMap<String, Object> selectTestByUpdate(int testNo);
	
	// 시험회차 수정
	int updateTest(Test test);
	
	// 시험회차 등록
	int insertTest(Test test);
	
	// 시험회차 목록수
	int selectTestCountByTeacher(String searchWord);
	
	// 시험회차 목록(여러개의 vo를 받기위해 Map사용)
	List<Map<String, Object>> selectTestListByTeacher(Map<String, Object> paramMap);
	
	// 비밀번호 수정
	int updateTeacherPw(Map<String, Object> paramMap);
	
	// 선생님 로그인
	Teacher loginTeacher(Teacher teacher);
	
	// 선생님 삭제
	int deleteTeacher(int teacherNo);
	
	// 선생님 등록
	int insertTeacher(Teacher teacher);

	// 선생님 목록수
	int selectTeacherCount();
	
	// 선생님 목록
	List<Teacher> selectTeacherList(Map<String, Object> paramMap);
}
