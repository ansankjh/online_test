package goodee.gdj58.online.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import goodee.gdj58.online.vo.Student;

@Mapper
public interface StudentMapper {
	
	// 회차목록
	
	
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
