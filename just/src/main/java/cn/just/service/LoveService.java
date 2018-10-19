package cn.just.service;

import java.util.List;

import cn.just.vo.Love;

public interface LoveService {
	public void attention(Love love);
	public List<Love> getAttention(Integer id);
}
