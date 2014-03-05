package cn.edu.cup.manage.action;

import java.util.List;
import java.util.Set;

import cn.edu.cup.manage.business.Physical;
import cn.edu.cup.manage.dao.PhysicalDao;

import com.opensymphony.xwork2.ActionSupport;

public class PhysicalAction  extends ActionSupport{
	
	PhysicalDao dao=new PhysicalDao();
	List<Physical> dataList;
	private int page;
	private int records;
	private int rows;
	private int rowNum;
	private int total;
	private String sidx;
	private String sord;
	
	String re;
	
	public void setSidx(String sidx) {
		this.sidx = sidx;
	}
	public String getSidx() {
		return sidx;
	}

	public String getSord() {
		return sord;
	}
	public void setSord(String sord) {
		this.sord = sord;
	}
	
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

	public List<Physical> getDataList() {
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
		
		
		

		dataList=dao.getPhysicalList(page,rows,sidx,sord);
	
		records=dao.getCountPhysical();


		total=records/rows;
		if(records%rows!=0){
			total++;
		}
		return "SUCCESS";
	}
	String CName;
	String EName;
	String Description;
	String ISOBasicUnit;
	public String getCName() {
		return CName;
	}

	public void setCName(String cName) {
		CName = cName;
	}

	public String getEName() {
		return EName;
	}

	public void setEName(String eName) {
		EName = eName;
	}

	public String getDescription() {
		return Description;
	}

	public void setDescription(String description) {
		Description = description;
	}

	public String getISOBasicUnit() {
		return ISOBasicUnit;
	}

	public void setISOBasicUnit(String iSOBasicUnit) {
		ISOBasicUnit = iSOBasicUnit;
	}
	String ID;
	public String add(){

		PhysicalDao dao=new PhysicalDao();
		int re=dao.addPhysical(CName, EName, Description, ISOBasicUnit);

		int result=dao.addPhysical(CName, EName, Description, ISOBasicUnit);

		return "SUCCESS";
	}
	public String delete(){
		PhysicalDao dao=new PhysicalDao();
		dao.deletePhysical(ID);
		return "SUCCESS";
	}
	public String update(){
		PhysicalDao dao=new PhysicalDao();
		int re=dao.updatePhysical(ID,CName, EName, Description, ISOBasicUnit);
		return "SUCCESS"; 
	}
	
}
