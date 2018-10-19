package cn.just.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.just.service.FansService;
import cn.just.service.LoveService;
import cn.just.service.UserService;
import cn.just.vo.Fans;
import cn.just.vo.Love;
import cn.just.vo.User;
/**
 * 关注
 * @author Shinelon
 *
 */
@Controller
@RequestMapping("/love")
public class LoveController {
	@Autowired
	public LoveService loveService;
	@Autowired
	public UserService userService;
	@Autowired
	public FansService fansService;
	
	
	@RequestMapping("/attention")
	public String attention(String name,HttpServletRequest req) {	//发该动态的用户
		User user=(User) req.getSession().getAttribute("cur_user");
		if(user==null) {
			return "redirect:../html/login.html";
		}
		Integer id=user.getId();
		Love love=new Love();
		love.setU_id(id);
		love.setU_name_ed(name);
//		love.setUser(user);
		Fans fans=new Fans();
		Integer f_u_id=userService.getId(name);
		fans.setF_u_id(f_u_id);
		fans.setF_name(user.getUsername()); //当前用户为你关注的人的粉丝
//		fans.setUser(user);
//		user.getFans().add(fans);		//你的关注添加一个粉丝
//		user.getLove().add(love);		//添加一个你的关注
//		userService.Update(user);
		
		
		System.out.println("我的关注==="+love.toString());
		fansService.insert(fans);
		loveService.attention(love);
		System.out.println("关注成功");
		return "../message/showMessage.spring";
	}
	@RequestMapping("/showFans")
	public void showFans(Integer id) {
		List<Fans> fansList=fansService.getFans(id);
		for(Fans fans:fansList) {
			System.out.println(fans.toString());
		}
	}
	@RequestMapping("/showAttention")
	public void showAttention(Integer id) {
		List<Love> loveList=loveService.getAttention(id);
		for(Love love:loveList) {
			System.out.println(love.toString());
		}
	}
}
