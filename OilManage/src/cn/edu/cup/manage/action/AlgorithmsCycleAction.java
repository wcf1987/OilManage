package cn.edu.cup.manage.action;

import java.util.Date;
import java.util.List;

import cn.edu.cup.manage.business.AlgorithmsCycle;
import cn.edu.cup.manage.business.Parameters;
import cn.edu.cup.manage.dao.AlgorithmsCycleDao;
import cn.edu.cup.manage.dao.ParameterDao;

public class AlgorithmsCycleAction {
	String ID;
	String inputID;
	String planID;
	String outputID;
	String authorID;
	String Description;
	Date addDate;
	Date lastUpdateDate;
	List<AlgorithmsCycle> dataList;
	private int page;
	private int records;
	private int rows;
	private int rowNum;
	private int total;
	private String sidx;
	private String sord;
	public String list(){		

		AlgorithmsCycleDao dao=new AlgorithmsCycleDao();
		
		
		
		dataList=dao.getAlgorithmsList(page,rows,sidx,sord);
	
		records=dao.getCountAlgorithms();


		total=records/rows;
		if(records%rows!=0){
			total++;
		}
		return "SUCCESS";
	}


	public String add(){

		AlgorithmsCycleDao dao=new AlgorithmsCycleDao();
	
		int result=dao.addAlgorithm(this.Description,this.authorID);
		return "SUCCESS";
	}
	public String delete(){
		AlgorithmsCycleDao dao=new AlgorithmsCycleDao();
		dao.deleteAlgorithm(ID);
		return "SUCCESS";
	}
	public String update(){
		AlgorithmsCycleDao dao=new AlgorithmsCycleDao();
		int re=dao.updateParameter(ID, this.inputID,this.planID, this.outputID,this.Description);
		return "SUCCESS"; 
	}
	
}
