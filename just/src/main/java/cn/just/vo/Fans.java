package cn.just.vo;

public class Fans {
	private Integer f_id;
	private Integer f_u_id;		//ÓÃ»§
	private String  f_name;		//ÄãµÄ·ÛË¿
//	private User user;
	public Integer getF_id() {
		return f_id;
	}
	public void setF_id(Integer f_id) {
		this.f_id = f_id;
	}
	public Integer getF_u_id() {
		return f_u_id;
	}
	public void setF_u_id(Integer f_u_id) {
		this.f_u_id = f_u_id;
	}
	public String getF_name() {
		return f_name;
	}
	public void setF_name(String f_name) {
		this.f_name = f_name;
	}
	@Override
	public String toString() {
		return "Fans [f_id=" + f_id + ", f_u_id=" + f_u_id + ", f_name=" + f_name + "]";
	}
	
//	public User getUser() {
//		return user;
//	}
//	public void setUser(User user) {
//		this.user = user;
//	}
//	@Override
//	public String toString() {
//		return "Fans [f_id=" + f_id + ", f_u_id=" + f_u_id + ", f_name=" + f_name + ", user=" + user + "]";
//	}
	
}
