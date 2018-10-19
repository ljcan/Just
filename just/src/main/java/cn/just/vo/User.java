package cn.just.vo;

import java.util.HashSet;
import java.util.Set;

public class User {
	private Integer id=null;
	private String username;
	private String pwd;
	private String user_image;
	private String introduce;
	//·ÛË¿
//	private Set<Fans> fans=new HashSet<Fans>();
	//¹Ø×¢
//	private Set<Love> love=new HashSet<Love>();
	public String getIntroduce() {
		return introduce;
	}

	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}


	private Set<Message> message=new HashSet<Message>();
	public User() {
		// TODO Auto-generated constructor stub
	}
	
	public User(Integer id, String username, String pwd) {
		super();
		this.id = id;
		this.username = username;
		this.pwd = pwd;
	}

	public User(String username, String pwd) {
		super();
		this.username = username;
		this.pwd = pwd;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getPwd() {
		return pwd;
	}
	
	
	public String getUser_image() {
		return user_image;
	}

	public void setUser_image(String user_image) {
		this.user_image = user_image;
	}

	public Set<Message> getMessage() {
		return message;
	}
	public void setMessage(Set<Message> message) {
		this.message = message;
	}
	
	
//	public Set<Fans> getFans() {
//		return fans;
//	}
//
//	public void setFans(Set<Fans> fans) {
//		this.fans = fans;
//	}
//
//	public Set<Love> getLove() {
//		return love;
//	}
//
//	public void setLove(Set<Love> love) {
//		this.love = love;
//	}

	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", pwd=" + pwd + ", message=" + message + "]";
	}
	
	
	
}
