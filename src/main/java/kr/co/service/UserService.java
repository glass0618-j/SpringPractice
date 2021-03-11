package kr.co.service;

import java.util.List;

import kr.co.domain.UserVO;

public interface UserService {
	
	public List<UserVO> getList();
	
	public void join(UserVO user);
	
	public boolean idcheck(String user_id);
	
//	public void joinSelectKey(UserVO user);
	
	public UserVO login(UserVO User);
//	
//	public int update(UserVO user);
//	
//	public int delete(int user_number);
}
