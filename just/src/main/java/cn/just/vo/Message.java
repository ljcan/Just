package cn.just.vo;

import java.util.HashSet;
import java.util.Set;

public class Message {
	private Integer id;
	private String content;
	private Integer user_id;
	private String publish_time;
	private String message_image;
	public Integer like;
	private User user;
	private Set<Comment> comment=new HashSet<Comment>();
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Integer getUser_id() {
		return user_id;
	}
	public void setUser_id(Integer user_id) {
		this.user_id = user_id;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Set<Comment> getComment() {
		return comment;
	}
	public void setComment(Set<Comment> comment) {
		this.comment = comment;
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
	public Integer getLike() {
		return like;
	}
	public void setLike(Integer like) {
		this.like = like;
	}
	
	
//	@Override
//	public String toString() {
//		return "Message [id=" + id + ", content=" + content + ", user_id=" + user_id + ", user=" + user + ", comment="
//				+ comment + "]";
//	}
	
	
	
	
	
}
