package cn.just.controller;

import java.io.IOException;
import java.util.Collections;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.just.service.FansService;
import cn.just.service.LoveService;
import cn.just.service.MessageService;
import cn.just.service.UserService;
import cn.just.vo.Fans;
import cn.just.vo.Love;
import cn.just.vo.MessageEntity;
import cn.just.vo.User;

/**
 * ���˿ռ�
 * 
 * @author Shinelon
 *
 */
@Controller
@RequestMapping("/personal")
public class PersonalController {
	@Autowired
	public MessageService messageService;
	@Autowired
	UserService userService;
	@Autowired
	public LoveService loveService;
	@Autowired
	public FansService fansService;

	@RequestMapping("/show")
	public String show(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("���˿ռ�");
		User user = (User) req.getSession().getAttribute("cur_user");
		// ����̬
		if (user == null) {
			return "redirect:../html/login.html";
		}
		req.getSession().setAttribute("u_id", user.getId());
		String username = user.getUsername();
		System.out.println(username);
		List<MessageEntity> list = messageService.showMessage(username);
		Collections.reverse(list);
		System.out.println("-----------" + list.toString());
		req.setAttribute("personal", list);
		String newimage = userService.getUserImage(user.getId());
		// ��ȡ�û����˽�����Ϣ
		String introduce = userService.getIntroduce(user.getId());
		if (introduce == null) {
			introduce = "";
		}
		req.setAttribute("introduce", introduce);
		req.setAttribute("newimage", newimage);
		System.out.println("���˿ռ䣺" + newimage);
		System.out.println("��˿");
		//��÷�˿
		List<Fans> fansList=fansService.getFans(user.getId());
		if(fansList!=null) {
			System.out.println("�з�˿");
			for(Fans fans:fansList) {
				System.out.println(fans.toString());
			}
		}
		req.setAttribute("fansList", fansList);
		System.out.println("��ע");
		//��ȡ��ע
		List<Love> loveList=loveService.getAttention(user.getId());
		if(loveList!=null) {
			for(Love love:loveList) {
				System.out.println(love.toString());
			}
		}
		req.setAttribute("loveList", loveList);
		
		req.getRequestDispatcher("../html/personalList.jsp").forward(req, resp);
		return "../html/personalList.jsp";
	}

	@RequestMapping("/show2")
	public String show2(String username, Integer id, HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		List<MessageEntity> list = messageService.showMessage(username);
		Collections.reverse(list);
		System.out.println("-----------" + list.toString());
		req.setAttribute("personal", list);
		// ��ȡ�û�ͷ��
		String newimage = userService.getUserImage(id);
		// ��ȡ�û����˽�����Ϣ
		String introduce = userService.getIntroduce(id);
		if (introduce == null) {
			introduce = "";
		}
		req.setAttribute("newimage", newimage);
		req.setAttribute("introduce", introduce);
		System.out.println("���˿ռ䣺" + newimage);
		req.getRequestDispatcher("../html/personalList.jsp").forward(req, resp);
		return "../html/personalList.jsp";
	}
}
