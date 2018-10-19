package cn.just.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.just.service.MessageService;
import redis.clients.jedis.Jedis;

@Controller
@RequestMapping("/like")
public class LikeController {
	@Autowired
	public MessageService messageService;
	
	
	Jedis jedis=new Jedis("localhost");
	@RequestMapping("/likeContent")
	public void likeContent(Integer user_id,Integer content_id,HttpServletResponse resp) {
		System.out.println("user_id=============="+user_id);
		System.out.println("content_id======"+content_id);
		jedis.lpush("content_id:"+content_id, "{user_id:"+user_id+"}");
		System.out.println("µ„‘ﬁ≥…π¶");
		List<String> l=getLike("content_id:"+content_id);
		messageService.updateLike(l.size(), content_id);
		for(String str:l) {
			System.out.println(str);
		}
		System.out.println(l.size());
		
//		int like_num=messageService.selectLike(content_id);
		
		try {
			PrintWriter writer=resp.getWriter();
//			writer.print(l.size());
		} catch (IOException e) {
			e.printStackTrace();
		}
//		return "redirect:../message/showMessage.spring";
		
	}
	public List<String> getLike(String key) {
		List<String> list=jedis.lrange(key, 0, -1);
		return list;
	}
}
