package cn.edu.cup.manage.action;

import java.util.List;

import cn.edu.cup.manage.business.AlgorithmGraphi;
import cn.edu.cup.manage.business.AlgorithmGraphiDetail;
import cn.edu.cup.manage.dao.AlgorithmGraphiDao;

public class AlgorithmGraphiAction {
	int CycleID;
	List<AlgorithmGraphi> listGraphi;
	
	List<AlgorithmGraphiDetail> listGraphiDetail;
	private int DetailId;
	private int page;
	private int records;
	private int rows;
	private int rowNum;
	private int total;
	private String sidx;
	private String sord;
	private int GraphiID;
	
	private int graphiType;
	private String graphiName;
	private int paramID;
	public String listGraphiByAlgID(){		

		AlgorithmGraphiDao dao=new AlgorithmGraphiDao();
		
		listGraphi=dao.getAlgGraphiList(this.CycleID);


		dao.close();
		return "SUCCESS";
	}
	public String listGraphiDetailByGraphID(){		

		AlgorithmGraphiDao dao=new AlgorithmGraphiDao();
		
		listGraphiDetail=dao.getAlgGraphiDetailList(this.GraphiID);


		dao.close();
		return "SUCCESS";
	}
	
	public String  addGraphi(){
		AlgorithmGraphiDao dao=new AlgorithmGraphiDao();

		int re=dao.addAlgGraphi(this.CycleID,this.graphiName,this.graphiType);
		dao.close();
		return "SUCCESS";
	}
	public String  addGraphiDetail(){
		AlgorithmGraphiDao dao=new AlgorithmGraphiDao();

		int re=dao.addAlgGraphiDetail(this.GraphiID,this.paramID);
		dao.close();
		return "SUCCESS";
	}

	public String  delGraphi(){
		AlgorithmGraphiDao dao=new AlgorithmGraphiDao();

		int re=dao.delAlgGraphi(this.GraphiID);
		dao.close();
		return "SUCCESS";
	}
	public String  delGraphiDetail(){
		AlgorithmGraphiDao dao=new AlgorithmGraphiDao();

		int re=dao.delAlgGraphiDetail(this.DetailId);
		dao.close();
		return "SUCCESS";
	}
	
	public String  updateGraphi(){
		AlgorithmGraphiDao dao=new AlgorithmGraphiDao();

		int re=dao.updateAlgGraphi(this.GraphiID,this.graphiName);
		dao.close();
		return "SUCCESS";
	}

}
