package cn.just.controller;


import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import cn.just.service.ImageUploadService;
import cn.just.service.UserService;
import cn.just.utils.ThumbImageService;
import cn.just.vo.ImageMessage;


@Controller
@RequestMapping("/image")
public class ImageController {
	
	public ImageUploadService imageUploadService;
	public ThumbImageService thumbImageService;
	
	@Autowired
	public void setImageUploadService(ImageUploadService imageUploadService) {
		this.imageUploadService = imageUploadService;
	}
	@Autowired
	public void setThumbImageService(ThumbImageService thumbImageService) {
		this.thumbImageService = thumbImageService;
	}
	@Autowired
	public UserService userService;
	/**
	 * 更换头像
	 * @param user_id
	 * @param image
	 * @param req
	 * @param model
	 * @return
	 * @throws IOException
	 */
	
	@RequestMapping("/updateImage")
	public String upload(@RequestParam("user_id") Integer user_id,@RequestParam("image")CommonsMultipartFile image,
			HttpServletRequest req,ModelMap model) throws IOException{
		String uploadPath="/images";
		//获取文件上传路径
		String realPath=req.getRealPath(uploadPath);
		
		
		
		InputStream is=null;
		OutputStream os=null;
		String imagePath=null;
		try {
			is=image.getInputStream();
			os=new FileOutputStream(new File(realPath,image.getOriginalFilename()));
			imagePath=new File(realPath,image.getOriginalFilename()).getAbsolutePath();
			System.out.println(imagePath);
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
				os.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		String imageUrl=imageUploadService.upload(image, uploadPath, realPath);
		String thumbUrl=thumbImageService.thumb(image, uploadPath, realPath);
		
		System.out.println("thumbUrl=========="+thumbUrl);
		ImageMessage imageMessage=new ImageMessage();
		imageMessage.setId(user_id);
		imageMessage.setUser_image(thumbUrl);	//数据库中存入上传照片的相对路径
		
		userService.Update(imageMessage);
		
//		model.addAttribute("oldimage", imageUrl);
//		model.addAttribute("newimage",thumbUrl);
//		return "./jsp/pictures.jsp";
		return "redirect:../message/showMessage.spring";
	}
	/**
	 * 动态上传的照片
	 * @param user_id
	 * @param message_image
	 * @return
	 */
	@RequestMapping("/updateMessage_Image")
	public void uploadMsgImage(@RequestParam("user_id") Integer user_id,
			@RequestParam("message_image") CommonsMultipartFile message_image,
			HttpServletRequest req,ModelMap model) {
		byte[] b1=message_image.getBytes();
		
	}
	
	
	
	
	}
