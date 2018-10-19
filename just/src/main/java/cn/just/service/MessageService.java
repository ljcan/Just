package cn.just.service;

import java.util.List;

import cn.just.vo.Message;
import cn.just.vo.MessageEntity;

public interface MessageService {
	//发布任务
	public void publishTask(Message message);
	public List<MessageEntity> showMessage();
	public List<MessageEntity> showMessage(String username);
	public Message selectMessageById(Integer id);
	public void deleteMessage(Integer message_id);
	public void updateLike(Integer like,Integer id);
	public Integer selectLike(Integer id);
}
