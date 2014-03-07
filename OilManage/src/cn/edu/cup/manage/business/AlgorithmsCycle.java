package cn.edu.cup.manage.business;

import java.util.Date;

public class AlgorithmsCycle {
	String ID;
	String inputID;
	String planID;
	String outputID;
	String authorID;
	String authorName;
	public String getAuthorName() {
		return authorName;
	}
	public void setAuthorName(String authorName) {
		this.authorName = authorName;
	}
	String Description;
	Date addDate;
	Date lastUpdateDate;
	public AlgorithmsCycle(String id2, String iid, String pid, String oid,
			String aid, String author, String description2, Date addTime,
			Date lastUpdateTime) {
		// TODO Auto-generated constructor stub
		this.ID=id2;
		this.inputID=iid;
		this.planID=pid;
		this.outputID=oid;
		this.authorID=aid;
		this.authorName=author;
		this.Description=description2;
		this.addDate=addTime;
		this.lastUpdateDate=lastUpdateTime;
	}
	public Date getAddDate() {
		return addDate;
	}
	public void setAddDate(Date addDate) {
		this.addDate = addDate;
	}
	public Date getLastUpdateDate() {
		return lastUpdateDate;
	}
	public void setLastUpdateDate(Date lastUpdateDate) {
		this.lastUpdateDate = lastUpdateDate;
	}
	public String getID() {
		return ID;
	}
	public void setID(String iD) {
		ID = iD;
	}
	public String getInputID() {
		return inputID;
	}
	public void setInputID(String inputID) {
		this.inputID = inputID;
	}
	public String getPlanID() {
		return planID;
	}
	public void setPlanID(String planID) {
		this.planID = planID;
	}
	public String getOutputID() {
		return outputID;
	}
	public void setOutputID(String outputID) {
		this.outputID = outputID;
	}
	public String getAuthorID() {
		return authorID;
	}
	public void setAuthorID(String authorID) {
		this.authorID = authorID;
	}
	public String getDescription() {
		return Description;
	}
	public void setDescription(String description) {
		Description = description;
	}
}
