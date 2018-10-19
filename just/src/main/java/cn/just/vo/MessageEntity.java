package cn.just.vo;
/**
 * 对动态消息的封装
 * @author Shinelon
 *
 */
public class MessageEntity {
	private Integer id;
	private String content;
	private String username;
	private String oldusername="";	//最初发该条动态的人
	private String publish_time;
	private String message_image;
	private Integer like_num;
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	
	public String getOldusername() {
		return oldusername;
	}
	public void setOldusername(String oldusername) {
		this.oldusername = oldusername;
	}
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
	public String getPublish_time() {
		return publish_time;
	}
	public void setPublish_time(String publish_time) {
		this.publish_time = publish_time;
	}
	
	public String getMessage_image() {
		return message_image;
	}
	public void setMessage_image(String message_image) {
		this.message_image = message_image;
	}
	public Integer getLike_num() {
		return like_num;
	}
	public void setLike_num(Integer like_num) {
		this.like_num = like_num;
	}
	

}
