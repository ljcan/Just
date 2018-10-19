package cn.just.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.just.dao.LoveDao;
import cn.just.service.LoveService;
import cn.just.vo.Love;
@Service("loveService")
public class LoveServiceImpl implements LoveService {
	@Autowired
	public LoveDao loveDao;
	@Override
	public void attention(Love love) {
		loveDao.attention(love);
	}
	@Override
	public List<Love> getAttention(Integer id) {
		return loveDao.getAttention(id);
	}

}
