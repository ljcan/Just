package cn.just.dao;

import java.util.List;

import cn.just.vo.Comment;

public interface CommentDao {
	public void publishComment(Comment comment);
	public List<Comment> showAllComment(Integer c_message_id);
	public void deleteComment(Integer message_id);
}
