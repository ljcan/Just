package cn.just.vo;
/**
 * 图片信息
 * @author Shinelon
 *
 */
public class ImageMessage {
	private Integer id;		//用户ID
	private String user_image;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUser_image() {
		return user_image;
	}
	public void setUser_image(String user_image) {
		this.user_image = user_image;
	}
	@Override
	public String toString() {
		return "ImageMessage [id=" + id + ", user_image=" + user_image + "]";
	}
}
