package cn.edu.cup.gui.business;

public class PointType {
	int ID;
	String type;
	String path;
	String remark;
	public PointType(int iD, String type, String path, String remark) {
		super();
		ID = iD;
		this.type = type;
		this.path = path;
		this.remark = remark;
	}
	public int getID() {
		return ID;
	}
	public void setID(int iD) {
		ID = iD;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	



	
}
