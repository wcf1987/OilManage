package cn.edu.cup.manage.business;

public class AlgorithmGraphiDetail {
	int id;
	int graphiID;
	int paramID;
	String paramDisplay;
	String paramTypeS;
	String messureShow;
	public AlgorithmGraphiDetail(int id, int graphiID, int paramID,
			String paramDisplay, String paramTypeS, String messureShow) {
		super();
		this.id = id;
		this.graphiID = graphiID;
		this.paramID = paramID;
		this.paramDisplay = paramDisplay;
		this.paramTypeS = paramTypeS;
		this.messureShow = messureShow;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getGraphiID() {
		return graphiID;
	}
	public void setGraphiID(int graphiID) {
		this.graphiID = graphiID;
	}
	public int getParamID() {
		return paramID;
	}
	public void setParamID(int paramID) {
		this.paramID = paramID;
	}
	public String getParamDisplay() {
		return paramDisplay;
	}
	public void setParamDisplay(String paramDisplay) {
		this.paramDisplay = paramDisplay;
	}
	public String getParamTypeS() {
		return paramTypeS;
	}
	public void setParamTypeS(String paramTypeS) {
		this.paramTypeS = paramTypeS;
	}
	public String getMessureShow() {
		return messureShow;
	}
	public void setMessureShow(String messureShow) {
		this.messureShow = messureShow;
	}
	
}
