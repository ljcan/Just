package cn.just.dao;

import java.util.List;

import cn.just.vo.Fans;

public interface FansDao {
	public void insert(Fans fans);
	public List<Fans> getFans(Integer id);
	
}
