package cn.just.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.just.dao.CommentDao;
import cn.just.dao.MessageDao;
import cn.just.service.MessageService;
import cn.just.vo.LikeEntity;
import cn.just.vo.Message;
import cn.just.vo.MessageEntity;
@Service("messageService")
public class MessageServiceImpl implements MessageService{
	@Autowired
	public MessageDao messageDao;
	
	@Autowired
	public CommentDao commentDao;
	
	@Override
	public void publishTask(Message message) {
		messageDao.publishTask(message);		
	}
	@Override
	public List<MessageEntity> showMessage() {
		return messageDao.showMessage();
	}
	@Override
	public List<MessageEntity> showMessage(String username) {

		return messageDao.showMessage(username);
	}
	@Override
	public Message selectMessageById(Integer id) {
		return messageDao.selectMessageById(id);
	}
	@Override
	public void deleteMessage(Integer message_id) {
		commentDao.deleteComment(message_id);
		messageDao.deleteMessage(message_id);
	}
	@Override
	public void updateLike(Integer like, Integer id) {
		LikeEntity likeEntity=new LikeEntity();
		likeEntity.setLike_num(like);
		likeEntity.setId(id);
		messageDao.updateLike(likeEntity);
	}
	@Override
	public Integer selectLike(Integer id) {
		return messageDao.selectLike(id);
	}

}
