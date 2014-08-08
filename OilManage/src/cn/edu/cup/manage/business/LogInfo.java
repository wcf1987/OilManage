package cn.edu.cup.manage.business;

import java.util.Date;

public class LogInfo {
	public LogInfo(Date time, String info2) {
		// TODO Auto-generated constructor stub
		 logTime=time;
		 info=info2;
	}
	public Date getLogTime() {
		return logTime;
	}
	public String getInfo() {
		return info;
	}
	Date logTime;
	String info;
}
