package cn.just.service;

import java.util.List;

public interface BaseService {
	public void Register(Object object);
	public Object GetOneById(int id);
	public List<?> GetList();
	//�����û��������û�
	public Object GetOneByName(String username);
}
