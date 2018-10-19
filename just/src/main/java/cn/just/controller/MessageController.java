package cn.just.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import cn.just.service.ImageUploadService;
import cn.just.service.MessageService;
import cn.just.service.UserService;
import cn.just.utils.ThumbImageService;
import cn.just.vo.ImageMessage;
import cn.just.vo.Message;
import cn.just.vo.MessageEntity;
import cn.just.vo.User;
import cn.just.vo.UserEntity;

@Controller
@RequestMapping("/message")
public class MessageController {
	@Autowired
	public MessageService messageService;
	@Autowired
	public UserService userService;
	@Autowired
	public ImageUploadService imageUploadService;
	@Autowired
	public ThumbImageService thumbImageService;
	
//	@RequestMapping("/publishTask")
//	public String publish(Message message,HttpServletRequest req){
//		//��ȡ�Ự
//		User cur_user=(User) req.getSession().getAttribute("cur_user");
//		//����̬
//		if(cur_user==null) {
//			return "redirect:../html/login.html";
//		}
//		System.out.println("========"+cur_user.toString());
//		message.setUser(cur_user); 			//�໥����
//		Integer user_id=cur_user.getId();
//		message.setUser_id(user_id); 
//		
//		//��ǰ�û������
//		cur_user.getMessage().add(message);
//		userService.Update(cur_user);
//		
//		messageService.publishTask(message);
//		//�ض���������
////		model.addAttribute("cur_name", cur_user.getUsername());
//		return "./showMessage.spring";
//	}
//	@RequestMapping("/showMessage")
//	public String show(HttpServletRequest req,HttpServletResponse resp,ModelMap model) 
//			throws ServletException, IOException {
//		List<MessageEntity> list=messageService.showMessage();
//		req.setCharacterEncoding("UTF-8");
//		if(list!=null) {
//			req.setAttribute("list", list);
//		}else {
//			System.out.println("����Ϊ��");
//		}
//		Collections.reverse(list); 		//�������ж�̬��Ϣ
//		System.out.println("��������");
//		//��ȡ�Ự
//		User cur_user=(User) req.getSession().getAttribute("cur_user");
//		//����̬
//		if(cur_user==null) {		//��ݹ���
//		model.addAttribute("list", list);
//		return "../html/login.html";
//		}
////		req.getRequestDispatcher("../html/index.jsp").forward(req, resp);
////		req.getRequestDispatcher("../html/personalList.jsp").forward(req, resp);
//				
//		//��ȡ��ǰ�û���ͷ��
//		String newimage=userService.getUserImage(cur_user.getId());
//		if(newimage==null) {		//���û�Ĭ��ͷ��
//			newimage="/images/thum_index.png";
//		}
//		System.out.println("��ǰ�û�ͷ��"+newimage);	
//		model.addAttribute("newimage",newimage);
//		model.addAttribute("list", list);
//		model.addAttribute("user_id", cur_user.getId());	//��ȡ��ǰ�û���ID������ͷ��
//		
//		//��ȡ�����û���Ϣ
//		List<UserEntity> userlist=userService.selectUser();
//		model.addAttribute("userlist", userlist);
//		Iterator<UserEntity> it=userlist.iterator();
//		while(it.hasNext()) {
//			System.out.println(it.next());
//		}
//		
//		return "../html/index.jsp";
//	}
	
	@RequestMapping("/publishTask")
	public String publish(@RequestParam("content")String content,@RequestParam("message_image") CommonsMultipartFile message_image
			,HttpServletRequest req){
		Message message=new Message();
		message.setContent(content);
//		byte[] pic=message_image.getBytes();
		String 	msg_image=updateImage(message_image, req);
		if(msg_image.equals("/images/")) {
			msg_image+="tx_zbj.jpg";
		}
		message.setMessage_image(msg_image);
		SimpleDateFormat date=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		message.setPublish_time(date.format(new Date()));
		//��ȡ�Ự
		User cur_user=(User) req.getSession().getAttribute("cur_user");
		//����̬
		if(cur_user==null) {
			return "redirect:../html/login.html";
		}
		System.out.println("========"+cur_user.toString());
		message.setUser(cur_user); 			//�໥����
		Integer user_id=cur_user.getId();
		message.setUser_id(user_id); 
		
		//��ǰ�û������
		cur_user.getMessage().add(message);
		userService.Update(cur_user);
		
		messageService.publishTask(message);
		//�ض���������
//		model.addAttribute("cur_name", cur_user.getUsername());
		return "./showMessage.spring";
	}
	@RequestMapping("/showMessage")
	public String show(HttpServletRequest req,HttpServletResponse resp,ModelMap model) 
			throws ServletException, IOException {
		List<MessageEntity> list=messageService.showMessage();
		
		req.setCharacterEncoding("UTF-8");
		if(list!=null) {
			req.setAttribute("list", list);
		}else {
			System.out.println("����Ϊ��");
		}
		Collections.reverse(list); 		//�������ж�̬��Ϣ
		System.out.println("��������");
		//��ȡ�Ự
		User cur_user=(User) req.getSession().getAttribute("cur_user");
		//����̬
		if(cur_user==null) {		//��ݹ���
		model.addAttribute("list", list);
		return "../html/login.html";
		}
//		req.getRequestDispatcher("../html/index.jsp").forward(req, resp);
//		req.getRequestDispatcher("../html/personalList.jsp").forward(req, resp);
				
		//��ȡ��ǰ�û���ͷ��
		String newimage=userService.getUserImage(cur_user.getId());
		if(newimage==null) {		//���û�Ĭ��ͷ��
			newimage="/images/thum_index.png";
		}
		System.out.println("��ǰ�û�ͷ��"+newimage);	
		model.addAttribute("newimage",newimage);
		model.addAttribute("list", list);
		model.addAttribute("user_id", cur_user.getId());	//��ȡ��ǰ�û���ID������ͷ��
		
		//��ȡ�����û���Ϣ
		List<UserEntity> userlist=userService.selectUser();
		model.addAttribute("userlist", userlist);
		Iterator<UserEntity> it=userlist.iterator();
		while(it.hasNext()) {
			System.out.println(it.next());
		}
		
		return "../html/index.jsp";
	}
	
	/**
	 * �ϴ���̬��Ƭ
	 * @param message_image
	 * @param req
	 * @return
	 */
	public String updateImage(CommonsMultipartFile message_image,HttpServletRequest req) {
		String uploadPath="/images";
		//��ȡ�ļ��ϴ�·��
		String realPath=req.getRealPath(uploadPath);
		
		
		
		InputStream is=null;
		OutputStream os=null;
		String imagePath=null;
		try {
			is=message_image.getInputStream();
			os=new FileOutputStream(new File(realPath,message_image.getOriginalFilename()));
//			if(os==null) {
//				os=new FileOutputStream(new File(realPath,"/images/tx_zbj.jpg"));
//			}
//			imagePath=new File(realPath,message_image.getOriginalFilename()).getAbsolutePath();
//			System.out.println(imagePath);
			int len;
			byte[] buffer=new byte[1024];
			while((len=is.read(buffer))!=-1){
				os.write(buffer, 0, len);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}finally{
			try {
				is.close();
				if(os!=null)
				os.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		String imageUrl=imageUploadService.upload(message_image, uploadPath, realPath);
//		String thumbUrl=thumbImageService.thumb(message_image, uploadPath, realPath);
		System.out.println("===��̬�ϴ���ͼƬ"+imageUrl);
		return imageUrl;
		
	}
	
	
	
	/**
	 * ɾ����̬���˶�̬��Ϣ
	 * ͬʱɾ���ö�̬������
	 * @param message_id
	 */
	@RequestMapping("/deleteMessage")
	public String deleteMessage(Integer message_id) {
		messageService.deleteMessage(message_id);
		return "./showMessage.spring";
	}
	
	
}
