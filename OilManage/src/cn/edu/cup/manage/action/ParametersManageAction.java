package cn.edu.cup.manage.action;

import java.util.List;

import cn.edu.cup.manage.business.Parameters;
import cn.edu.cup.manage.dao.ParameterDao;
import cn.edu.cup.manage.dao.PhysicalDao;

import com.opensymphony.xwork2.ActionSupport;

public class ParametersManageAction extends ActionSupport{
	
	String name;
	String ID;
	String measureID;
	String display;
	List<Parameters> dataList;
	private int page;
	private int records;
	private int rows;
	private int rowNum;
	private int total;
	private String sidx;
	private String sord;
	public String list(){		

		ParameterDao dao=new ParameterDao();
		
		
		
		dataList=dao.getParametersList(page,rows,sidx,sord);
	
		records=dao.getCountParameters();


		total=records/rows;
		if(records%rows!=0){
			total++;
		}
		return "SUCCESS";
	}


	public String add(){

		ParameterDao dao=new ParameterDao();
	
		int result=dao.addParameter(measureID, display, name);
		return "SUCCESS";
	}
	public String delete(){
		ParameterDao dao=new ParameterDao();
		dao.deleteParameter(ID);
		return "SUCCESS";
	}
	public String update(){
		ParameterDao dao=new ParameterDao();
		int re=dao.updateParameter(ID, measureID, display, name);
		return "SUCCESS"; 
	}
}
