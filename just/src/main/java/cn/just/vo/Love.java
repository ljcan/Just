package cn.just.vo;

public class Love {
	private Integer l_id;
	private Integer u_id;		//用户
	private String u_name_ed;	//你的关注
//	private User user;
	
//	public User getUser() {
//		return user;
//	}
//	public void setUser(User user) {
//		this.user = user;
//	}
	public Integer getL_id() {
		return l_id;
	}
	public void setL_id(Integer l_id) {
		this.l_id = l_id;
	}
	public Integer getU_id() {
		return u_id;
	}
	public void setU_id(Integer u_id) {
		this.u_id = u_id;
	}
	public String getU_name_ed() {
		return u_name_ed;
	}
	public void setU_name_ed(String u_name_ed) {
		this.u_name_ed = u_name_ed;
	}
	@Override
	public String toString() {
		return "Love [l_id=" + l_id + ", u_id=" + u_id + ", u_name_ed=" + u_name_ed + "]";
	}
	
	
}
