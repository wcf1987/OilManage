package cn.edu.cup.manage.action;

import java.util.List;

import cn.edu.cup.manage.business.AlgorithmOutput;
import cn.edu.cup.manage.dao.AlgorithmInputDao;
import cn.edu.cup.manage.dao.AlgorithmOutputDao;

public class AlgorithmOutputAction {
	List<AlgorithmOutput> dataList;
	private List<Integer> ids;
	
	public List<Integer> getIds() {
		return ids;
	}
	public void setIds(List<Integer> ids) {
		this.ids = ids;
	}
	int ID;
	int CycleID;
	int ParamID;
	String symbol;
	String display;
	public void setSymbol(String symbol) {
		this.symbol = symbol;
	}
	public String getSymbol() {
		return symbol;
	}
	public void setDisplay(String display) {
		this.display = display;
	}
	public String getDisplay() {
		return display;
	}
	public List<AlgorithmOutput> getDataList() {
		return dataList;
	}


	public void setDataList(List<AlgorithmOutput> dataList) {
		this.dataList = dataList;
	}


	public int getID() {
		return ID;
	}


	public void setID(int iD) {
		ID = iD;
	}


	public int getCycleID() {
		return CycleID;
	}


	public void setCycleID(int cycleID) {
		CycleID = cycleID;
	}


	public int getParamID() {
		return ParamID;
	}


	public void setParamID(int paramID) {
		ParamID = paramID;
	}


	public int getPage() {
		return page;
	}


	public void setPage(int page) {
		this.page = page;
	}


	public int getRecords() {
		return records;
	}


	public void setRecords(int records) {
		this.records = records;
	}


	public int getRows() {
		return rows;
	}


	public void setRows(int rows) {
		this.rows = rows;
	}


	public int getRowNum() {
		return rowNum;
	}


	public void setRowNum(int rowNum) {
		this.rowNum = rowNum;
	}


	public int getTotal() {
		return total;
	}


	public void setTotal(int total) {
		this.total = total;
	}


	public String getSidx() {
		return sidx;
	}


	public void setSidx(String sidx) {
		this.sidx = sidx;
	}


	public String getSord() {
		return sord;
	}


	public void setSord(String sord) {
		this.sord = sord;
	}
	private int page;
	private int records;
	private int rows;
	private int rowNum;
	private int total;
	private String sidx;
	private String sord;

	
	public String list(){		

		AlgorithmOutputDao dao=new AlgorithmOutputDao();
		
		
		
		dataList=dao.getAlgorithmOutputList(page,rows,sidx,sord,CycleID);
	
		records=dao.getCountAlgorithms();

		if(rows!=0&&records!=0){
			total=records/rows;
			if(records%rows!=0){
				total++;
			}
		}
		return "SUCCESS";
	}


	public String add(){

		AlgorithmOutputDao dao=new AlgorithmOutputDao();
	
		if(!ids.isEmpty()){

			for(int id:ids){
				dao.addAlgorithm(this.CycleID,id);
			}
		}
		dao.close();
		
//		int result=dao.addAlgorithm(this.CycleID,this.ParamID);
		return "SUCCESS";
	}
	public String delete(){
		AlgorithmOutputDao dao=new AlgorithmOutputDao();
		dao.deleteAlgorithm(ID);
		return "SUCCESS";
	}
	public String update(){
		AlgorithmOutputDao dao=new AlgorithmOutputDao();
		int re=dao.updateParameter(ID, this.CycleID,this.ParamID);
		return "SUCCESS"; 
	}
}
