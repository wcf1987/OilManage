package cn.edu.cup.algjarexcel;

import java.util.Date;
import java.util.Iterator;

import cn.edu.cup.algjar.CalcInfo;
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
	}

	public int getStatus() {
		return status;
	}

	public void saveHis(Date start){
		ProjectCalcHisDao dao=new ProjectCalcHisDao();
		dao.addCalcHis(proid,start);
		//int result=dao.addAlgorithmPro(this.Description,this.authorID,this.name);
		
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
		dao.addCalcLog(hisID,info2,proid);
		dao.close();
	}
	public void end(int i, String info2) {
		markStatus(i, info2);
		
		ProCalcManage calcM=ProCalcManage.getInstance();
		calcM.clearThread(proid);
	}
    public void markStatus(int status,String info){
    	AlgorithmProDao dao = new AlgorithmProDao();
    	dao.setProCalcStatus(proid,status,info);
    	if(status==2||status==3){
    		dao.setProCalcEnd(proid);
    		ProjectCalcHisDao dao1 = new ProjectCalcHisDao();
    		dao1.setProCalcEnd(hisID,status,info);
    	}
    	dao.close();
    }
    public AlgorithmPlugTools loadAlgPro(int proid){
    	AlgorithmProDao dao = new AlgorithmProDao();
		
		String algFile = dao.getAlgorithmFile(proid);
		String clsName = dao.getAlgorithmClass(proid);
		AlgorithmPlugTools alg = JarTools.getPlug(algFile, clsName);
		return alg;
    }
    public void createHisID(Date start){
		ProjectCalcHisDao dao=new ProjectCalcHisDao();
		hisID=dao.addCalcHis(proid,start);
		//int result=dao.addAlgorithmPro(this.Description,this.authorID,this.name);
		
	}
    int hisID;
}
