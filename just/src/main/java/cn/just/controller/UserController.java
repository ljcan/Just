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
	 * 注册用户
	 * @param user
	 * @return
	 */
	@RequestMapping("/register")
	public String register(User user,HttpServletRequest req) {
		System.out.println("====================");
			String path=req.getRealPath("/images");
			user.setUser_image("/images/frist.png");
			System.out.println("头像路径："+new File(path,"/frist.png").getAbsolutePath());
			userService.Add(user);
		System.out.println(user.toString());
		return "redirect:/html/login.html";
	}
	/**
	 * 修改用户密码
	 * @param user
	 * @return
	 */
	@RequestMapping("/update")
	public String update(User user) {
		userService.Update(user);
		System.out.println("修改成功");
		return "redirect:/html/login.html";
	}
}
