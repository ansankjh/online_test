package goodee.gdj58.online.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.gdj58.online.mapper.IdMapper;

@Service
@Transactional
public class IdService {
	@Autowired private IdMapper idMapper;
	
	// null이면 중복x, null이 아니면 중복o
	public String getIdCheck(String id) {
		return idMapper.selectIdCheck(id);
	}
}
