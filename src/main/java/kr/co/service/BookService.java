package kr.co.service;

import java.util.List;

import kr.co.domain.BookVO;

public interface BookService {
	
	public List<BookVO> getList();
	
	public void register(BookVO book);
	
//	public Long registerSelectKey(BookVO book);
	
	public BookVO get(int book_id);
	
	public int modify(BookVO book);
	
	public int remove(int book_id);

}
