package cn.just.dao;

import java.util.List;

public interface BaseDao {
	//信息注册
	public void Register(Object object);
	//批量信息查询
	public List<?> GetList();
	//查询通过id查询信息
	public Object GetOneById(int id);
	//通过用户名查找用户信息
	public Object GetOneByName(String username);
}
