package kr.co.mapper;

import java.util.List;

import kr.co.domain.BookVO;

public interface BookMapper {
	
	public List<BookVO> getList();
	
	public void insert(BookVO book);
	
	public void insertSelectKey(BookVO book);
	
	public BookVO read(int book_id);
	
	public int update(BookVO book);
	
	public int delete(int book_id);
	
}
