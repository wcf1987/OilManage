package cn.edu.cup.manage.action;

import java.util.List;



import cn.edu.cup.manage.business.Measure;
import cn.edu.cup.manage.dao.PhysicalDao;

import com.opensymphony.xwork2.ActionSupport;

public class MeasureAction extends ActionSupport{
	
	
	List<Measure> dataList;
	private int page;
	private int records;
	private int rows;
	private int rowNum;
	private int total;
	private String sidx;
	private String sord;
	private int id;
	
	public void setSidx(String sidx){
		this.sidx=sidx;
	}
	public String getSidx(String sidx){
		return sidx;
	}
	
	public void setSord(String sord){
		this.sord=sord;
	}
	public String getSord(String sord){
		return sord;
	}
	
	public void setPage(int page) {
		this.page = page;
	}
	
	public void setId(int id) {
		this.id = id;
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

	public int getPage(){
		return page;
	}
	

	
	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public List<Measure> getDataList() {
		return dataList;
	}

	public int getRecords() {
		return records;
	}


	public String execute(){
		
		return "SUCCESS";
	}
	
	public String list(){		
		PhysicalDao dao=new PhysicalDao();
		dataList=dao.getMessureList(page,rows,sidx,sord);
		
		
		records=dao.getCountMessure();

		total=records/rows;
		if(records%rows!=0){
			total++;
		}
		return "SUCCESS";
	}
	
	public String add(){
		return "SUCCESS";
	}
	public String delete(){
		return "SUCCESS";
	}
	public String update(){
		return "SUCCESS"; 
	}
	
}
