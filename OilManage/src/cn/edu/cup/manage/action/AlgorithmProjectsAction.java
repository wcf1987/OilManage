package cn.edu.cup.manage.action;

import java.util.Date;
import java.util.List;

import cn.edu.cup.algjarexcel.AlgorithmPlugTools;
import cn.edu.cup.algjarexcel.ProCalcManage;
import cn.edu.cup.algjarexcel.ProjectInfo;
import cn.edu.cup.manage.business.AlgorithmPro;
import cn.edu.cup.manage.business.LogInfo;
import cn.edu.cup.manage.dao.AlgorithmProDao;
import cn.edu.cup.tools.JarTools;

public class AlgorithmProjectsAction {
	int ID;
	int inputID;
	int planID;
	int outputID;
	int authorID;
	String Description;
	Date addDate;
	Date lastUpdateDate;
	String name;
	List<AlgorithmPro> dataList;
	boolean exeSuccess;
	private int algID;
	private int page;
	private int records;
	private int rows;
	private int rowNum;
	private int total;
	private String sidx;
	private String sord;
	private List<Integer> ids;

	public void setExeSuccess(boolean exeSuccess) {
		this.exeSuccess = exeSuccess;
	}

	public boolean isExeSuccess() {
		return exeSuccess;
	}

	public void setAlgID(int algID) {
		this.algID = algID;
	}

	public int getAlgID() {
		return algID;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setIds(List<Integer> ids) {
		this.ids = ids;
	}

	public List<Integer> getIds() {
		return ids;
	}

	public void setID(int iD) {
		ID = iD;
	}

	public int getID() {
		return ID;
	}

	public void setDescription(String description) {
		Description = description;
	}

	public String getDescription() {
		return Description;
	}

	public void setAddDate(Date addDate) {
		this.addDate = addDate;
	}

	public Date getAddDate() {
		return addDate;
	}

	public void setLastUpdateDate(Date lastUpdateDate) {
		this.lastUpdateDate = lastUpdateDate;
	}

	public Date getLastUpdateDate() {
		return lastUpdateDate;
	}

	public void setDataList(List<AlgorithmPro> dataList) {
		this.dataList = dataList;
	}

	public List<AlgorithmPro> getDataList() {
		return dataList;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getPage() {
		return page;
	}

	public void setRecords(int records) {
		this.records = records;
	}

	public int getRecords() {
		return records;
	}

	public void setRows(int rows) {
		this.rows = rows;
	}

	public int getRows() {
		return rows;
	}

	public void setRowNum(int rowNum) {
		this.rowNum = rowNum;
	}

	public int getRowNum() {
		return rowNum;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getTotal() {
		return total;
	}

	public void setSidx(String sidx) {
		this.sidx = sidx;
	}

	public String getSidx() {
		return sidx;
	}

	public void setSord(String sord) {
		this.sord = sord;
	}

	public String getSord() {
		return sord;
	}
	public String list() {
		ProCalcManage pcm=ProCalcManage.getInstance();
		pcm.checkRunStatus();
		AlgorithmProDao dao = new AlgorithmProDao();

		dataList = dao.getAlgorithmProsList(algID,page, rows, sidx, sord);

		records = dao.getCountAlgorithms(algID);

		total = records / rows;
		if (records % rows != 0) {
			total++;
		}
		dao.close();
		return "SUCCESS";
	}

	public String add() {

		AlgorithmProDao dao = new AlgorithmProDao();

		this.ID = dao.addAlgorithmPro(this.Description, this.authorID,
				this.name,this.algID);
		dao.close();
		return "SUCCESS";
	}

	public int getInputID() {
		return inputID;
	}

	public void setInputID(int inputID) {
		this.inputID = inputID;
	}

	public int getPlanID() {
		return planID;
	}

	public void setPlanID(int planID) {
		this.planID = planID;
	}

	public int getOutputID() {
		return outputID;
	}

	public void setOutputID(int outputID) {
		this.outputID = outputID;
	}

	public int getAuthorID() {
		return authorID;
	}

	public void setAuthorID(int authorID) {
		this.authorID = authorID;
	}

	public String getName() {
		return name;
	}

	public String delete() {
		AlgorithmProDao dao = new AlgorithmProDao();
		// AlgorithmInputDao inputDao=new AlgorithmInputDao();
		if (!ids.isEmpty()) {

			for (int id : ids) {

				dao.deletePro(id);
			}
		}
		// inputDao.close();
		dao.close();
		// dao.deleteAlgorithm(ID);
		return "SUCCESS";
	}

	public String update() {
		AlgorithmProDao dao = new AlgorithmProDao();
		int re = dao.updatePro(ID, this.name, this.Description);
		dao.close();
		return "SUCCESS";
	}

	public String searchProAlg() {
		AlgorithmProDao dao = new AlgorithmProDao();
		this.algID = dao.searchProAlg(this.ID);
		dao.close();
		return "SUCCESS";
	}

	public String selectAlg() {
		AlgorithmProDao dao = new AlgorithmProDao();
		int re = dao.addAlgorithm(this.ID, this.algID);
		dao.close();
		return "SUCCESS";
	}

	String className;

	public String getClassName() {
		return className;
	}

	public void setClassName(String className) {
		this.className = className;
	}

/*	public String runAlg() {
		AlgorithmProDao dao = new AlgorithmProDao();
		String algFile = dao.getAlgorithmFile(this.ID);
		String clsName = dao.getAlgorithmClass(this.ID);
		AlgorithmPlug alg = JarTools.getPlug(algFile, clsName, this.ID);
		if (alg != null) {
			Date start = new Date();
			try {
				AlgorithmPlugHelp help=new AlgorithmPlugHelp(this.ID);
				alg.injectInfo(help.getInfo());
				alg.startCalc();
				help.save();
				help.saveHis(start);
				dao.updateProInfo(this.ID);
				dao.close();
				this.exeSuccess = true;
			} catch (Exception e) {
				this.exeSuccess = false;
			}

		}
		dao.close();
		return "SUCCESS";
	}*/
	
	String msg;
	public String getMsg() {
		return msg;
	}

	public int getStatus() {
		return status;
	}

	int status;
	public String runAlg() {
		ProCalcManage pcm=ProCalcManage.getInstance();
		pcm.checkRunStatus();
		ProjectInfo proinfo=new ProjectInfo(this.ID);
		if(proinfo.getStatus()==1){
			msg="工程正在运行中，请稍后或强项终止工程运行";
			status=1;
			return "SUCCESS";
		}
		
		pcm.run(this.ID);
		
		return "SUCCESS";
	}
	public static void main(String args[]){
		AlgorithmProjectsAction test=new AlgorithmProjectsAction();
		test.setID(19);
		test.runAlg();
	
	
	}
	public String stopAlg() {
		
		ProCalcManage pcm=ProCalcManage.getInstance();
		pcm.stopThread(this.ID);
		
		return "SUCCESS";
	}
	int calcHisID;
	List<LogInfo> loginfo;
	public String listLog() {
	
		AlgorithmProDao dao = new AlgorithmProDao();
		calcHisID = dao.getcalcLastest(this.ID);
		loginfo=dao.getLogList(calcHisID);
		dao.close();
		return "SUCCESS";
	}

	public int getCalcHisID() {
		return calcHisID;
	}

	public List<LogInfo> getLoginfo() {
		return loginfo;
	}
}
