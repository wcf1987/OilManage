package cn.edu.cup.manage.action;

import java.util.ArrayList;
import java.util.List;

import net.sf.json.JSONObject;
import cn.edu.cup.file.FileExcel;
import cn.edu.cup.file.FileExcelManager;
import cn.edu.cup.gui.dao.GUIDao;
import cn.edu.cup.manage.business.DeviceKV;
import cn.edu.cup.manage.dao.AlgorithmProDao;
import cn.edu.cup.map.business.Graphi;
import cn.edu.cup.map.business.Line;
import cn.edu.cup.tools.GraphiTools;
import cn.edu.cup.tools.Tools;

public class AlgorithmExcelGraphiAction {
	int algID;

	String msg;
	int proID;
	String InOrOut = "";
	String type;
	String name;
	String proName;
	String YSJLS;
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
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getYSJLS() {
		return YSJLS;
	}
	public void setYSJLS(String ySJLS) {
		YSJLS = ySJLS;
	}
	String JSONData="";
	public String getJSONData() {
		return JSONData;
	}
	private Graphi graphi;
	public Graphi getGraphi() {
		return graphi;
	}
	public String viewGUI(){
		if(this.proID==0){
			msg="你需要打开或新建一个工程";
			return "SUCCESS";
		}
		FileExcel excel = FileExcelManager.getFileExcel(this.proID, this.algID, this.InOrOut);
		GUIDao dao=new GUIDao();
		JSONData=dao.getBlankData();
		dao.close();
		AlgorithmProDao dao1=new AlgorithmProDao();
		this.proName=dao1.getProName(this.proID);
		dao1.close();
		graphi=excel.getGraphi();
		try {
			GraphiTools.updateGraphi(graphi);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			graphi=null;
			e.printStackTrace();
		}
		return "SUCCESS";
	}
	public String addPoint(){
		FileExcel excel = FileExcelManager.getFileExcel(this.proID, this.algID, this.InOrOut);
		
		int row=excel.addPoint(type+"数据",name,YSJLS);
		if (row!=-1){msg="此名称节点已存在";}
		return "SUCCESS";
	}
	public String delPoint(){
		FileExcel excel = FileExcelManager.getFileExcel(this.proID, this.algID, this.InOrOut);
		int row=excel.delPoint(type+"数据",name);
		
		return "SUCCESS";
	}
	List<Line> conn;
	public void setConn(String conns) {
		conns=conns.replace("[", "");
		conns=conns.replace("]", "");
 		this.conn=new ArrayList<Line>();
 		String[] connStr=conns.split(",");
 		try{
 			for(int i=0;i<connStr.length;i=i+3){ 
			
			 JSONObject o =JSONObject.fromObject(connStr[i]+","+connStr[i+1]+","+connStr[i+2]);
		 
			 
			 
			 String left=String.valueOf(o.get("left"));
			 String right=String.valueOf(o.get("right"));
			 String name=String.valueOf(o.get("name"));
			 Line connInfo = new Line(); 
			 connInfo.setStart(left);
			 connInfo.setEnd(right);
			 connInfo.setName(name);
			 this.conn.add(connInfo);
		 }
		 }catch(Exception  e){
			e.printStackTrace(); 
		 }
	}

	public String updateConn(){
		FileExcel excel = FileExcelManager.getFileExcel(this.proID, this.algID, this.InOrOut);
		for(int i=0;i<this.conn.size();i++){
			excel.updateConn(this.conn.get(i));
		}
		return "SUCCESS";
	}
	List<DeviceKV> deviceKV;
	public String listDevice(){
		FileExcel excel = FileExcelManager.getFileExcel(this.proID, this.algID, this.InOrOut);
		if(excel==null){
			return "SUCCESS";
		}
		if(excel.getType(this.algID)==1){
		if(name!=null&&this.InOrOut.equals("In")&&excel!=null){
			deviceKV=excel.getDiviceIn(type+"数据",name);
		}
		if(name!=null&&this.InOrOut.equals("Out")&&excel!=null){
			FileExcel excelIn = FileExcelManager.getFileExcel(this.proID, this.algID, "In");
			
			deviceKV=excel.getDiviceOut(type+"数据",name,excelIn);
		}
		}else{
			if(name!=null&&this.InOrOut.equals("In")&&excel!=null){
				deviceKV=excel.getDiviceOptIn(type+"数据",name);
			}
			if(name!=null&&this.InOrOut.equals("Out")&&excel!=null){
				FileExcel excelIn = FileExcelManager.getFileExcel(this.proID, this.algID, "In");
				
				deviceKV=excel.getDiviceOptOut(type,name,excelIn);
			}	
		}
		return "SUCCESS";
	}
	public List<DeviceKV> getDeviceKV() {
		return deviceKV;
	}
	String newValue;
	String proper;
	public String editDevice(){
		FileExcel excel = FileExcelManager.getFileExcel(this.proID, this.algID, this.InOrOut);
		excel.updateDevice(type+"数据",name,proper,newValue);
		return "SUCCESS";
	}
	public void setProper(String proper) {
		this.proper = proper;
	}
	public List<Line> getConn() {
		return conn;
	}

	public String getNewValue() {
		return newValue;
	}
	public void setNewValue(String newValue) {
		this.newValue = newValue;
	}
	public String getProper() {
		return proper;
	}
	public void setDeviceKV(List<DeviceKV> deviceKV) {
		this.deviceKV = deviceKV;
	}


}
