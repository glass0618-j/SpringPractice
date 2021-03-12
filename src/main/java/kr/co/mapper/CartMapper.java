package kr.co.mapper;

import java.util.List;

import kr.co.domain.CartVO;

public interface CartMapper {
	
	public void insert(CartVO cart);
	
	public String select(CartVO cart);
	
//	public List<CartVO> listCart(int user_number);
	
//	public int countCart(int user_number, int book_id);
	
}
