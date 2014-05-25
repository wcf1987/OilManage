package cn.edu.cup.gui.action;

import java.util.Date;
import java.util.List;

import cn.edu.cup.gui.business.GUIPro;
import cn.edu.cup.gui.business.PointValue;
import cn.edu.cup.gui.dao.GUIDao;
import cn.edu.cup.manage.business.AlgorithmJarPlug;
import cn.edu.cup.manage.business.AlgorithmPro;
import cn.edu.cup.manage.dao.AlgorithmProDao;
import cn.edu.cup.tools.JarTools;

public class GUIAction {
	GUIPro dataView;
	int ID;
	int authorID;
	String description;
	Date addDate;
	String name;
	List<GUIPro> dataList;
	
	String oper;
	int pointID;
	int pointPraID;
	double par_value;
	List<PointValue> pointPraList;
	String data;
	int type;
	private int page;
	private int records;
	private int rows;
	private int rowNum;
	private int total;
	private String sidx;
	private String sord;
	private List<Integer> ids;
	
	public int getPointPraID() {
		return pointPraID;
	}
	public void setPointPraID(int pointPraID) {
		this.pointPraID = pointPraID;
	}
	public double getPar_value() {
		return par_value;
	}
	public void setPar_value(double par_value) {
		this.par_value = par_value;
	}
	public int getPointID() {
		return pointID;
	}
	public void setPointID(int pointID) {
		this.pointID = pointID;
	}
	public List<PointValue> getPointPraList() {
		return pointPraList;
	}
	public void setPointPraList(List<PointValue> pointPraList) {
		this.pointPraList = pointPraList;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setIds(List<Integer> ids) {
		this.ids = ids;
	}
	public List<Integer> getIds() {
		return ids;
	}
	public void setID(int iD) {
		ID = iD;
	}
	public int getID() {
		return ID;
	}
	
	public void setDescription(String description) {
		this.description = description;
	}
	public String getDescription() {
		return description;
	}
	
	public void setAddDate(Date addDate) {
		this.addDate = addDate;
	}
	public Date getAddDate() {
		return addDate;
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
	public int getAuthorID() {
		return authorID;
	}
	public void setAuthorID(int authorID) {
		this.authorID = authorID;
	}
	public String getName() {
		return name;
	}
	public List<GUIPro> getDataList() {
		return dataList;
	}
	public void setDataList(List<GUIPro> dataList) {
		this.dataList = dataList;
	}
	public GUIPro getDataView() {
		return dataView;
	}
	public void setDataView(GUIPro dataView) {
		this.dataView = dataView;
	}
	public String getData() {
		return data;
	}
	public void setData(String data) {
		this.data = data;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	
	public String getView(){		

		GUIDao dao=new GUIDao();
		dataView=dao.getGUIProView(this.ID);	
		return "SUCCESS";
	}

	public String list(){		

		GUIDao dao=new GUIDao();
		dataList=dao.getGUIProsList(page,rows,sidx,sord);
		records=dao.getCountGUIPros();
		total=records/rows;
		if(records%rows!=0){
			total++;
		}
		return "SUCCESS";
	}


	public String add(){

		GUIDao dao=new GUIDao();

		ID=dao.addPro(this.description,this.name,this.data,new Date(),this.authorID,this.type);
		return "SUCCESS";
	}

	public String delete(){
		GUIDao dao=new GUIDao();
		//AlgorithmInputDao inputDao=new AlgorithmInputDao();
		if(!ids.isEmpty()){

			for(int id:ids){
				
				dao.deletePro(id);
			}
		}
		//inputDao.close();
		dao.close();
//		dao.deleteAlgorithm(ID);
		return "SUCCESS";
	}
	public String update(){
		GUIDao dao=new GUIDao();
		int re=dao.updatePro(ID,this.data);
		return "SUCCESS"; 
	}
	public String searchProAlg(){
		AlgorithmProDao dao=new AlgorithmProDao();
		//this.algID=dao.searchProAlg(this.ID);
		return "SUCCESS";
	}
	public String selectAlg(){
		AlgorithmProDao dao=new AlgorithmProDao();
		//int re=dao.addAlgorithm(this.ID,this.algID);
		return "SUCCESS";
	}
	
	/*
	 * 点的属性
	 */
	public String listPointPra(){		

		GUIDao dao=new GUIDao();
		pointPraList=dao.getPointPraList(pointID,page,rows,sidx,sord);
		records=dao.getCountPointPras(pointID);
		total=records/rows;
		if(records%rows!=0){
			total++;
		}
		return "SUCCESS";
	}
	public String updatePointPra(){
		GUIDao dao=new GUIDao();
		int re=dao.updatePointPra(ID,this.par_value);
		return "SUCCESS"; 
	}

}
