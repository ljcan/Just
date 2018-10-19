package cn.just.service;

public interface LoginService {
	//通过用户名从数据中查询信息
	public boolean GetOneByName(String username,String pwd);
	//验证用户密码
	public boolean istrue(String password,String pwd);
	public Integer SelectIdByName(String username);
}
