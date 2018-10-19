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
	 * 发表评论
	 * @param comment
	 * @return
	 */
	@RequestMapping("/publishComment")
	public String publishComment(Comment comment,HttpServletRequest req) {
		System.out.println("===========---======"+comment.toString());
		//获取当前评论用户
		User cur_user=(User) req.getSession().getAttribute("cur_user");
		//如果身份过期。请重新登录
		if(cur_user==null) {	
			return "redirect:../html/login.html";
		}
//		System.out.println("刚发表的评论信息"+comment.toString());
		comment.setC_user(cur_user.getUsername());
		System.out.println("信息ID"+comment.getC_message_id());
		Message message=messageService.selectMessageById(comment.getC_message_id());
		comment.setC_message(message);
		message.getComment().add(comment);
		System.out.println(comment.toString());
		//向数据库中添加数据
		commentService.publishComment(comment);
		return "redirect:../message/showMessage.spring";
	}
	
	@RequestMapping("/showAllComment")
	public String showAllComment(Integer c_message_id,
			HttpServletRequest req,HttpServletResponse resp) throws ServletException, IOException {
		List<Comment> list=new ArrayList<Comment>();
		list=commentService.showAllComment(c_message_id);
		if(list!=null) {
//			System.out.println("不为空");
			req.setAttribute("commentList", list);
		}else {
//			System.out.println("内容为空");
		}
		req.setAttribute("c_message_id", c_message_id);
		req.getRequestDispatcher("../html/showComment.jsp").forward(req, resp);
		return "../html/showComment.jsp";
	}
	
	
	
}
