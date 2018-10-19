package cn.just.dao;

import java.util.List;

import cn.just.vo.Love;

public interface LoveDao {
	public void attention(Love love);
	public List<Love> getAttention(Integer id);
}
