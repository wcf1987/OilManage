package cn.edu.cup.gui.action;

import java.util.Date;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import cn.edu.cup.gui.business.GUIConnect;
import cn.edu.cup.gui.business.GUIPoint;
import cn.edu.cup.gui.business.GUIPro;
import cn.edu.cup.gui.dao.GUIDao;
import cn.edu.cup.manage.dao.AlgorithmProDao;
import cn.edu.cup.gui.business.PointValue;
import cn.edu.cup.manage.business.AlgorithmJarPlug;
import cn.edu.cup.manage.business.AlgorithmPro;
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
	GUIPro dataView;
	public String getView(){		

		GUIDao dao=new GUIDao();
		
		
		
		dataView=dao.getGUIProView(this.ID);


		
		return "SUCCESS";
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
	String data;
	List<String> Points;
	List<String> Conns;
	public List<String>  getPoints() {
		return Points;
	}
	public void setPoints(List<String>  points) {
		Points = points;
		this.guiPoints=new LinkedList<GUIPoint>();
		 try{
		 for(int i=0;i<points.size();i++){ 
			 JSONObject jsonObject2 =JSONObject.fromObject(points.get(i)).getJSONObject("attrs");
			 
			 String name=jsonObject2.getString("id");
			 String typename=jsonObject2.getString("name");
			 int type=GUIPoint.getTypeInt(typename);
			 GUIPoint pointInfo = new GUIPoint(name,typename,type); 
			 this.guiPoints.add(pointInfo);
		 }
		 }catch(Exception  e){
			e.printStackTrace(); 
		 }
	}
	public List<String> getConns() {
		return Conns;
	}
	public void setConns(List<String> conns) {
		Conns = conns;
 		this.guiConns=new LinkedList<GUIConnect>();
 		//String temp=conns.get(0).replace("[", "").replace("]", "");
 		JSONArray array =JSONArray.fromObject(conns.get(0));
		 try{
		 for(int i=0;i<array.size();i++){ 
			 Map<String,String> o=(Map<String,String>)array.get(i);
			 
			 
			 String left=String.valueOf(o.get("left"));
			 String right=String.valueOf(o.get("right"));
			 GUIConnect connInfo = new GUIConnect(left,right); 
			 this.guiConns.add(connInfo);
		 }
		 }catch(Exception  e){
			e.printStackTrace(); 
		 }
	}
	public List<GUIPoint> getGuiPoints() {
		return guiPoints;
	}
	
	public List<GUIConnect> getGuiConns() {
		return guiConns;
	}

	List<GUIPoint> guiPoints;
	List<GUIConnect> guiConns;
	
	public String add(){

		GUIDao dao=new GUIDao();

		ID=dao.addPro(this.description,this.name,this.data,new Date(),this.authorID,this.type);
		return "SUCCESS";
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
		Date addDate=new Date();
		int k=dao.updatePro(ID,this.data,addDate);
		
		dao.clearOld(ID);
		for(int i=0;i<guiPoints.size();i++){
			GUIPoint temp=guiPoints.get(i);
			dao.addPoint(ID,temp.getName(),temp.getType(),temp.getTypeName(),addDate);
		}
		for(int i=0;i<guiConns.size();i++){
			GUIConnect temp=guiConns.get(i);
			dao.addConnect(ID,temp.getLeft(),temp.getRight(),addDate);
		}
		dao.close();
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
