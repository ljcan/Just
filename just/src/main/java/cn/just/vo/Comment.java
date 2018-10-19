package cn.just.vo;

/**
 * 评论实体
 * @author Shinelon
 *
 */
public class Comment {
	private int c_id;
	private String c_comment;
	private	String c_user;	//评论人
	private Integer c_message_id;
	private Message c_message;
	public int getC_id() {
		return c_id;
	}
	public void setC_id(int c_id) {
		this.c_id = c_id;
	}
	
	public String getC_comment() {
		return c_comment;
	}
	public void setC_comment(String c_comment) {
		this.c_comment = c_comment;
	}
	public String getC_user() {
		return c_user;
	}
	public void setC_user(String c_user) {
		this.c_user = c_user;
	}
	public Message getC_message() {
		return c_message;
	}
	public void setC_message(Message c_message) {
		this.c_message = c_message;
	}
	public Integer getC_message_id() {
		return c_message_id;
	}
	public void setC_message_id(Integer c_message_id) {
		this.c_message_id = c_message_id;
	}
//	@Override
//	public String toString() {
//		return "Comment [c_id=" + c_id + ", c_comment=" + c_comment + ", c_user=" + c_user + ", c_message_id="
//				+ c_message_id + ", c_message=" + c_message + "]";
//	}
	
	
	
	
	
	
}
	
