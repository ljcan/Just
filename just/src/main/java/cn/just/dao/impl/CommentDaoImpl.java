package cn.just.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cn.just.dao.CommentDao;
import cn.just.vo.Comment;
@Repository("commentDao")
public class CommentDaoImpl extends SqlSessionDaoSupport implements CommentDao{
	@Autowired
	@Override
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		// TODO Auto-generated method stub
		super.setSqlSessionFactory(sqlSessionFactory);
	}
	
	
	@Override
	public void publishComment(Comment comment) {
		getSqlSession().insert("mybatis.comment.publishComment", comment);
	}


	@Override
	public List<Comment> showAllComment(Integer c_message_id) {
		List<Comment> list=getSqlSession().selectList("mybatis.comment.showAllComment", c_message_id);
		System.out.println("============"+c_message_id);
//		System.out.println(list.toString());
		return list;
	}


	@Override
	public void deleteComment(Integer message_id) {
		getSqlSession().delete("mybatis.comment.deleteComment", message_id);
	}

}
