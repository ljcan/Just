package cn.just.dao;

import java.util.List;

import cn.just.vo.LikeEntity;
import cn.just.vo.Message;
import cn.just.vo.MessageEntity;

public interface MessageDao {
	//��������
	public void publishTask(Message message);
	//չʾ��̬
	public List<MessageEntity> showMessage();
	//չʾ���˶�̬
	public List<MessageEntity> showMessage(String username);
	//����id����ȡ��̬��Ϣ
	public Message selectMessageById(Integer id);
	//ɾ����̬��Ϣ
	public void deleteMessage(Integer message_id);
	public void updateLike(LikeEntity like);
	
	public Integer selectLike(Integer like);
}
