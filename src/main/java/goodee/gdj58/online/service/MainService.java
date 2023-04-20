package goodee.gdj58.online.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.gdj58.online.mapper.MainMapper;

@Transactional
@Service
public class MainService {
	@Autowired
	private MainMapper mainMapper;
	
	// 문제 목록
	public List<Map<String, Object>> getTestList() {
		return mainMapper.selectTestList();
	}
	
	// 강사 인원수
	public int getTeacherCount() {
		return mainMapper.selectTeacherCount();
	}
	
	// 학생 인원수
	public int getStudentCount() {
		return mainMapper.selectStudentCount();
	}
	
	// 등록된 시험 개수
	public int getTestCount() {
		return mainMapper.selectTestCount();
	}
}
