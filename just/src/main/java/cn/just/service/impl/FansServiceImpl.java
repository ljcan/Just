package cn.just.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.just.dao.FansDao;
import cn.just.service.FansService;
import cn.just.vo.Fans;
@Service("fansService")
public class FansServiceImpl implements FansService {
	@Autowired
	public FansDao fanDao;
	@Override
	public void insert(Fans fans) {
		fanDao.insert(fans);
	}
	@Override
	public List<Fans> getFans(Integer id) {
		
		return fanDao.getFans(id);
	}

}
