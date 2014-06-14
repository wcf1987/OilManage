package cn.edu.cup.manage.action;

import java.util.Arrays;
import java.util.List;

import cn.edu.cup.gui.business.PointProper;
import cn.edu.cup.gui.dao.GUIDao;
import cn.edu.cup.manage.business.Parameters;
import cn.edu.cup.manage.dao.ParameterDao;

public class GUIProperAction {
	private int page;
	private int records;
	private int rows;
	private int rowNum;
	private int total;
	private String sidx;
	private String sord;
	private List<Integer> ids;
	private List<PointProper> pointProperList;
	private List<String> pointTypeDic=Arrays.asList("type1","type2","type3","type4","type5","type6");
	
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
	public List<Integer> getIds() {
		return ids;
	}
	public void setIds(List<Integer> ids) {
		this.ids = ids;
	}
	public List<PointProper> getPointProperList() {
		return pointProperList;
	}
	public void setPointProperList(List<PointProper> pointProperList) {
		this.pointProperList = pointProperList;
	}
	public List<String> getPointTypeDic() {
		return pointTypeDic;
	}
	public void setPointTypeDic(List<String> pointTypeDic) {
		this.pointTypeDic = pointTypeDic;
	}
	public int getID() {
		return ID;
	}
	public void setID(int iD) {
		ID = iD;
	}
	public String getPar_display() {
		return par_display;
	}
	public void setPar_display(String par_display) {
		this.par_display = par_display;
	}
	public String getPar_name() {
		return par_name;
	}
	public void setPar_name(String par_name) {
		this.par_name = par_name;
	}
	public String getMeasure_CName() {
		return measure_CName;
	}
	public void setMeasure_CName(String measure_CName) {
		this.measure_CName = measure_CName;
	}
	public String getMeasure_Symbol() {
		return measure_Symbol;
	}
	public void setMeasure_Symbol(String measure_Symbol) {
		this.measure_Symbol = measure_Symbol;
	}
	public String getPoint_type() {
		return point_type;
	}
	public void setPoint_type(String point_type) {
		this.point_type = point_type;
	}
	public int getMeasure_id() {
		return measure_id;
	}
	public void setMeasure_id(int measure_id) {
		this.measure_id = measure_id;
	}
	public String listPointProper(){		

		GUIDao dao=new GUIDao();
		pointProperList=dao.getPointProperList(page,rows,sidx,sord);
		records=dao.getCountPointProper();
		if(records!=0&&rows!=0){
			total=records/rows;
			if(records%rows!=0){
				total++;
			}
		}
		return "SUCCESS";
	}
	int ID;
	int parID;
	String par_display;
	String par_name;
	String measure_CName;
	String measure_Symbol;
	String point_type;
	int measure_id;
	public int getParID() {
		return parID;
	}
	public void setParID(int parID) {
		this.parID = parID;
	}
	public String addPointProper(){		
		GUIDao dao=new GUIDao();
		ParameterDao dao1=new ParameterDao();
		Parameters p=dao1.searchParameter(this.parID);
		this.par_display=p.getDisplay();
		this.par_name=p.getName();
		this.measure_id=Integer.parseInt(p.getMeasureID());
		ID=dao.addProper(this.point_type,this.par_name,this.par_display,this.measure_id);
		
		return "SUCCESS";
	}
	public String delPointProper(){		

		GUIDao dao=new GUIDao();
		//AlgorithmInputDao inputDao=new AlgorithmInputDao();
		if(!ids.isEmpty()){

			for(int id:ids){
				dao.deleteProper(id);
			}
		}
		//inputDao.close();
		dao.close();
//		dao.deleteAlgorithm(ID);
		return "SUCCESS";
	}
}
