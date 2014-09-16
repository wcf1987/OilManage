package cn.edu.cup.manage.action;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import net.sf.json.JSONObject;
import cn.edu.cup.file.ColModel;
import cn.edu.cup.file.FileExcel;
import cn.edu.cup.file.SheetContent;
import cn.edu.cup.gui.dao.GUIDao;
import cn.edu.cup.manage.business.AlgorithmsCycle;
import cn.edu.cup.manage.business.DeviceKV;
import cn.edu.cup.manage.dao.AlgorithmProDao;
import cn.edu.cup.manage.dao.AlgorithmsCycleDao;
import cn.edu.cup.map.business.Graphi;
import cn.edu.cup.map.business.Line;
import cn.edu.cup.map.business.Point;
import cn.edu.cup.tools.GraphiTools;
import cn.edu.cup.tools.Tools;

public class AlgorithmExcelAction {
	
	public static String ExcelAlgBaseDir = "ExcelFrame/";
	public static String ExcelProBaseDir = "ExcelProject/";
	public static String AlgBaseDir = "uploadAlgorithm/";
	public static String uploadTemp = "uploadTemp/";
	int algID;
	int sheetID;
	int proID;
	String proName;
	private int page;

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	private int records;
	private int rows;
	private int rowNum;
	private int total;

	public void setProID(int proID) {
		this.proID = proID;
	}

	private File excelImport;
	private String excelImportFile;
	private String excelImportFileName;

	public void setExcelImport(File excelImport) {
		this.excelImport = excelImport;
	}

	public void setExcelImportFile(String excelImportFile) {
		this.excelImportFile = excelImportFile;
	}

	public void setExcelImportFileName(String excelImportFileName) {
		this.excelImportFileName = excelImportFileName;
	}

	public String uploadExcel() {
		FileExcel excel = getFileExcel(this.proID, this.algID, this.InOrOut);// 从缓存或者文件里面读取excel内容

		FileExcel importExcle = new FileExcel();
		String fileTemp = uploadTemp
				+ excelImport.getName().substring(0,
						excelImport.getName().lastIndexOf(".")) + ".xls";
		try {
			Tools.copyFile(excelImport, new File(Tools.getWebRoot() + fileTemp));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			msg = "上传失败";
			return "SUCCESS";
		}
		int status = importExcle.readExcel(this.proID, this.algID,
				this.InOrOut, fileTemp);
		excel.coverFromImport(importExcle);
		//putFileExcel(excel);// excel放到缓存里
		saveExcel();// 保存到文件
		return "SUCCESS";
	}
	public  static final Map<String, FileExcel> cacheList= new ConcurrentHashMap <String, FileExcel>();
	public FileExcel getFileExcel(int proid, int algid, String InOrOut) {
		/*ActionContext actionContext = ActionContext.getContext();
		Map session = actionContext.getSession();
		Map<String, FileExcel> cacheList = (Map<String, FileExcel>) session
				.get("ExcelCacheList");

		if (cacheList == null) {
			cacheList = new HashMap<String, FileExcel>();
			// session.put("ExcelCacheList", cacheList);

		}*/
		String key = Tools.createKeyFromProAndALg(proid, algid, InOrOut);
		FileExcel excel = cacheList.get(key);
		if (excel != null) {// 先从缓存读取excel
			return excel;
		}

		AlgorithmProDao dao = new AlgorithmProDao();

		String filepath = dao.getProFile(this.proID, algid, InOrOut);// 缓存没有，则从项目路径寻找excel文件
		dao.close();
		if (filepath == null || filepath.equals("")) {
			msg = "Excel文件未找到";
			return null;
		}
		excel = new FileExcel();
		int status = excel.readExcel(this.proID, algid, InOrOut,
				ExcelProBaseDir + filepath);
		if (status == -1) {
			msg = excel.getMsg();
			return null;
		}
		cacheList.put(key, excel);
		//session.put("ExcelCacheList", cacheList);
		return excel;

	}
	private FileExcel getFileExcelTitle(int algid,
			String inOrOut2, String file) {
		String key = Tools.createKeyFromProAndALg(algid,InOrOut);
		FileExcel excel = cacheList.get(key);
		if (excel != null) {// 先从缓存读取excel
			return excel;
		}
		
		excel = new FileExcel();
		int status = excel.readExcel(0, algid, InOrOut,
				file);
		if (status == -1) {
			msg = excel.getMsg();
			return null;
		}
		cacheList.put(key, excel);
		//session.put("ExcelCacheList", cacheList);
		return excel;
	}
	public FileExcel reloadFileExcel(int proid, int algid, String InOrOut) {
		
		String key = Tools.createKeyFromProAndALg(proid, algid, InOrOut);
		FileExcel excel;

		AlgorithmProDao dao = new AlgorithmProDao();

		String filepath = dao.getProFile(proid, algid, InOrOut);
		dao.close();
		if (filepath == null || filepath.equals("")) {
			msg = "Excel文件未找到";
			return null;
		}
		excel = new FileExcel();
		int status = excel.readExcel(this.proID, algid, InOrOut,
				ExcelProBaseDir + filepath);
		if (status == -1) {
			msg = excel.getMsg();
			return null;
		}
		cacheList.put(key, excel);
		//session.put("ExcelCacheList", cacheList);
		return excel;

	}

	public String saveExcel() {//保存到文件
		FileExcel excel = getFileExcel(this.proID, this.algID, this.InOrOut);
		int re = excel.saveExcel();
		if (re == -1) {
			msg = "保存失败，请检查数据结构";
		}
		reloadFileExcel(this.proID, this.algID, this.InOrOut);
		return "SUCCESS";
	}

	public FileExcel putFileExcel(FileExcel e) {// 将excel内容放入缓存
		

		//String key = Tools.createKeyFromProAndALg(e.getProID(), e.getAlgID(),
		//		e.getInOrOut());
		//cacheList.put(key, e);
		//session.put("ExcelCacheList", cacheList);
		return e;
	}
	private Graphi graphi;
	public Graphi getGraphi() {
		return graphi;
	}

	public String viewExcelMap(){
		FileExcel excel = getFileExcel(this.proID, this.algID, this.InOrOut);
		
		graphi=excel.getGraphi();
	
		return "SUCCESS";
	}
	String JSONData="";
	public String getJSONData() {
		return JSONData;
	}

	public String viewGUI(){
		FileExcel excel = getFileExcel(this.proID, this.algID, this.InOrOut);
		GUIDao dao=new GUIDao();
		JSONData=dao.getBlankData();
		dao.close();
		AlgorithmProDao dao1=new AlgorithmProDao();
		this.proName=dao1.getProName(this.proID);
		dao1.close();
		graphi=excel.getGraphi();
		GraphiTools.updateGraphi(graphi);
		return "SUCCESS";
	}
	String type;
	String name;
	public String addPoint(){
		FileExcel excel = getFileExcel(this.proID, this.algID, this.InOrOut);
		int row=excel.addPoint(type+"数据",name);
		if (row!=-1){msg="此名称节点已存在";}
		return "SUCCESS";
	}
	public String delPoint(){
		FileExcel excel = getFileExcel(this.proID, this.algID, this.InOrOut);
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
		FileExcel excel = getFileExcel(this.proID, this.algID, this.InOrOut);
		for(int i=0;i<this.conn.size();i++){
			excel.updateConn(this.conn.get(i));
		}
		return "SUCCESS";
	}
	List<DeviceKV> deviceKV;
	public String listDevice(){
		FileExcel excel = getFileExcel(this.proID, this.algID, this.InOrOut);
		if(name!=null){
		deviceKV=excel.getDevice(type+"数据",name);
		}
		return "SUCCESS";
	}
	public List<DeviceKV> getDeviceKV() {
		return deviceKV;
	}

	String proper;
	public String editDevice(){
		FileExcel excel = getFileExcel(this.proID, this.algID, this.InOrOut);
		excel.updateDevice(type+"数据",name,proper,newValue);
		return "SUCCESS";
	}
	public void setProper(String proper) {
		this.proper = proper;
	}

	public void setType(String type) {
		this.type = type;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getProName() {
		return proName;
	}

	Map<String,List<Point>> obs;
	public String viewObstacle(){
		FileExcel excel = getFileExcel(this.proID, this.algID, this.InOrOut);
		
		graphi=excel.getObstacleGraphi();
		obs=excel.getObstacleMap();
		return "SUCCESS";
	}
	List<Map<String,String>> poly;
	String obsName;
	public void setObsName(String obsName) {
		this.obsName = obsName;
	}

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

	public String addObstacle(){
		FileExcel excel = getFileExcel(this.proID, this.algID, this.InOrOut);
		excel.getObstacleSheet().addObstacle(this.poly,this.obsName);
		saveExcel();
		return "SUCCESS";
	}
	public Map<String, List<Point>> getObs() {
		return obs;
	}

	String msg;
	List<String> sheetTile;
	List<ColModel> colModel;
	List<Map<String, String>> content;
	SheetContent sheetContent;
	private List<Integer> ids;

	public void setIds(List<Integer> ids) {
		this.ids = ids;
	}

	public List<Integer> getIds() {
		return ids;
	}

	String sheetName;
	int Index_ID;
	int col_ID;
	String newValue;
	String status = "success";
	String InOrOut = "";

	public String getInOrOut() {
		return InOrOut;
	}

	public void setInOrOut(String inOrOut) {
		InOrOut = inOrOut;
	}

	public String getStatus() {
		return status;
	}

	public void setIndex_ID(int index_ID) {
		Index_ID = index_ID;
	}

	public void setCol_ID(int col_ID) {
		this.col_ID = col_ID;
	}

	public void setNewValue(String newValue) {
		this.newValue = newValue;
	}

	public String addSheetContent() {
		FileExcel excel = getFileExcel(this.proID, this.algID, this.InOrOut);
		SheetContent sheet = excel.getSheetByID(sheetID);
		sheet.addRow(this.postMap);
		//putFileExcel(excel);
		return "SUCCESS";
	}

	public String editSheetContent() {
		FileExcel excel = getFileExcel(this.proID, this.algID, this.InOrOut);
		SheetContent sheet = excel.getSheetByID(sheetID);
		sheet.editCell(Index_ID, col_ID, newValue);
		//putFileExcel(excel);
		return "SUCCESS";
	}

	Map<String, String> postMap;

	public void setPostMap(String postMap) {
		JSONObject jsonObject2 = JSONObject.fromObject(postMap);
		this.postMap = new HashMap<String, String>();
		for (Iterator<String> iter = jsonObject2.keySet().iterator(); iter
				.hasNext();) {
			String key = iter.next();
			this.postMap.put(key, jsonObject2.getString(key));
		}
	}

	public String delSheetContent() {
		FileExcel excel = getFileExcel(this.proID, this.algID, this.InOrOut);
		if (!ids.isEmpty()) {

			for (int id : ids) {

				excel.getSheetByID(sheetID).removeRow(id);
			}
		}
		excel.getSheetByID(sheetID).updateSheet();
		//putFileExcel(excel);
		return "SUCCESS";
	}

	public static void main(String args[]) {
		// new AlgorithmExcelAction().saveExcel();
	}

	public String listSheetContent() {

		FileExcel excel = getFileExcel(this.proID, this.algID, this.InOrOut);
		if (excel == null) {
			return "SUCCESS";
		}
		if (sheetID >= excel.getSheetNum()) {
			msg = "请求的参数页面超出范围";
			return "SUCCESS";
		}
		sheetContent = excel.getSheetByID(sheetID);//获取第sheetID个sheet
		records = sheetContent.getSize()-1;
		sheetContent.buildContent(page, rows);
		content = sheetContent.getContent();

		total = records / rows;
		if (records % rows != 0) {
			total++;
		}
		//putFileExcel(excel);
		return "SUCCESS";
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

	public List<Map<String, String>> getContent() {
		return content;
	}

	public String listSheetTitle() {

		AlgorithmsCycleDao dao = new AlgorithmsCycleDao();

		AlgorithmsCycle p = dao.getAlgorithmDetail(this.algID);
		//FileExcel excel = new FileExcel();
		String path = "";
		if (this.InOrOut.equals("In")) {
			path = p.getStructFileIn();
		} else {
			path = p.getStructFileOut();
		}
		FileExcel excel = getFileExcelTitle(this.algID, this.InOrOut,ExcelAlgBaseDir + path);
		
		//int status = excel.readExcel(this.proID, this.algID, this.InOrOut,
		//		ExcelAlgBaseDir + path);
		int status=1;
		if (status == -1) {
			msg = excel.getMsg();
			return "SUCCESS";
		}
		if(sheetID>=excel.getSheetNum()){
			msg="数据sheet数量过多，超过模板";
			return "SUCCESS";
		}
		sheetTile = excel.getSheetByID(sheetID).getTitle();
		sheetName = excel.getSheetByID(sheetID).getName();
		colModel = excel.getSheetByID(sheetID).getColModel();
		dao.close();
		return "SUCCESS";
	}



	public String getSheetName() {
		return sheetName;
	}

	public List<ColModel> getColModel() {
		return colModel;
	}

	public String getMsg() {
		return msg;
	}

	public List<String> getSheetTile() {
		return sheetTile;
	}

	public void setAlgID(int algID) {
		this.algID = algID;
	}

	public void setSheetID(int sheetID) {
		this.sheetID = sheetID;
	}
	String filePath;
	public String exportFile(){
		FileExcel excel = getFileExcel(this.proID, this.algID, this.InOrOut);
		filePath=excel.getFileName();
		return "SUCCESS";
	}

	public String getFilePath() {
		return filePath;
	}
}
