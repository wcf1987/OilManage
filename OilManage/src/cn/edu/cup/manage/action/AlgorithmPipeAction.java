package cn.edu.cup.manage.action;

import java.util.List;
import java.util.Map;

import cn.edu.cup.file.FileExcel;
import cn.edu.cup.file.FileExcelManager;
import cn.edu.cup.file.SheetContent;

public class AlgorithmPipeAction {
	
	
	int algID;
	public String getMsg() {
		return msg;
	}
	public List<Map<String, String>> getContent() {
		return content;
	}
	public void setContent(List<Map<String, String>> content) {
		this.content = content;
	}
	public void setAlgID(int algID) {
		this.algID = algID;
	}
	public void setSheetID(int sheetID) {
		this.sheetID = sheetID;
	}
	public void setProID(int proID) {
		this.proID = proID;
	}
	public void setPipeName(String pipeName) {
		this.pipeName = pipeName;
	}
	public void setRecords(int records) {
		this.records = records;
	}
	public void setRows(int rows) {
		this.rows = rows;
	}
	public void setRowNum(int rowNum) {
		this.rowNum = rowNum;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	int sheetID;
	int proID;
	String pipeName;
	List<Map<String, String>> content;
	private int records;
	private int rows;
	private int rowNum;
	private int total;
	private int page;
	String msg;
	public String listPipe() {

		FileExcel excel = FileExcelManager.getFileExcel(this.proID, this.algID, "Out");
		if (excel == null) {
			return "SUCCESS";
		}
		
		SheetContent sheetContent=excel.getSheetByName(excel, "管道沿线参数");
		if (sheetContent == null) {
			msg = "管道沿线参数未找到";
			return "SUCCESS";
		}
		records = sheetContent.getSize()-1;
		if(rows==0){
			sheetContent.buildContent(0, records+1);				
		}else{
			sheetContent.buildContent(page, rows);
		}
		content = sheetContent.getContent();
		selectContent(pipeName);
		total = records / rows;
		if (records % rows != 0) {
			total++;
		}
		//putFileExcel(excel);
		return "SUCCESS";
	}
	private void selectContent(String name){
		for(int i=content.size()-1;i>=0;i--){
			Map<String,String> temp=content.get(i);
			if(!temp.get("管道名称").equals(name)){
				content.remove(i);
			}
				
		}
	}
}
