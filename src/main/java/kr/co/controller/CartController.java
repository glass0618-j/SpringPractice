package kr.co.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.domain.CartVO;
import kr.co.domain.UserVO;
import kr.co.service.CartService;
import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequestMapping("/cart/*")
public class CartController {
	
	@Autowired
	CartService cartService;
	
	@GetMapping("/list")
	public void list(CartVO cart) {
		log.info("list...........");
	}
	
	@GetMapping("/addCart")
	public String addCart(@RequestParam("book_id") int book_id,
			HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		UserVO uservo  = (UserVO)session.getAttribute("user_info");
		int user_number = uservo.getUser_number();
		CartVO cartvo = new CartVO();
		cartvo.setUser_number(user_number);
		cartvo.setBook_id(book_id);
		String isAready = cartService.findcartbook(cartvo);
		System.out.println("isAready= "+isAready);
		
		if(isAready.equals(true)) {
			return "cart_already";
		}else {
			cartService.addcart(cartvo);
			return "cart_add";
		}
	}
}
