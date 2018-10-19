package cn.just.dao;

import java.util.List;

import cn.just.vo.LikeEntity;
import cn.just.vo.Message;
import cn.just.vo.MessageEntity;

public interface MessageDao {
	//发布任务
	public void publishTask(Message message);
	//展示动态
	public List<MessageEntity> showMessage();
	//展示个人动态
	public List<MessageEntity> showMessage(String username);
	//根据id来获取动态信息
	public Message selectMessageById(Integer id);
	//删除动态信息
	public void deleteMessage(Integer message_id);
	public void updateLike(LikeEntity like);
	
	public Integer selectLike(Integer like);
}
