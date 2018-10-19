package cn.just.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cn.just.dao.UserDao;
import cn.just.vo.ImageMessage;
import cn.just.vo.User;
import cn.just.vo.UserEntity;

@Repository("userDao")
public class UserDaoImpl extends SqlSessionDaoSupport implements UserDao{
	@Autowired
	@Override
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		super.setSqlSessionFactory(sqlSessionFactory);
	}
	@Override
	public List<User> userList() {
     return getSqlSession().selectList("mybatis.userSelect");
	}
	public void Add(User user){
		getSqlSession().insert("mybatis.userInsert",user);
	}
	public void Delete(int id){
		getSqlSession().delete("mybatis.userDelete", id);
	}
	public void Update(User user){
		getSqlSession().update("mybatis.userUpdate", user);
	}
	@Override
	public void Update(ImageMessage imageMessage) {
		getSqlSession().update("mybatis.updateImage",imageMessage);
	}
	@Override
	public String getUserImage(Integer id) {
		String path=getSqlSession().selectOne("mybatis.getUserImage", id);
		System.out.println("Dao²ã==="+path);
		return path;
	}
	@Override
	public List<UserEntity> selectUser() {
		return getSqlSession().selectList("mybatis.userSelect");
	}
	@Override
	public String getIntroduce(Integer id) {
		return getSqlSession().selectOne("mybatis.getUserIntroduce", id);
	}
	@Override
	public User getId(String username) {
		return getSqlSession().selectOne("mybatis.selectId", username);
	}
	
}
