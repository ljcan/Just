package cn.just.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.just.service.CommentService;
import cn.just.service.MessageService;
import cn.just.vo.Comment;
import cn.just.vo.Message;
import cn.just.vo.User;

@Controller
@RequestMapping("/comment")
public class CommentController {
	@Autowired
	public MessageService messageService;
	@Autowired
	public CommentService commentService;
	/**
	 * ��������
	 * @param comment
	 * @return
	 */
	@RequestMapping("/publishComment")
	public String publishComment(Comment comment,HttpServletRequest req) {
		System.out.println("===========---======"+comment.toString());
		//��ȡ��ǰ�����û�
		User cur_user=(User) req.getSession().getAttribute("cur_user");
		//�����ݹ��ڡ������µ�¼
		if(cur_user==null) {	
			return "redirect:../html/login.html";
		}
//		System.out.println("�շ����������Ϣ"+comment.toString());
		comment.setC_user(cur_user.getUsername());
		System.out.println("��ϢID"+comment.getC_message_id());
		Message message=messageService.selectMessageById(comment.getC_message_id());
		comment.setC_message(message);
		message.getComment().add(comment);
		System.out.println(comment.toString());
		//�����ݿ����������
		commentService.publishComment(comment);
		return "redirect:../message/showMessage.spring";
	}
	
	@RequestMapping("/showAllComment")
	public String showAllComment(Integer c_message_id,
			HttpServletRequest req,HttpServletResponse resp) throws ServletException, IOException {
		List<Comment> list=new ArrayList<Comment>();
		list=commentService.showAllComment(c_message_id);
		if(list!=null) {
//			System.out.println("��Ϊ��");
			req.setAttribute("commentList", list);
		}else {
//			System.out.println("����Ϊ��");
		}
		req.setAttribute("c_message_id", c_message_id);
		req.getRequestDispatcher("../html/showComment.jsp").forward(req, resp);
		return "../html/showComment.jsp";
	}
	
	
	
}
