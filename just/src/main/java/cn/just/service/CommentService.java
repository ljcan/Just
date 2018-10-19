package cn.just.service;

import java.util.List;

import cn.just.vo.Comment;

public interface CommentService {
	public void publishComment(Comment comment);
	public List<Comment> showAllComment(Integer c_message_id);
}
