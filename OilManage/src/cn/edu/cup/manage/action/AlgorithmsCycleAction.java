package cn.edu.cup.manage.action;

import java.util.Date;
import java.util.List;

import cn.edu.cup.manage.business.AlgorithmsCycle;
import cn.edu.cup.manage.business.Parameters;
import cn.edu.cup.manage.dao.AlgorithmInputDao;
import cn.edu.cup.manage.dao.AlgorithmsCycleDao;
import cn.edu.cup.manage.dao.ParameterDao;

public class AlgorithmsCycleAction {
	String ID;
	String inputID;
	String planID;
	String outputID;
	String authorID;
	String Description;
	Date addDate;
	Date lastUpdateDate;
	List<AlgorithmsCycle> dataList;
	private int page;
	private int records;
	private int rows;
	private int rowNum;
	private int total;
	private String sidx;
	private String sord;
	private List<Integer> ids;
	
	public void setIds(List<Integer> ids) {
		this.ids = ids;
	}
	public List<Integer> getIds() {
		return ids;
	}
	public void setID(String iD) {
		ID = iD;
	}
	public String getID() {
		return ID;
	}
	
	public void setInputID(String inputID) {
		this.inputID = inputID;
	}
	public String getInputID() {
		return inputID;
	}
	
	public void setPlanID(String planID) {
		this.planID = planID;
	}
	public String getPlanID() {
		return planID;
	}
	
	public void setOutputID(String outputID) {
		this.outputID = outputID;
	}
	public String getOutputID() {
		return outputID;
	}
	
	public void setAuthorID(String authorID) {
		this.authorID = authorID;
	}
	public String getAuthorID() {
		return authorID;
	}
	
	public void setDescription(String description) {
		Description = description;
	}
	public String getDescription() {
		return Description;
	}
	
	public void setAddDate(Date addDate) {
		this.addDate = addDate;
	}
	public Date getAddDate() {
		return addDate;
	}
	
	public void setLastUpdateDate(Date lastUpdateDate) {
		this.lastUpdateDate = lastUpdateDate;
	}
	public Date getLastUpdateDate() {
		return lastUpdateDate;
	}
	
	public void setDataList(List<AlgorithmsCycle> dataList) {
		this.dataList = dataList;
	}
	public List<AlgorithmsCycle> getDataList() {
		return dataList;
	}
	
	public void setPage(int page) {
		this.page = page;
	}
	public int getPage() {
		return page;
	}
	
	public void setRecords(int records) {
		this.records = records;
	}
	public int getRecords() {
		return records;
	}
	
	public void setRows(int rows) {
		this.rows = rows;
	}
	public int getRows() {
		return rows;
	}
	
	public void setRowNum(int rowNum) {
		this.rowNum = rowNum;
	}
	public int getRowNum() {
		return rowNum;
	}
	
	public void setTotal(int total) {
		this.total = total;
	}
	public int getTotal() {
		return total;
	}
	
	public void setSidx(String sidx) {
		this.sidx = sidx;
	}
	public String getSidx() {
		return sidx;
	}
	
	public void setSord(String sord) {
		this.sord = sord;
	}
	public String getSord() {
		return sord;
	}
	
	public String list(){		

		AlgorithmsCycleDao dao=new AlgorithmsCycleDao();
		
		
		
		dataList=dao.getAlgorithmsList(page,rows,sidx,sord);
	
		records=dao.getCountAlgorithms();


		total=records/rows;
		if(records%rows!=0){
			total++;
		}
		return "SUCCESS";
	}


	public String add(){

		AlgorithmsCycleDao dao=new AlgorithmsCycleDao();
	
		int result=dao.addAlgorithm(this.Description,this.authorID);
		return "SUCCESS";
	}
	public String delete(){
		AlgorithmsCycleDao dao=new AlgorithmsCycleDao();
		AlgorithmInputDao inputDao=new AlgorithmInputDao();
		if(!ids.isEmpty()){

			for(int id:ids){
				inputDao.deleteAlgorithmByCycle(id);
				dao.deleteAlgorithm(id);
			}
		}
		inputDao.close();
		dao.close();
//		dao.deleteAlgorithm(ID);
		return "SUCCESS";
	}
	public String update(){
		AlgorithmsCycleDao dao=new AlgorithmsCycleDao();
		int re=dao.updateParameter(ID, this.inputID,this.planID, this.outputID,this.Description);
		return "SUCCESS"; 
	}
	
}
