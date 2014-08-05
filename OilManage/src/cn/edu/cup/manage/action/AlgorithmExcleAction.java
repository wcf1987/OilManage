package cn.edu.cup.manage.action;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;
import cn.edu.cup.file.ColModel;
import cn.edu.cup.file.FileExcle;
import cn.edu.cup.file.SheetContent;
import cn.edu.cup.manage.business.AlgorithmsCycle;
import cn.edu.cup.manage.dao.AlgorithmProDao;
import cn.edu.cup.manage.dao.AlgorithmsCycleDao;
import cn.edu.cup.tools.Tools;

import com.opensymphony.xwork2.ActionContext;

public class AlgorithmExcleAction {
	private static String ExcleAlgBaseDir="ExcleFrame\\";
	private static String ExcleProBaseDir="ExcleProject\\";
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
	
	public FileExcle getFileExcle(int proid,int algid){
		ActionContext actionContext = ActionContext.getContext();
        Map session = actionContext.getSession();
        Map<String,FileExcle> cacheList=(Map<String,FileExcle>)session.get("ExcleCacheList");
       
        if(cacheList==null){
        	cacheList=new HashMap<String,FileExcle>();
        	//session.put("ExcleCacheList", cacheList);
        	
        }
      String key=Tools.createKeyFromProAndALg(proid,algid);
        FileExcle excle=cacheList.get(key);
        if(excle!=null){
        		return excle;
        	}
              
			
    		AlgorithmProDao dao=new AlgorithmProDao();
    		
    		String  filepath=dao.getProFile(this.proID,algid);
    		dao.close();
    		if (filepath==null ||filepath.equals("")){
    			return null;
    		}
    		excle=new FileExcle();
    		int status=excle.readExcle(this.proID,ExcleProBaseDir+filepath);
    		if(status==-1){
    			msg=excle.getMsg();
    			return null;
    		}
    		cacheList.put(key,excle);
    		session.put("ExcleCacheList",cacheList);
    		return excle;
    		
	}
	public String saveExcle(){
		FileExcle excle=getFileExcle(this.proID,this.algID);
		int re=excle.saveExcle();
		if(re==-1){
			msg="保存失败，请检查数据结构";
		}
		return "SUCCESS";
	}
	public FileExcle putFileExcle(FileExcle e){
		ActionContext actionContext = ActionContext.getContext();
        Map session = actionContext.getSession();
        Map<Integer,FileExcle> cacheList=(Map<Integer,FileExcle>)session.get("ExcleCacheList");
        cacheList.put(e.getProID(),e);
        session.put("ExcleCacheList",cacheList);
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
		FileExcle excle=getFileExcle(this.proID,this.algID);
		SheetContent sheet=excle.getSheetByID(sheetID);
		sheet.addRow(this.postMap);
		return "SUCCESS";
	}
	public String editSheetContent(){
		FileExcle excle=getFileExcle(this.proID,this.algID);
		SheetContent sheet=excle.getSheetByID(sheetID);
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
		FileExcle excle=getFileExcle(this.proID,this.algID);
		if (!ids.isEmpty()) {

			for (int id : ids) {
				
				excle.getSheetByID(sheetID).removeRow(id);
			}
		}
		excle.getSheetByID(sheetID).updateSheet();
		putFileExcle(excle);
		return "SUCCESS";
	}
	public static void main(String args[]){
		new AlgorithmExcleAction().saveExcle();
	}
	public String listSheetContent(){
		FileExcle excle=getFileExcle(this.proID,this.algID);
		if(excle==null){
			return "SUCCESS";
		}
		sheetContent=excle.getSheetByID(sheetID);
		records=sheetContent.getSize();
		sheetContent.buildContent(page, rows);
		content=sheetContent.getContent();
		
		total = records / rows;
		if (records % rows != 0) {
			total++;
		}
		putFileExcle(excle);
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
		FileExcle excle=new FileExcle();
		int status=excle.readExcle(this.proID,ExcleAlgBaseDir+p.getStructFile());
		if(status==-1){
			msg=excle.getMsg();
			return "SUCCESS";
		}
		sheetTile=excle.getSheetByID(sheetID).getTitle();
		sheetName=excle.getSheetByID(sheetID).getName();
		colModel=excle.getSheetByID(sheetID).getColModel();
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
