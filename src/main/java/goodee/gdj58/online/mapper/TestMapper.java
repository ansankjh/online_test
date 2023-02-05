package goodee.gdj58.online.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import goodee.gdj58.online.vo.Test;

@Mapper
public interface TestMapper {
	
	// 시험회차 목록 출력
	List<Test> selectTestList(Map<String, Object> paramMap);
	
}
