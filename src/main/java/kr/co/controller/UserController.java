package kr.co.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.domain.UserVO;
import kr.co.service.UserService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequestMapping("/user/*")
@RequiredArgsConstructor
public class UserController {
	
	private final UserService userService;
	
	@GetMapping("/login")
	public String login() {
		return "user/login";
	}
	
	@GetMapping("/join")
	public String join(@ModelAttribute("user") UserVO user) {
		return "user/join";
	}
	
	@GetMapping("/join2")
	@ResponseBody
	public boolean join(@RequestBody @RequestParam("user_id") @ModelAttribute("user_id") String user_id) {
		log.info("join2..........."+user_id);
		
		return userService.idcheck(user_id);
	}
	
	@PostMapping("/join_success") 
	public void join_success(HttpSession session,@ModelAttribute("user") UserVO user) {
		userService.join(user);
		session.setAttribute("user_id", user.getUser_id());
		session.setAttribute("user_pw", user.getUser_pw());

	}
	
}
