package cn.just.dao;

import java.util.List;

import cn.just.vo.ImageMessage;
import cn.just.vo.User;
import cn.just.vo.UserEntity;


public interface UserDao {
	public List<User> userList();
	public void Add(User user);
	public void Delete(int id);
	public void Update(User user);
	public void Update(ImageMessage imageMessage);
	public String getUserImage(Integer id);
	public List<UserEntity> selectUser();
	public String getIntroduce(Integer id);
	public User getId(String username);
}
