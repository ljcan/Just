package cn.just.dao;

public interface LoginDao {
	public Object GetOneByName(String username);
	public Integer SelectIdByName(String username);
}
