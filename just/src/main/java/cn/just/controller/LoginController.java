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
		   System.out.println("�û���:"+userbh);
		   System.out.println("����:"+pwd);
		   boolean hasUser=loginService.GetOneByName(userbh, pwd);
		   if(hasUser){
			 //����ǰ�û�����Ự��
			   Integer id=loginService.SelectIdByName(userbh);
			   User cur_user=new User(id, userbh, pwd);
			   req.getSession().setAttribute("cur_user", cur_user);
			 //�ض���������
//				model.addAttribute("cur_name", cur_user.getUsername());
			   return "redirect:message/showMessage.spring";
		   }else{
			   model.addAttribute("error","�û������ڻ���������������µ�¼");
//			   response.setCharacterEncoding("UTF-8");;
//			   response.getWriter().print("<script>alert('�û������ڻ���������������µ�¼');</script>");
//			   response.getWriter().flush();
			   return "redirect:html/login.html";
		   }
	   }
	
	
	public void setLoginService(LoginService loginService) {
		this.loginService = loginService;
	}
}
