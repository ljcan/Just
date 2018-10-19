package cn.just.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.just.dao.LoginDao;
import cn.just.service.LoginService;
import cn.just.vo.User;

@Service("loginService")
public class LoginServiceImpl implements LoginService{
	@Autowired
	public LoginDao loginDao;
	public void setLoginDao(LoginDao loginDao) {
		this.loginDao = loginDao;
	}
	
	@Override
	public boolean GetOneByName(String username,String pwd) {
		User user=new User();
		if((User) loginDao.GetOneByName(username)!=null)
			user= (User) loginDao.GetOneByName(username);
		else
			return false;
		String password=user.getPwd();
		return istrue(password,pwd);
	}

	@Override
	public boolean istrue(String password,String pwd) {
		if(password.equals(pwd))
		return true;
		else
		return false;
		
	}

	@Override
	public Integer SelectIdByName(String username) {
		return loginDao.SelectIdByName(username);
		
	}
	
}
