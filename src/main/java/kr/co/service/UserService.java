package kr.co.service;

import java.util.List;

import kr.co.domain.UserVO;

public interface UserService {
	
	public List<UserVO> getList();
	
	public void join(UserVO user);
	
	public boolean idcheck(String user_id);
	
//	public void insertSelectKey(BookVO book);
	
//	public BookVO read(int user_number);
//	
//	public int update(UserVO user);
//	
//	public int delete(int user_number);
}
