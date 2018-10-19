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
 * ��ע
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
	public String attention(String name,HttpServletRequest req) {	//���ö�̬���û�
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
		fans.setF_name(user.getUsername()); //��ǰ�û�Ϊ���ע���˵ķ�˿
//		fans.setUser(user);
//		user.getFans().add(fans);		//��Ĺ�ע���һ����˿
//		user.getLove().add(love);		//���һ����Ĺ�ע
//		userService.Update(user);
		
		
		System.out.println("�ҵĹ�ע==="+love.toString());
		fansService.insert(fans);
		loveService.attention(love);
		System.out.println("��ע�ɹ�");
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
