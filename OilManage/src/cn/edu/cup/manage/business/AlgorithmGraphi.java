package cn.edu.cup.manage.business;

public class AlgorithmGraphi {
	public AlgorithmGraphi(int id, int cycleID, int graphiType,
			String graphiName) {
		super();
		this.id = id;
		CycleID = cycleID;
		this.graphiType = graphiType;
		this.graphiTypeS=this.getTypeSByNum(graphiType);
		this.graphiName = graphiName;
	}
	int CycleID;
	int id;
	int graphiType;
	String graphiName;
	public String getGraphiTypeS() {
		return graphiTypeS;
	}
	public void setGraphiTypeS(String graphiTypeS) {
		this.graphiTypeS = graphiTypeS;
	}
	String graphiTypeS;
	public static String getTypeSByNum(int type){
		String typeStr="其他图";
		if(type==0){
			typeStr="线形图";
		}
		if(type==1){
			typeStr="饼图";
		}
		if(type==2){
			typeStr="柱状图";
		}
		if(type==3){
			typeStr="其他图";
		}
		return typeStr;
	}
	public int getCycleID() {
		return CycleID;
	}
	public void setCycleID(int cycleID) {
		CycleID = cycleID;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getGraphiType() {
		return graphiType;
	}
	public void setGraphiType(int graphiType) {
		this.graphiType = graphiType;
	}
	public String getGraphiName() {
		return graphiName;
	}
	public void setGraphiName(String graphiName) {
		this.graphiName = graphiName;
	}
}
