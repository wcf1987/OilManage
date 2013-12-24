package cn.edu.cup.map.action;

import java.util.ArrayList;
import java.util.List;

import cn.edu.cup.map.business.FileToGraphi;
import cn.edu.cup.map.business.Graphi;
import cn.edu.cup.map.business.MapPro;
import cn.edu.cup.map.dao.MapDao;

import com.opensymphony.xwork2.ActionSupport;


public class MapListAction extends ActionSupport{
	public String filePath;
	public String proName;
	
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public void setProName(String proName) {
		this.proName = proName;
	}

	public String execute(){
		
		return "SUCCESS";
	}
	String re;
	public String getRe() {
		return re;
	}

	public String delete(){
		MapDao dao=new MapDao();
		int reint=dao.deleteMap(id);
		if(reint!=1){
			re="删除失败，此地图记录已不存在";
		}else{
			re="删除成功";
		}
		return "SUCCESS";
	}
	public String add(){
		MapDao dao=new MapDao();
		dao.addPro(proName, filePath);
	
		return "SUCCESS";
	}
	List<MapPro> dataList;
	private int total;
	public void setPage(int page) {
		this.page = page;
	}
	private int id;
	public void setId(int id) {
		this.id = id;
	}
	private int page;
	private int records;
	private int rows;
	public int getRows() {
		return rows;
	}

	public void setRows(int rows) {
		this.rows = rows;
	}

	public String list(){		
		MapDao dao=new MapDao();
		dataList=dao.list(page,rows);
		
		page=1;
		records=dao.getMax();
		total=10;
		for(int i=0;i<dataList.size();i++){
			MapPro m=dataList.get(i);
			String fp=m.getFilePath();
			
			m.setFilePath(changePath(fp));
		}
		return "SUCCESS";
	}
	private String changePath(String AbsolutePath){
		String WebPath="";
		int start=AbsolutePath.indexOf(UploadAction.UPLOADPATH);
		if(start>0){
		WebPath=AbsolutePath.substring(start);}
		WebPath=WebPath.replace("\\", "/");
		System.out.println(WebPath);
		return WebPath;
	}
	public List<MapPro> getDataList() {
		return dataList;
	}

	public int getRecords() {
		return records;
	}
	private Graphi graphi;
	public String viewMap(){
		FileToGraphi a=new FileToGraphi();
		MapDao dao=new MapDao();
		filePath=dao.getFilePath(id);
		graphi=a.FileTrans(filePath);
		return "SUCCESS";
	}

	public Graphi getGraphi() {
		return graphi;
	}
}
