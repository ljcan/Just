package cn.just.service;

public interface LoginService {
	//ͨ���û����������в�ѯ��Ϣ
	public boolean GetOneByName(String username,String pwd);
	//��֤�û�����
	public boolean istrue(String password,String pwd);
	public Integer SelectIdByName(String username);
}
