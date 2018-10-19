package cn.just.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.just.service.LoginService;
import cn.just.service.UserService;
import cn.just.vo.User;

@Controller
public class LoginController {
	@Autowired
	public LoginService loginService;
	
	@RequestMapping("/login")
	 public String userLogin(String userbh,String pwd,Model model,
			 HttpServletRequest req,HttpServletResponse response) 
					 throws IOException, InterruptedException{  
		   System.out.println("用户名:"+userbh);
		   System.out.println("密码:"+pwd);
		   boolean hasUser=loginService.GetOneByName(userbh, pwd);
		   if(hasUser){
			 //将当前用户放入会话中
			   Integer id=loginService.SelectIdByName(userbh);
			   User cur_user=new User(id, userbh, pwd);
			   req.getSession().setAttribute("cur_user", cur_user);
			 //重定向发送数据
//				model.addAttribute("cur_name", cur_user.getUsername());
			   return "redirect:message/showMessage.spring";
		   }else{
			   model.addAttribute("error","用户不存在或者密码错误，请重新登录");
//			   response.setCharacterEncoding("UTF-8");;
//			   response.getWriter().print("<script>alert('用户不存在或者密码错误，请重新登录');</script>");
//			   response.getWriter().flush();
			   return "redirect:html/login.html";
		   }
	   }
	
	
	public void setLoginService(LoginService loginService) {
		this.loginService = loginService;
	}
}
