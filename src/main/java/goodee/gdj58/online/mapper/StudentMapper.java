package goodee.gdj58.online.mapper;



import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import goodee.gdj58.online.vo.Employee;
import goodee.gdj58.online.vo.Example;
import goodee.gdj58.online.vo.Paper;
import goodee.gdj58.online.vo.Question;
import goodee.gdj58.online.vo.Student;
import goodee.gdj58.online.vo.Test;

@Mapper
public interface StudentMapper {
	
	// 성적 확인페이지 정답 출력
	List<Example> selectExampleAnswerByMyScore(Map<String, Object> paramMap);
	
	// 성적 확인페이지 내가 고른 답 출력
	List<Paper> selectMyAnswerByMyScore(Paper paper);
	
	// 성적확인페이지 보기 출력
	List<Example> selectExampleByMyScore(Paper paper);
	
	// 성적확인페이지 문제 출력
	List<Question> selectQuestionByMyScore(Paper paper);
	
	// 정답 개수
	int selectAnswerCount(Map<String, Object> paramMap);
	
	// 답안지 제목 뽑기
	Test selectTestByPaper(int testNo);
	
	// 시험종료를 위한 답의 개수
	int selectAnswerCnt(int testNo);
	
	// 고른답 나오게하기
	List<Paper> selectPaperByScore(int studentNo);
	
	// 답선택or답수정 조회
	Paper selectPaperOne(int questionNo);
	
	// 답안지 수정
	int updatePaper(Paper paper);
	
	// 답안지
	int insertPaper(Paper paper);
	
	// 시험지
	List<Map<String, Object>> selectPaper(int testNo);
	
	// 회차목록
	List<Test> selectTest();
	
	// 학생 기존 비밀번호 확인(비밀번호변경)
	Student selectStudent(Map<String, Object> paramMap);
	
	// 학생 비밀번호 수정
	int updateStudentPw(Map<String, Object> paramMap);
	
	// 학생 로그인
	Student loginStudent(Student student);
	
	// 학생 삭제
	int deleteStudent(int studentNo);
	
	// 학생 등록
	int insertStudent(Student student);
	
	// 학생 아이디 중복 체크
	public String selectStudentId(String studentId);
	
	// 학생목록수 studentList.jsp
	int selectStudentCount();
	
	// 학생목록 studentList.jsp
	List<Student> selectStudentList(Map<String, Object> paramMap);
}
