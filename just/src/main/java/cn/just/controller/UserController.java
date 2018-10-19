package cn.just.controller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.just.service.UserService;
import cn.just.vo.User;


@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired
	public UserService userService;
	
	/**
	 * ע���û�
	 * @param user
	 * @return
	 */
	@RequestMapping("/register")
	public String register(User user,HttpServletRequest req) {
		System.out.println("====================");
			String path=req.getRealPath("/images");
			user.setUser_image("/images/frist.png");
			System.out.println("ͷ��·����"+new File(path,"/frist.png").getAbsolutePath());
			userService.Add(user);
		System.out.println(user.toString());
		return "redirect:/html/login.html";
	}
	/**
	 * �޸��û�����
	 * @param user
	 * @return
	 */
	@RequestMapping("/update")
	public String update(User user) {
		userService.Update(user);
		System.out.println("�޸ĳɹ�");
		return "redirect:/html/login.html";
	}
}
