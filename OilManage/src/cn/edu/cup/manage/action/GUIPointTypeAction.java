package cn.edu.cup.manage.action;

import java.util.Arrays;
import java.util.List;

import cn.edu.cup.gui.business.PointProper;
import cn.edu.cup.gui.business.PointType;
import cn.edu.cup.gui.dao.GUIDao;
import cn.edu.cup.manage.business.Parameters;
import cn.edu.cup.manage.dao.GUIPointTypeDao;
import cn.edu.cup.manage.dao.ParameterDao;

public class GUIPointTypeAction {
	private int page;
	private int records;
	private int rows;
	private int rowNum;
	private int total;
	private String sidx;
	private String sord;
	private List<Integer> ids;
	private List<PointType> pointTypeList;

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
	
	public int getID() {
		return ID;
	}
	public void setID(int iD) {
		ID = iD;
	}
	
	public String listPointType(){		

		GUIPointTypeDao dao=new GUIPointTypeDao();
		pointTypeList=dao.getPointTypeList(page,rows,sidx,sord);
		records=dao.getCountPointType();
		if(records!=0&&rows!=0){
			total=records/rows;
			if(records%rows!=0){
				total++;
			}
		}
		dao.close();
		return "SUCCESS";
	}
	int ID;
	String type;
	String remark;
	String path;
	
	public List<PointType> getPointTypeList() {
		return pointTypeList;
	}
	public void setPointTypeList(List<PointType> pointTypeList) {
		this.pointTypeList = pointTypeList;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public String addPointType(){		
		GUIPointTypeDao dao=new GUIPointTypeDao();		
		ID=dao.addType(this.type,this.remark,this.path);
		dao.close();
		return "SUCCESS";
	}
	public String delPointType(){		

		GUIPointTypeDao dao=new GUIPointTypeDao();
		//AlgorithmInputDao inputDao=new AlgorithmInputDao();
		if(!ids.isEmpty()){

			for(int id:ids){
				dao.deleteType(id);
			}
		}
		//inputDao.close();
		dao.close();
//		dao.deleteAlgorithm(ID);
		return "SUCCESS";
	}
}
