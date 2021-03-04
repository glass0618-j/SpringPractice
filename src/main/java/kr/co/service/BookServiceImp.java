package kr.co.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.co.domain.BookVO;
import kr.co.mapper.BookMapper;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class BookServiceImp implements BookService {
	
	private final BookMapper bookMapper;

	@Override
	public List<BookVO> getList() {
		return bookMapper.getList();
	}

	@Override
	public void register(BookVO book) {
		bookMapper.insert(book);
	}


	@Override
	public BookVO get(int book_id) {
		return null;
	}

	@Override
	public int modify(BookVO book) {
		return 0;
	}

	@Override
	public int remove(int book_id) {
		return 0;
	}

}
