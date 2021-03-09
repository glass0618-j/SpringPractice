package kr.co.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.co.domain.UserVO;
import kr.co.mapper.NoticeMapper;
import kr.co.mapper.UserMapper;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class UserServiceImp implements UserService{
	
	private final UserMapper userMapper;

	@Override
	public List<UserVO> getList() {
		return userMapper.getList();
	}

	@Override
	public void join(UserVO user) {
		userMapper.insert(user);
	}

	@Override
	public boolean idcheck(String user_id) {
		return userMapper.idcheck(user_id) == 0;
	}

}
