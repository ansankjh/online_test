package goodee.gdj58.online.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MainMapper {

	// 시험목록
	List<Map<String, Object>> selectTestList();
	
	// main 페이지 강사, 학생, 시험 개수 출력
	int selectTeacherCount();
	int selectStudentCount();
	int selectTestCount();
}
