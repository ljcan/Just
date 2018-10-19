package cn.just.controller;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.just.service.MessageService;
import cn.just.vo.Message;
import cn.just.vo.MessageEntity;
import cn.just.vo.User;

/**
 * 动态转发
 * @author Shinelon
 *
 */
@Controller
public class DispatcherController {
	@Autowired
	public MessageService messageService;
	/**
	 *     		     	 	<%
						String oldusername=(String)request.getSession().getAttribute("oldusername");
						String is=(String)request.getSession().getAttribute("is");
						Integer i=Integer.valueOf(is);
						
						if(i==1)
							response.getWriter().println("转自："+oldusername);
						%>

	 * @param messageEntity
	 * @param req
	 * @return
	 */
	@RequestMapping("/dispatcher")
	public String dispatcherMessage(MessageEntity messageEntity,HttpServletRequest req) {
		System.out.println("++++++++++++++"+messageEntity.toString());
		User user=(User) req.getSession().getAttribute("cur_user");
		if(user!=null) {
		String oldusername=messageEntity.getUsername();		//记录最初发该条动态的用户名
		req.getSession().setAttribute("oldusername", oldusername);
		req.getSession().setAttribute("is", "1");
		Message message=new Message();
		message.setContent(messageEntity.getContent());
		message.setUser_id(user.getId());
		message.setMessage_image(messageEntity.getMessage_image());
		message.setUser(user);
		messageService.publishTask(message);
		return "redirect:./message/showMessage.spring";
		}else {			//身份过期（session超时）
			return "redirect:./html/login.html";
		}
	}
}
