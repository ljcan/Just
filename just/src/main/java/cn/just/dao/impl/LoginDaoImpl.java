package cn.just.dao.impl;


import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cn.just.dao.LoginDao;
import cn.just.vo.User;
/**
 * ÓÃ»§µÇÂ¼²éÑ¯
 * @author Shinelon
 *
 */
@Repository("loginDao")
public class LoginDaoImpl extends SqlSessionDaoSupport implements LoginDao{
	@Autowired
	@Override
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		super.setSqlSessionFactory(sqlSessionFactory);
	}

	@Override
	public Object GetOneByName(String username) {
		String v_username=username;
		return getSqlSession().selectOne("mybatis.selectPwd",v_username);
	}

	@Override
	public Integer SelectIdByName(String username) {
		User user=new User();
		user=getSqlSession().selectOne("mybatis.selectId", username);
		return user.getId();
	}
	
}
