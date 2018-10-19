package cn.just.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cn.just.dao.LoveDao;
import cn.just.vo.Love;
import cn.just.vo.LoveEntity;
@Repository("loveDao")
public class LoveDaoImpl extends SqlSessionDaoSupport implements LoveDao {
	@Autowired
	@Override
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		super.setSqlSessionFactory(sqlSessionFactory);
	}
	@Override
	public void attention(Love love) {
		System.out.println("======"+love.toString());
		LoveEntity entity=new LoveEntity();
		entity.setU_id(love.getU_id());
		entity.setU_name_ed(love.getU_name_ed());
		getSqlSession().insert("mybatis.love.insert", entity);
	}
	@Override
	public List<Love> getAttention(Integer id) {
		List<Love> list=getSqlSession().selectList("mybatis.love.getAttention", id);
		return list;
	}

}
