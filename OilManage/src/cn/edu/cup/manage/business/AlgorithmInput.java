package cn.edu.cup.manage.business;

public class AlgorithmInput {
	String ID;
	String cycleID;
	String ParamID;
	String display;
	String symbol;
	public AlgorithmInput(String id2, String cid, String mid, String display,
			String symbol) {
		// TODO Auto-generated constructor stub
		this.ID=id2;
		this.cycleID=cid;
		this.ParamID=ParamID;
		this.display=display;
		this.symbol=symbol;
	}
	public String getID() {
		return ID;
	}
	public void setID(String iD) {
		ID = iD;
	}
	public String getCycleID() {
		return cycleID;
	}
	public void setCycleID(String cycleID) {
		this.cycleID = cycleID;
	}
	public String getParamID() {
		return ParamID;
	}
	public void setParamID(String paramID) {
		ParamID = paramID;
	}
}
