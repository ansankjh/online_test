package goodee.gdj58.online.mapper;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface IdMapper {
	// 아이디 중복 방지
	String selectIdCheck(String id);
}
