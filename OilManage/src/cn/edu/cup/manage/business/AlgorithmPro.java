package cn.edu.cup.manage.business;

import java.util.Date;

import cn.edu.cup.tools.DateTools;

public class AlgorithmPro {
	int ID;
	String name;
	String ProfileIn;
	String ProfileOut;
	int status;
	String statusS;
	int runtime;
	Date LastCalcEndTime;

	public AlgorithmPro(Integer id2, String proname, Integer aid,
			String author, String description2, Date addTime,
			Date lastCalcTime, Integer calcHisNum, String ProfileIn,
			String ProfileOut, int status, int runtime, Date LastCalcEndTime) {
		// TODO Auto-generated constructor stub
		this.ID = id2;
		this.name = proname;
		this.Pro_input_Num = 0;
		this.authorID = aid;
		this.Author = author;
		this.AddTime = addTime;
		this.AddTimes = DateTools.getStringFromDate(addTime);
		if (lastCalcTime != null) {
			this.LastCalcTime = lastCalcTime;
			this.LastCalcTimes = DateTools.getStringFromDate(lastCalcTime);
		}
		if (calcHisNum != null) {
			this.CalcHisNum = calcHisNum;
		} else {
			this.CalcHisNum = 0;
		}

		if (description2 != null) {
			this.Description = description2;
		}
		this.ProfileIn=ProfileIn;
		this.ProfileOut=ProfileOut;
		this.status=status;
		this.statusS=getStatus(this.status);
		this.runtime=runtime;
		this.LastCalcEndTime=LastCalcEndTime;

	}
	public String getStatusS() {
		return statusS;
	}
	public static String getStatus(int statusi){
		if(statusi==0){
			return "未运行";
		}
		if(statusi==1){
			return "正在运行";
		}
		if(statusi==2){
			return "运行成功";
		}
		if(statusi==3){
			return "运行失败";
		}
		return "运行失败";
	}
	public String getProfileIn() {
		return ProfileIn;
	}

	public String getProfileOut() {
		return ProfileOut;
	}

	public int getStatus() {
		return status;
	}

	public int getRuntime() {
		return runtime;
	}

	public Date getLastCalcEndTime() {
		return LastCalcEndTime;
	}

	public String getAuthor() {
		return Author;
	}

	public void setAuthor(String author) {
		Author = author;
	}

	public Date getAddTime() {
		return AddTime;
	}

	public void setAddTime(Date addTime) {
		AddTime = addTime;
	}

	public String getAddTimes() {
		return AddTimes;
	}

	public void setAddTimes(String addTimes) {
		AddTimes = addTimes;
	}

	public Date getLastCalcTime() {
		return LastCalcTime;
	}

	public void setLastCalcTime(Date lastCalcTime) {
		LastCalcTime = lastCalcTime;
	}

	public String getLastCalcTimes() {
		return LastCalcTimes;
	}

	public void setLastCalcTimes(String lastCalcTimes) {
		LastCalcTimes = lastCalcTimes;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	int Pro_input_Num;
	int authorID;
	String Author;
	Date AddTime;
	String AddTimes;
	Date LastCalcTime;

	public int getID() {
		return ID;
	}

	public void setID(int iD) {
		ID = iD;
	}

	public int getPro_input_Num() {
		return Pro_input_Num;
	}

	public void setPro_input_Num(int pro_input_Num) {
		Pro_input_Num = pro_input_Num;
	}

	public int getAuthorID() {
		return authorID;
	}

	public void setAuthorID(int authorID) {
		this.authorID = authorID;
	}

	public int getCalcHisNum() {
		return CalcHisNum;
	}

	public void setCalcHisNum(int calcHisNum) {
		CalcHisNum = calcHisNum;
	}

	public String getDescription() {
		return Description;
	}

	public void setDescription(String description) {
		Description = description;
	}

	String LastCalcTimes;
	int CalcHisNum;
	String Description;

	public void startCalc() {
		// TODO Auto-generated method stub

	}

}
