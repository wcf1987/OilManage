package cn.edu.cup.manage.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;
import cn.edu.cup.file.FileExcel;
import cn.edu.cup.file.FileExcelManager;
import cn.edu.cup.map.business.Graphi;
import cn.edu.cup.map.business.Point;

public class AlgorithmExcelMapAction {

	int algID;

	String msg;
	int proID;
	String InOrOut = "";
	public int getAlgID() {
		return algID;
	}
	public void setAlgID(int algID) {
		this.algID = algID;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public int getProID() {
		return proID;
	}
	public void setProID(int proID) {
		this.proID = proID;
	}
	public String getInOrOut() {
		return InOrOut;
	}
	public void setInOrOut(String inOrOut) {
		InOrOut = inOrOut;
	}
	public Graphi getGraphi() {
		return graphi;
	}
	public void setGraphi(Graphi graphi) {
		this.graphi = graphi;
	}
	private Graphi graphi;
	public String viewExcelMap(){
		if(this.proID==0){
			msg="你需要打开或新建一个工程";
			return "SUCCESS";
		}
		FileExcel excel = FileExcelManager.getFileExcel(this.proID, this.algID, this.InOrOut);
		
		graphi=excel.getGisGraphi();
	
		return "SUCCESS";
	}
	List<Map<String,String>> poly;
	String obsName;
	Map<String,List<Point>> obs;
	public void setPoly(String poly) {
		poly=poly.replace("[", "");
		poly=poly.replace("]", "");
		String[] polys=poly.split(",");
		this.poly=new ArrayList<>();
		Map<String,String> p;
		for(int i=0;i<polys.length;i=i+2){
			 p=new HashMap<>();
			 JSONObject jsonObject2 =JSONObject.fromObject(polys[i]+","+polys[i+1]);
			 String lng=jsonObject2.getString("lng");
			 String lat=jsonObject2.getString("lat");
			 Point temp=new Point();
			 temp.setLatitude(Double.valueOf(lat));
			 temp.setLongitude(Double.valueOf(lng));
			 temp.getGeoFromLatLon();
			 p.put("X坐标 (m)",String.valueOf(temp.getGeodeticCoordinatesX()) );
			 p.put("Y坐标 (m)",String.valueOf(temp.getGeodeticCoordinatesY()) );
			
			//this.poly = null;
			this.poly.add(p); 
		}
		
		 
		
	}
	public String viewObstacle(){
		FileExcel excel = FileExcelManager.getFileExcel(this.proID, this.algID, this.InOrOut);
		
		graphi=excel.getObstacleGraphi();
		obs=excel.getObstacleMap();
		return "SUCCESS";
	}
	public String addObstacle(){
		FileExcel excel = FileExcelManager.getFileExcel(this.proID, this.algID, this.InOrOut);
		excel.getObstacleSheet().addObstacle(this.poly,this.obsName);
		//saveExcel();
		viewObstacle();
		return "SUCCESS";
	}
}
