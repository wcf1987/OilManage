package cn.edu.cup.graphi.business;

import java.util.Date;

public class GraphiProjects {
	Integer id ;
	String proName;
	Integer authorID;
	String authorName;
	Date CreateTime;
	Date ModifyTime;
	public GraphiProjects(Integer id, String proName, Integer authorID,
			String authorName, Date createTime, Date modifyTime) {
		super();
		this.id = id;
		this.proName = proName;
		this.authorID = authorID;
		this.authorName = authorName;
		CreateTime = createTime;
		ModifyTime = modifyTime;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getProName() {
		return proName;
	}
	public void setProName(String proName) {
		this.proName = proName;
	}
	public Integer getAuthorID() {
		return authorID;
	}
	public void setAuthorID(Integer authorID) {
		this.authorID = authorID;
	}
	public String getAuthorName() {
		return authorName;
	}
	public void setAuthorName(String authorName) {
		this.authorName = authorName;
	}
	public Date getCreateTime() {
		return CreateTime;
	}
	public void setCreateTime(Date createTime) {
		CreateTime = createTime;
	}
	public Date getModifyTime() {
		return ModifyTime;
	}
	public void setModifyTime(Date modifyTime) {
		ModifyTime = modifyTime;
	}
}
