package cn.just.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cn.just.dao.MessageDao;
import cn.just.vo.LikeEntity;
import cn.just.vo.Message;
import cn.just.vo.MessageEntity;
@Repository("messageDao")
public class MessageDaoImpl extends SqlSessionDaoSupport implements MessageDao{
	@Autowired
	@Override
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		super.setSqlSessionFactory(sqlSessionFactory);
	}

	@Override
	public void publishTask(Message message) {
		getSqlSession().insert("mybatis.message.publishTask", message);
	}

	@Override
	public List<MessageEntity> showMessage() {
		List<MessageEntity> list=getSqlSession().selectList("mybatis.message.showMessage");
		return list;
	}

	@Override
	public List<MessageEntity> showMessage(String username) {
		System.out.println("===========------"+username);
		List<MessageEntity> list=getSqlSession().selectList("mybatis.message.showPersonalMessage",username);
//		System.out.println(list.toString());
		return list;
	}

	@Override
	public Message selectMessageById(Integer id) {
		return getSqlSession().selectOne("mybatis.message.selectMessageById", id);
	}

	@Override
	public void deleteMessage(Integer message_id) {
		getSqlSession().delete("mybatis.message.deleteMessage",message_id);
	}

	@Override
	public void updateLike(LikeEntity like) {
		getSqlSession().update("mybatis.message.updateLike",like);
	}

	@Override
	public Integer selectLike(Integer id) {
		Message msg=getSqlSession().selectOne("mybatis.message.selectLike", id);
		id=msg.getId();
		return id;
	}

	
	
}
