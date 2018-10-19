package cn.just.service;

import java.util.List;

import cn.just.vo.ImageMessage;
import cn.just.vo.User;
import cn.just.vo.UserEntity;


public interface UserService {
   public List<User> getList();
   public void Add(User user);
   public void Delete(int id);
   public void Update(User user);
   public void Update(ImageMessage imageMessage);
   public String getUserImage(Integer id);
   public List<UserEntity> selectUser();
   public String getIntroduce(Integer id);
   public Integer getId(String username);
}
