package goodee.gdj58.online.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import goodee.gdj58.online.vo.Paper;
import goodee.gdj58.online.vo.Student;
import goodee.gdj58.online.vo.Test;

@Mapper
public interface StudentMapper {
	
	// 성적확인
	List<Map<String, Object>> selectScore(Map<String, Object> paramMap);
	
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
