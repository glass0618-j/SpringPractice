package kr.co.dbtest;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.co.domain.BookVO;
import kr.co.service.BookService;
import lombok.extern.log4j.Log4j2;

@Log4j2
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class BookServiceTest {
	
	@Autowired
	BookService bs;
	
	@Test
	public void getListTest() {
		log.info("getListTest..............");
		List<BookVO> vo = bs.getList("");
		
		for (BookVO bookVO : vo) {
			log.info(bookVO);
		}
	}
	
	@Test
	public void registerTest() {
		log.info("registerTest..............");
		BookVO vo = new BookVO();
		vo.setBook_title("이렇게 했더니 인스타마켓으로 6억 벌었어요!");
		vo.setBook_writer("황지원");
		vo.setBook_publisher("앤써북");
		vo.setBook_price(13500);
		vo.setBook_kategorie("IT/컴퓨터");
		vo.setBook_intro("인스타그램 계정 키우기부터 판매 및 마케팅까지 산타맘의 실제 경험을 바탕으로 차근차근 단계별 진행 방법과 노하우를 모두 공개했다 모든 과정은 실전에 바로 적용할 수 있게 따라하기 방식으로 설명하였다.");
		vo.setFileName("/resorces/img/인스타마켓");
		
		this.getListTest();
		
	}

}
