package cn.just.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.just.dao.impl.UserDaoImpl;
import cn.just.service.UserService;
import cn.just.vo.ImageMessage;
import cn.just.vo.User;
import cn.just.vo.UserEntity;


@Service("userService")
public class UserServiceImpl implements UserService{
	@Autowired
	public UserDaoImpl userDao;

	@Override
	public List<User> getList() {
		return userDao.userList();
	}
	//添加用户 
	public void Add(User user){
		userDao.Add(user);
	}
	//删除用户
	public void Delete(int id){
		userDao.Delete(id);
	}
	//更新用户信
	public void Update(User user){
		userDao.Update(user);
	}
	@Override
	public void Update(ImageMessage imageMessage) {
		userDao.Update(imageMessage);
	}
	@Override
	public String getUserImage(Integer id) {
		return userDao.getUserImage(id);
	}
	
	public void setUserDao(UserDaoImpl userDao) {
		this.userDao = userDao;
	}
	@Override
	public List<UserEntity> selectUser() {
		return userDao.selectUser();
	}
	@Override
	public String getIntroduce(Integer id) {
		return userDao.getIntroduce(id);
	}
	@Override
	public Integer getId(String username) {
		Integer id=userDao.getId(username).getId();
		return id;
	}
	
	

}
