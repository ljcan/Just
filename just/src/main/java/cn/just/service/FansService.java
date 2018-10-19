package cn.just.service;

import java.util.List;

import cn.just.vo.Fans;

public interface FansService {
	public void insert(Fans fans);
	public List<Fans> getFans(Integer id);
}
