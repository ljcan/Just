package cn.just.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cn.just.dao.FansDao;
import cn.just.vo.Fans;
@Repository("/fansDao")
public class FansDaoImpl extends SqlSessionDaoSupport implements FansDao {
	@Autowired
	@Override
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		super.setSqlSessionFactory(sqlSessionFactory);
	}
	@Override
	public void insert(Fans fans) {
		System.out.println("==="+fans.toString());
		getSqlSession().insert("mybatis.fans.insert",fans);
	}
	@Override
	public List<Fans> getFans(Integer id) {
		List<Fans> list=getSqlSession().selectList("mybatis.fans.getFans", id);
		return list;
	}

}
