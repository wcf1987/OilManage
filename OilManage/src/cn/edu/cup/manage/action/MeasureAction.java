package cn.edu.cup.manage.action;

import java.util.List;



import cn.edu.cup.manage.business.Measure;
import cn.edu.cup.manage.dao.PhysicalDao;

import com.opensymphony.xwork2.ActionSupport;

public class MeasureAction extends ActionSupport{
	
	String EName;
	String CName;
	String Symbol;
	String RatioA;
	String RatioB;
	String ID;
	String PhysicalID;
	String StyleID;
	public String getEName() {
		return EName;
	}

	public void setEName(String eName) {
		EName = eName;
	}

	public String getCName() {
		return CName;
	}

	public void setCName(String cName) {
		CName = cName;
	}

	public String getSymbol() {
		return Symbol;
	}

	public void setSymbol(String symbol) {
		Symbol = symbol;
	}

	public String getRatioA() {
		return RatioA;
	}

	public void setRatioA(String ratioA) {
		RatioA = ratioA;
	}

	public String getRatioB() {
		return RatioB;
	}

	public void setRatioB(String ratioB) {
		RatioB = ratioB;
	}

	public String getID() {
		return ID;
	}

	public void setID(String iD) {
		ID = iD;
	}

	public String getPhysicalID() {
		return PhysicalID;
	}

	public void setPhysicalID(String physicalID) {
		PhysicalID = physicalID;
	}

	public String getStyleID() {
		return StyleID;
	}

	public void setStyleID(String styleID) {
		StyleID = styleID;
	}

	public int getId() {
		return id;
	}
	List<Measure> dataList;
	private int page;
	private int records;
	private int rows;
	private int rowNum;
	private int total;


	String re;

	
	public String getRe() {
		return re;
	}

	public void setPage(int page) {
		this.page = page;
	}
	private int id;
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
	public String add(){
		PhysicalDao dao=new PhysicalDao();
		int re=dao.addMessure(this.PhysicalID,this.EName,this.CName,this.Symbol,this.RatioA,this.RatioB,this.StyleID);
		return "SUCCESS";
	}
	public String list(){		
		PhysicalDao dao=new PhysicalDao();
		dataList=dao.getMessureList(page,rows);
		
		
		records=dao.getCountMessure();

		total=records/rows;
		if(records%rows!=0){
			total++;
		}
		return "SUCCESS";
	}
	

	public String delete(){	
	PhysicalDao dao=new PhysicalDao();
	dao.deleteMessure(ID);
	return "SUCCESS";
	}
	public String update(){
		PhysicalDao dao=new PhysicalDao();
		int re=dao.updateMessure(this.ID,this.PhysicalID,this.EName,this.CName,this.Symbol,this.RatioA,this.RatioB,this.StyleID);
	
		return "SUCCESS"; 
	}
	
}
