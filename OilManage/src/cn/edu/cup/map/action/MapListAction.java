package cn.edu.cup.map.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import cn.edu.cup.map.business.FileToGraphi;
import cn.edu.cup.map.business.Graphi;
import cn.edu.cup.map.business.MapPro;
import cn.edu.cup.map.dao.MapDao;

import com.opensymphony.xwork2.ActionSupport;


public class MapListAction extends ActionSupport{
	public String filePath;
	public String proName;
	
	private int page;
	private int records;
	private int rows;
	private int rowNum;
	private int total;
	List<MapPro> dataList;
	private Graphi graphi;
	
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public void setProName(String proName) {
		this.proName = proName;
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

	public int getPage(){
		return page;
	}
	
	public void setPage(int page) {
		this.page = page;
	}
	
	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public List<MapPro> getDataList() {
		return dataList;
	}

	public int getRecords() {
		return records;
	}

	public Graphi getGraphi() {
		return graphi;
	}
	
	public String execute(){
		
		
		return "SUCCESS";
	}
	
	public String add(){
		MapDao dao=new MapDao();
		dao.addPro(proName, filePath);
		
		return "SUCCESS";
	}
	
	public String viewMap(){
		FileToGraphi a=new FileToGraphi();
		graphi=a.FileTrans(filePath);
		return "SUCCESS";
	}

	public String list(){		
		MapDao dao=new MapDao();
		dataList=dao.list(page,rows);
		
//		page=1;
		records=dao.getMax();
		total=records/rows;
		
		return "SUCCESS";
	}
	

	
}
