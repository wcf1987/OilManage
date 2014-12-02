package cn.edu.cup.algjarexcel;

import java.util.Date;
import java.util.List;

import cn.edu.cup.file.FileExcel;
import cn.edu.cup.file.FileExcelManager;
import cn.edu.cup.file.SheetContent;
import cn.edu.cup.manage.dao.AlgorithmProDao;
import cn.edu.cup.manage.dao.ProjectCalcHisDao;
import cn.edu.cup.manage.dao.ProjectOutputDao;
import cn.edu.cup.tools.JarTools;

public class ProjectInfo{
	public RunInfo getInfo() {
		return info;
	}
	public RunInfoDetail info;
	public int status;
	public int proid;
	public int alg_ID;
	public int getProid() {
		return proid;
	}

	public int getAlg_ID() {
		return alg_ID;
	}

	public AlgorithmPlugTools getAlg() {
		return alg;
	}
	AlgorithmPlugTools alg;
	public ProjectInfo(int pro_id2){
		AlgorithmProDao dao=new AlgorithmProDao();
		info=dao.getProAlgInfo(pro_id2);
		info.setProinfo(this);
		status=dao.getStatus(pro_id2);
		alg_ID=dao.searchProAlg(pro_id2);
		this.proid=pro_id2;
		alg=loadAlgPro(proid);
		dao.close();
	}

	public int getStatus() {
		return status;
	}

	public void saveHis(Date start){
		ProjectCalcHisDao dao=new ProjectCalcHisDao();
		dao.addCalcHis(proid,start);
		//int result=dao.addAlgorithmPro(this.Description,this.authorID,this.name);
		dao.close();
	}
	public void save(){
		ProjectOutputDao dao=new ProjectOutputDao();
		//dao.cleanLastResult(this.pro_id);
		
		
	}

	public int getAlgID() {
	
		return alg_ID;
	}
	public void logInfo(String info2) {
		ProjectCalcHisDao dao = new ProjectCalcHisDao();
		dao.checkHisID(this);
		dao.addCalcLog(hisID,info2,proid);

		dao.close();
	}
	public void end(int i, String info2) {
		markStatus(i, info2);//更新project表的status和info字段
		AlgorithmProDao dao = new AlgorithmProDao();
		dao.setProCalcEnd(proid);//更新计算结束时间
		ProjectCalcHisDao dao1 = new ProjectCalcHisDao();
		dao1.setProCalcEnd(hisID,status,info2);//更新计算历史
		ProCalcManage calcM=ProCalcManage.getInstance();
		//calcM.clearThread(proid);//从map里面剔除该项目计算进程。
		dao.close();
		dao1.close();
		
	}
    public void markStatus(int status,String info){
    	AlgorithmProDao dao = new AlgorithmProDao();
    	dao.setProCalcStatus(proid,status,info);
    
    	dao.close();
    }
    public AlgorithmPlugTools loadAlgPro(int proid){
    	AlgorithmProDao dao = new AlgorithmProDao();
		
		String algFile = dao.getAlgorithmFile(proid);
		String clsName = dao.getAlgorithmClass(proid);
		AlgorithmPlugTools alg = JarTools.getPlug(algFile, clsName);
		dao.close();
		return alg;
    }
    public void createHisID(Date start){//插入计算历史信息
		ProjectCalcHisDao dao=new ProjectCalcHisDao();
		hisID=dao.addCalcHis(proid,start);
		//int result=dao.addAlgorithmPro(this.Description,this.authorID,this.name);
		dao.close();
	}
   public int hisID;
public String checkInputStatus() {
	FileExcel excel = FileExcelManager.getFileExcel(this.proid, this.alg_ID, "In");
	
	return excel.checkStatus();
	

}

}
