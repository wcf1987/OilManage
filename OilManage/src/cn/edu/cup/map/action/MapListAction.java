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
	public String add(){
		MapDao dao=new MapDao();
		dao.addPro(proName, filePath);
		return "SUCCESS";
	}
	List<MapPro> dataList;
	private long total;
	private long page;
	private long records;
	public String list(){		
		MapDao dao=new MapDao();
		dataList=dao.list();
		
		page=1;
		records=dataList.size();
		total=10;
		
		return "SUCCESS";
	}
	private Graphi graphi;
	public String viewMap(){
		FileToGraphi a=new FileToGraphi();
		graphi=a.FileTrans(filePath);
		return "SUCCESS";
	}

	public Graphi getGraphi() {
		return graphi;
	}
}
