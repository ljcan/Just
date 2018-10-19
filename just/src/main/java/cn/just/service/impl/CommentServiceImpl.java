package cn.just.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.just.dao.CommentDao;
import cn.just.service.CommentService;
import cn.just.vo.Comment;
@Service("commentService")
public class CommentServiceImpl implements CommentService {
	@Autowired
	public CommentDao commentDao;
	@Override
	public void publishComment(Comment comment) {
		commentDao.publishComment(comment);
	}
	@Override
	public List<Comment> showAllComment(Integer c_message_id) {
		return commentDao.showAllComment(c_message_id);
	}

}
