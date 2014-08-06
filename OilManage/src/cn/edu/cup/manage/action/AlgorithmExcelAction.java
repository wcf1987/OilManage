package cn.edu.cup.manage.action;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;
import cn.edu.cup.file.ColModel;
import cn.edu.cup.file.FileExcel;
import cn.edu.cup.file.SheetContent;
import cn.edu.cup.manage.business.AlgorithmsCycle;
import cn.edu.cup.manage.dao.AlgorithmProDao;
import cn.edu.cup.manage.dao.AlgorithmsCycleDao;
import cn.edu.cup.tools.Tools;

import com.opensymphony.xwork2.ActionContext;

public class AlgorithmExcelAction {
	private static String ExcelAlgBaseDir="ExcelFrame\\";
	private static String ExcelProBaseDir="ExcelProject\\";
	int algID;
	int sheetID;
	int proID;
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
	
	public FileExcel getFileExcel(int proid,int algid){
		ActionContext actionContext = ActionContext.getContext();
        Map session = actionContext.getSession();
        Map<String,FileExcel> cacheList=(Map<String,FileExcel>)session.get("ExcelCacheList");
       
        if(cacheList==null){
        	cacheList=new HashMap<String,FileExcel>();
        	//session.put("ExcelCacheList", cacheList);
        	
        }
      String key=Tools.createKeyFromProAndALg(proid,algid);
        FileExcel excel=cacheList.get(key);
        if(excel!=null){
        		return excel;
        	}
              
			
    		AlgorithmProDao dao=new AlgorithmProDao();
    		
    		String  filepath=dao.getProFile(this.proID,algid);
    		dao.close();
    		if (filepath==null ||filepath.equals("")){
    			return null;
    		}
    		excel=new FileExcel();
    		int status=excel.readExcel(this.proID,ExcelProBaseDir+filepath);
    		if(status==-1){
    			msg=excel.getMsg();
    			return null;
    		}
    		cacheList.put(key,excel);
    		session.put("ExcelCacheList",cacheList);
    		return excel;
    		
	}
	public String saveExcel(){
		FileExcel excel=getFileExcel(this.proID,this.algID);
		int re=excel.saveExcel();
		if(re==-1){
			msg="保存失败，请检查数据结构";
		}
		return "SUCCESS";
	}
	public FileExcel putFileExcel(FileExcel e){
		ActionContext actionContext = ActionContext.getContext();
        Map session = actionContext.getSession();
        Map<Integer,FileExcel> cacheList=(Map<Integer,FileExcel>)session.get("ExcelCacheList");
        cacheList.put(e.getProID(),e);
        session.put("ExcelCacheList",cacheList);
        return e;
	}
	String msg;
	List<String> sheetTile;
	List<ColModel> colModel;
	List<Map<String,String>> content;
	SheetContent sheetContent;
	private List<Integer> ids;
	public void setIds(List<Integer> ids) {
		this.ids = ids;
	}

	public List<Integer> getIds() {
		return ids;
	}
	String sheetName;
	int 	Index_ID;				
	int col_ID;
	String newValue;
	String status="success";
	public String getStatus() {
		return status;
	}
	public void setIndex_ID(int index_ID) {
		Index_ID = index_ID;
	}
	public void setIndex_ID(String index_ID) {
		Index_ID = 0;
	}
	public void setCol_ID(int col_ID) {
		this.col_ID = col_ID;
	}
	public void setNewValue(String newValue) {
		this.newValue = newValue;
	}
	public String addSheetContent(){
		FileExcel excel=getFileExcel(this.proID,this.algID);
		SheetContent sheet=excel.getSheetByID(sheetID);
		sheet.addRow(this.postMap);
		return "SUCCESS";
	}
	public String editSheetContent(){
		FileExcel excel=getFileExcel(this.proID,this.algID);
		SheetContent sheet=excel.getSheetByID(sheetID);
		sheet.editCell(Index_ID,col_ID,newValue);
		
		return "SUCCESS";
	}
	Map<String,String> postMap;
	public void setPostMap(String postMap) {
		JSONObject jsonObject2 =JSONObject.fromObject(postMap);
		this.postMap=new HashMap<String, String>();
		for(Iterator<String> iter = jsonObject2.keySet().iterator();iter.hasNext();)
		{ 
			String key=iter.next();
		this.postMap.put(key, jsonObject2.getString(key));
		}
	}
	public String delSheetContent(){
		FileExcel excel=getFileExcel(this.proID,this.algID);
		if (!ids.isEmpty()) {

			for (int id : ids) {
				
				excel.getSheetByID(sheetID).removeRow(id);
			}
		}
		excel.getSheetByID(sheetID).updateSheet();
		putFileExcel(excel);
		return "SUCCESS";
	}
	public static void main(String args[]){
		new AlgorithmExcelAction().saveExcel();
	}
	public String listSheetContent(){
		FileExcel excel=getFileExcel(this.proID,this.algID);
		if(excel==null){
			return "SUCCESS";
		}
		sheetContent=excel.getSheetByID(sheetID);
		records=sheetContent.getSize();
		sheetContent.buildContent(page, rows);
		content=sheetContent.getContent();
		
		total = records / rows;
		if (records % rows != 0) {
			total++;
		}
		putFileExcel(excel);
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
	public String listSheetTitle(){		

		AlgorithmsCycleDao dao=new AlgorithmsCycleDao();
		
		AlgorithmsCycle p=dao.getAlgorithmDetail(this.algID);
		FileExcel excel=new FileExcel();
		int status=excel.readExcel(this.proID,ExcelAlgBaseDir+p.getStructFile());
		if(status==-1){
			msg=excel.getMsg();
			return "SUCCESS";
		}
		sheetTile=excel.getSheetByID(sheetID).getTitle();
		sheetName=excel.getSheetByID(sheetID).getName();
		colModel=excel.getSheetByID(sheetID).getColModel();
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
}
