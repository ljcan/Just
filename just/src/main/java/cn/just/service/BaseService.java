package cn.just.service;

import java.util.List;

public interface BaseService {
	public void Register(Object object);
	public Object GetOneById(int id);
	public List<?> GetList();
	//按照用户名查找用户
	public Object GetOneByName(String username);
}
