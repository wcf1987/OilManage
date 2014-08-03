package cn.edu.cup.manage.action;

import java.util.List;

import cn.edu.cup.file.ColModel;
import cn.edu.cup.file.FileExcle;
import cn.edu.cup.manage.business.AlgorithmsCycle;
import cn.edu.cup.manage.dao.AlgorithmsCycleDao;

public class AlgorithmExcleAction {
	int algID;
	int sheetID;
	String msg;
	List<String> sheetTile;
	List<ColModel> colModel;
	public String listSheetTitle(){		

		AlgorithmsCycleDao dao=new AlgorithmsCycleDao();
		
		AlgorithmsCycle p=dao.getAlgorithmDetail(this.algID);
		FileExcle excle=new FileExcle();
		int status=excle.readExcle(p.getStructFile());
		if(status==-1){
			msg=excle.getMsg();
			return "SUCCESS";
		}
		sheetTile=excle.getSheetByID(sheetID).getTitle();
		colModel=excle.getSheetByID(sheetID).getColModel();
		dao.close();
		return "SUCCESS";
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
