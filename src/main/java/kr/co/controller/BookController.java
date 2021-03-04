package kr.co.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.domain.BookVO;
import kr.co.service.BookService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequestMapping("/book/*")
@RequiredArgsConstructor
public class BookController {
	
	private final BookService bookService;
	
	@GetMapping("/list")
	public void list(Model model) {
		log.info("book_list.................");
		model.addAttribute("list", bookService.getList());
	}
	
	@PostMapping("/register")
	public String register(BookVO book, RedirectAttributes ra) {
		log.info("book_register................");
		log.info("register : "+book.getBook_title()+".............");
		
		return "redirect:/book/get?book_id=";
	}
	
	@GetMapping("/register")
	public void register() {
		log.info("register get................");
	}
}
