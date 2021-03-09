package kr.co.dbtest;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.co.domain.BookVO;
import kr.co.mapper.BookMapper;
import lombok.extern.log4j.Log4j2;

@Log4j2
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class BookMapperTest {
	
	@Autowired
	BookMapper bm;
	
	@Test
	public void getListTest() {
		log.info("getListTest................");
		List<BookVO> vo = bm.getList("");
		
		for (BookVO bookVO : vo) {
			log.info(bookVO);
		}
	}
	
	@Test
	public void insertTest() {
		log.info("insertTest................");
		BookVO vo = new BookVO();
		vo.setBook_title("선생님은몬스터!");
		vo.setBook_price(11000);
		vo.setFileName("/resources/img/선생님은몬스터!.jpg");
		vo.setBook_writer("피터브라운");
		vo.setBook_kategorie("어린이");
		vo.setBook_intro("피터 브라운은 초등학교 시절 몬스터라고 생각했던 선생님과 마음을 나눈 일을 뼈대로 잡고, 다양한 사람들이 들려준 선생님 이야기를 더해 바비와 커비 선생님 캐릭터를 만들었다. 서로를 어려워하던 두 사람이 뜻밖의 계기로 가까워지고, 소통하며 느끼는 기쁨과 놀라움, 진정성을 보여주고 싶었다고 한다.");
		vo.setBook_publisher("사계절");
		log.info(vo);
		
		bm.insert(vo);
		this.getListTest();
	}

}
