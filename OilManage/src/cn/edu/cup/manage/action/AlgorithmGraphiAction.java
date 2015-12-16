package cn.edu.cup.manage.action;

import java.util.List;

import cn.edu.cup.manage.business.AlgorithmGraphi;
import cn.edu.cup.manage.business.AlgorithmGraphiDetail;
import cn.edu.cup.manage.dao.AlgorithmGraphiDao;

public class AlgorithmGraphiAction {
	int CycleID;
	List<AlgorithmGraphi> listGraphi;
	
	List<AlgorithmGraphiDetail> listGraphiDetail;
	private int DetailId;
	private int page;
	private int records;
	private int rows;
	private int rowNum;
	private int total;
	private String sidx;
	private String sord;
	private int GraphiID;
	
	private int graphiType;
	private String graphiName;
	private int paramID;
	public String listGraphiByAlgID(){		

		AlgorithmGraphiDao dao=new AlgorithmGraphiDao();
		
		listGraphi=dao.getAlgGraphiList(this.CycleID);
		
		records=dao.getCountAlgGraphi(this.CycleID);

		if(records!=0&&rows!=0){
			total=records/rows;
			if(records%rows!=0){
				total++;
			}
		}

		dao.close();
		return "SUCCESS";
	}
	private List<Integer> ids;
	public String listGraphiDetailByGraphID(){		

		AlgorithmGraphiDao dao=new AlgorithmGraphiDao();
		
		listGraphiDetail=dao.getAlgGraphiDetailList(this.GraphiID);
		
		records=dao.getCountAlgGraphiDetail(this.GraphiID);

		if(records!=0&&rows!=0){
			total=records/rows;
			if(records%rows!=0){
				total++;
			}
		}


		dao.close();
		return "SUCCESS";
	}
	
	public String  addGraphi(){
		AlgorithmGraphiDao dao=new AlgorithmGraphiDao();

		int re=dao.addAlgGraphi(this.CycleID,this.graphiName,this.graphiType);
		dao.close();
		return "SUCCESS";
	}
	public String  addGraphiDetail(){
		AlgorithmGraphiDao dao=new AlgorithmGraphiDao();
		error="";
		if(dao.checkExists(this.GraphiID,this.paramID)){
			dao.close();
			error="已经添加过，一幅图中一个参数只能出现一次";
			return "SUCCESS";
		}
		if(dao.checkXExists(this.GraphiID,this.paramID,this.info1)){
			dao.close();
			error="已经添加过，一幅图中X轴只有一个";
			return "SUCCESS";
		}
		int re=dao.addAlgGraphiDetail(this.GraphiID,this.paramID,this.info1,this.info2);
		dao.close();
		return "SUCCESS";
	}
	public String getError() {
		return error;
	}
	String error;
	String info1;
	String info2;
	public String getInfo1() {
		return info1;
	}

	public void setInfo1(String info1) {
		this.info1 = info1;
	}

	public String getInfo2() {
		return info2;
	}

	public void setInfo2(String info2) {
		this.info2 = info2;
	}

	public String  delGraphi(){
		AlgorithmGraphiDao dao=new AlgorithmGraphiDao();
		if(!ids.isEmpty()){

			for(int id:ids){				
				dao.delAlgGraphi(id);
			}
		}
		
		dao.close();
		return "SUCCESS";
	}
	public List<Integer> getIds() {
		return ids;
	}

	public void setIds(List<Integer> ids) {
		this.ids = ids;
	}

	public String  delGraphiDetail(){
		AlgorithmGraphiDao dao=new AlgorithmGraphiDao();
		if(!ids.isEmpty()){

			for(int id:ids){				
				dao.delAlgGraphiDetail(id);
			}
		}
		
		
		dao.close();
		return "SUCCESS";
	}
	
	public String  updateGraphi(){
		AlgorithmGraphiDao dao=new AlgorithmGraphiDao();

		int re=dao.updateAlgGraphi(this.GraphiID,this.graphiName);
		dao.close();
		return "SUCCESS";
	}

	public int getCycleID() {
		return CycleID;
	}
	public void setCycleID(int cycleID) {
		CycleID = cycleID;
	}
	public List<AlgorithmGraphi> getListGraphi() {
		return listGraphi;
	}
	public void setListGraphi(List<AlgorithmGraphi> listGraphi) {
		this.listGraphi = listGraphi;
	}
	public List<AlgorithmGraphiDetail> getListGraphiDetail() {
		return listGraphiDetail;
	}
	public void setListGraphiDetail(List<AlgorithmGraphiDetail> listGraphiDetail) {
		this.listGraphiDetail = listGraphiDetail;
	}
	public int getDetailId() {
		return DetailId;
	}
	public void setDetailId(int detailId) {
		DetailId = detailId;
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
	public int getGraphiID() {
		return GraphiID;
	}
	public void setGraphiID(int graphiID) {
		GraphiID = graphiID;
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
	public int getParamID() {
		return paramID;
	}
	public void setParamID(int paramID) {
		this.paramID = paramID;
	}

}
