package cn.just.dao;

import java.util.List;

public interface BaseDao {
	//��Ϣע��
	public void Register(Object object);
	//������Ϣ��ѯ
	public List<?> GetList();
	//��ѯͨ��id��ѯ��Ϣ
	public Object GetOneById(int id);
	//ͨ���û��������û���Ϣ
	public Object GetOneByName(String username);
}
