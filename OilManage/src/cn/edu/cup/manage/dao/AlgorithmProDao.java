package cn.edu.cup.manage.dao;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;

import cn.edu.cup.algjar.CalcInfo;
import cn.edu.cup.algjarexcel.RunInfoDetail;
import cn.edu.cup.file.FileExcel;
import cn.edu.cup.manage.action.AlgorithmExcelAction;
import cn.edu.cup.manage.business.AlgorithmPro;
import cn.edu.cup.manage.business.AlgorithmsCycle;
import cn.edu.cup.manage.business.LogInfo;
import cn.edu.cup.tools.HibernateSessionManager;
import cn.edu.cup.tools.Tools;

public class AlgorithmProDao {

	public void close() {
		// TODO Auto-generated method stub
		HibernateSessionManager.commitThreadLocalTransaction();
		HibernateSessionManager.closeThreadLocalSession();
	}

	public void roll() {
		// TODO Auto-generated method stub
		HibernateSessionManager.rollbackThreadLocalTransaction();
		HibernateSessionManager.closeThreadLocalSession();
	}

	Session session;

	public AlgorithmProDao() {
		session = HibernateSessionManager.getThreadLocalSession();
	}

	public List<AlgorithmPro> getAlgorithmProsList(int algid, int page,
			int rows, String sidx, String sord) {

		SQLQuery q = session
				.createSQLQuery("select t1.ID,t1.name,t1.Description,t1.AuthorID,t2.Username,t1.AddTime,t1.LastCalcTime ,t1.CalcHisNum,t1.ProfileIn,t1.ProfileOut,t1.status,t1.LastCalcEndTime,t1.runtime from t_projects t1,t_user t2 where t1.AuthorID=t2.ID and t1.Algorithm_ID=? order by t1."
						+ sidx + " " + sord);
		q.setParameter(0, algid);
		q.setFirstResult((page - 1) * rows);
		q.setMaxResults(rows);
		List l = q.list();
		List<AlgorithmPro> re = new ArrayList<AlgorithmPro>();
		for (int i = 0; i < l.size(); i++) {
			// TestDb user = (TestDb)l.get(i);
			// System.out.println(user.getUsername());

			Object[] row = (Object[]) l.get(i);
			
			Integer id = ((Integer) row[0]);
			String proname = ((String) row[1]);
			String description = (String) row[2];
			Integer aid = ((Integer) row[3]);
			String author = (String) row[4];
			Date addTime = (Date) row[5];

			Date lastCalcTime = (Date) row[6];
			Integer CalcHisNum = (Integer) row[7];

			String ProfileIn = (String) row[8];
			String ProfileOut = (String) row[9];
			int status = ((Integer) row[10]);
			Date LastCalcEndTime = (Date) row[11];
			int runtime = ((Integer) row[12]);
			

			AlgorithmPro p = new AlgorithmPro(id, proname, aid, author,
					description, addTime, lastCalcTime, CalcHisNum,ProfileIn,
					ProfileOut,status,runtime,LastCalcEndTime);

			re.add(p);
		}

		return re;
	}

	public int getCountAlgorithms(int algid) {
		// TODO Auto-generated method stub
		String sql = "select count(*) from t_projects t2 where t2.Algorithm_ID=?";
		SQLQuery q = session.createSQLQuery(sql);
		q.setParameter(0, algid);
		Integer count = ((BigInteger) q.uniqueResult()).intValue();
		return count;

	}

	public int addAlgorithmPro(String description, int authorID, String name,int algID) {
		Date addDate = new Date();
		HibernateSessionManager.getThreadLocalTransaction();
		
		AlgorithmsCycleDao dao=new AlgorithmsCycleDao();
		AlgorithmsCycle p=dao.getAlgorithmDetail(algID);
		FileExcel excel=new FileExcel();
		
		String pathIn=Tools.getWebRoot()+AlgorithmExcelAction.ExcelAlgBaseDir+p.getStructFileIn();
		String pathOut=Tools.getWebRoot()+AlgorithmExcelAction.ExcelAlgBaseDir+p.getStructFileOut();

		String proIn=Tools.getUUID()+".xls";
		String proOut=Tools.getUUID()+".xls";
		Tools.copyFile(pathIn, Tools.getWebRoot()+AlgorithmExcelAction.ExcelProBaseDir+proIn, true);
		Tools.copyFile(pathOut,Tools.getWebRoot()+AlgorithmExcelAction.ExcelProBaseDir+proOut, true);
		
		Query q = session
				.createSQLQuery("insert into t_projects (description,authorID,addtime,name,Type,profileIn,profileout,status,Algorithm_ID,info,runtime) values (?,?,?,?,?,?,?,?,?,?,0)");
		q.setParameter(0, description);
		q.setParameter(1, authorID);
		q.setParameter(2, addDate);
		q.setParameter(3, name);
		q.setParameter(4, 1);
		q.setParameter(5, proIn);
		q.setParameter(6, proOut);
		q.setParameter(7, 0);
		q.setParameter(8, algID);
		q.setParameter(9, "未运行");
		
		int result = q.executeUpdate();
		Query q2 = session.createSQLQuery("select LAST_INSERT_ID()");
		int ret_id = ((BigInteger) q2.uniqueResult()).intValue();
		return ret_id;
	
	}

	public int deletePro(int id) {
		HibernateSessionManager.getThreadLocalTransaction();
		SQLQuery q = session
				.createSQLQuery("delete from t_projects where ID=?");
		q.setParameter(0, id);
		int re = q.executeUpdate();
		// tx.commit();
		return re;

	}

	public int updatePro(int iD, String name, String description) {
		// TODO Auto-generated method stub
		Date modifyTime = new Date();
		HibernateSessionManager.getThreadLocalTransaction();
		SQLQuery q = session
				.createSQLQuery("update t_projects t set Name=?, Description=? where t.ID=?");
		q.setParameter(0, name);
		q.setParameter(1, description);
		q.setParameter(2, iD);
		int re = q.executeUpdate();

		return re;
	}

	public int searchProAlg(int proID) {
		Query q = session
				.createSQLQuery("select t.algorithm_id from t_projects t where t.ID=?");
		q.setParameter(0, proID);
		int result = 0;
		result = (Integer) q.uniqueResult();

		return result;
	}

	public int addAlgorithm(int iD, int algID) {
		HibernateSessionManager.getThreadLocalTransaction();
		Query q = session
				.createSQLQuery("update t_projects t set t.algorithm_ID =? where t.ID=? ");
		q.setParameter(0, algID);
		q.setParameter(1, iD);
		int result = q.executeUpdate();

		return result;
	}

	public String getAlgorithmFile(int pro_id) {
		String sql = "select t2.FilePath from t_projects t,t_algorithmscycle t2 where  t.id=? and t2.ID=t.Algorithm_id";
		SQLQuery q2 = session.createSQLQuery(sql);
		q2.setParameter(0, pro_id);
		String alg = ((String) q2.uniqueResult());
		alg=Tools.getWebRoot()+AlgorithmExcelAction.AlgBaseDir+alg;
		return alg;
	}

	public String getProFile(int pro_id, int algid,String InOrOut) {
		String sql;
		if(InOrOut.equals("In")){
			 sql = "select t2.profilein from t_projects t2 where  t2.ID=?  and t2.Algorithm_ID=?";
		}else{
			 sql = "select t2.profileout from t_projects t2 where  t2.ID=?  and t2.Algorithm_ID=?";
		}		
		SQLQuery q2 = session.createSQLQuery(sql);
		q2.setParameter(0, pro_id);
		q2.setParameter(1, algid);
		String alg = ((String) q2.uniqueResult());

		return alg;
	}

	public String getAlgorithmClass(int pro_id) {
		String sql = "select t2.ClassName from t_projects t,t_algorithmscycle t2 where  t.id=? and t2.ID=t.Algorithm_id";
		SQLQuery q2 = session.createSQLQuery(sql);
		q2.setParameter(0, pro_id);
		String className = ((String) q2.uniqueResult());

		return className;
	}

	public List<Double> getListInput(String UUID) {
		SQLQuery q3 = session
				.createSQLQuery("select t.list_ISOValue from t_projectinputlist t where  t.UUID=? order by list_index asc");
		q3.setParameter(0, UUID);

		List l = q3.list();
		List<Double> temp = new ArrayList<Double>();
		for (int i = 0; i < l.size(); i++) {
			// TestDb user = (TestDb)l.get(i);
			// System.out.println(user.getUsername());

			Double value = (Double) l.get(i);
			temp.add(value);

		}
		return temp;
	}

	public CalcInfo getProInfo(int pro_id) {
		// TODO Auto-generated method stub
		CalcInfo temp = new CalcInfo();

		SQLQuery q = session
				.createSQLQuery("SELECT t.par_name,t.par_ISOValue,t.par_type,t.par_listUUID from t_projectinputs t where t.Pro_ID=?");
		q.setParameter(0, pro_id);

		List l = q.list();
		for (int i = 0; i < l.size(); i++) {
			// TestDb user = (TestDb)l.get(i);
			// System.out.println(user.getUsername());

			Object[] row = (Object[]) l.get(i);
			;

			String name = (String) row[0];
			Double value = (Double) row[1];
			int type = (Integer) row[2];
			// 加载单值
			if (type == 0) {
				temp.addParamInput(name, value);
			}
			// 加载多值
			if (type == 1) {
				String UUID = (String) row[3];
				List temp2 = this.getListInput(UUID);
				temp.addListInput(name, temp2);
			}

		}

		String sql = "select Algorithm_ID from t_projects t where  t.id=?";
		SQLQuery q2 = session.createSQLQuery(sql);
		q2.setParameter(0, pro_id);
		Integer alg = ((Integer) q2.uniqueResult()).intValue();
		temp.setAlgorthm(alg);

		/*
		 * SQLQuery q3 = session.createSQLQuery(
		 * "SELECT t1.name from t_algorithmoutput t,t_parameters t1 where t.CycleID=? and t.ParamID=t1.ID"
		 * ); q3.setParameter(0, alg);
		 * 
		 * l = q3.list(); for(int i=0;i<l.size();i++) { //TestDb user =
		 * (TestDb)l.get(i); //System.out.println(user.getUsername());
		 * 
		 * 
		 * 
		 * String name=(String)l.get(i);
		 * 
		 * temp.addParamOutput(name, 0d);
		 * 
		 * 
		 * 
		 * }
		 */

		return temp;
	}

	public void updateProInfo(int id) {
		HibernateSessionManager.getThreadLocalTransaction();
		Date modifyTime = new Date();
		SQLQuery q = session
				.createSQLQuery("update t_projects t set t.CalcHisNum=(select count(*) from t_calchis t1 where t1.Pro_ID=?),t.LastCalcTime=(select max(t2.Calc_EndTime) from t_calchis t2 where t2.Pro_ID=?) where t.ID=?");

		q.setParameter(0, id);
		q.setParameter(1, id);
		q.setParameter(2, id);
		int re = q.executeUpdate();

	}

	public RunInfoDetail getProAlgInfo(int pro_id2) {
		
		RunInfoDetail info=new RunInfoDetail();
		
		int algid=searchProAlg(pro_id2);
		String filein=getProFile(pro_id2,algid,"In");
		String fileout=getProFile(pro_id2,algid,"Out");
		filein=Tools.getWebRoot()+AlgorithmExcelAction.ExcelProBaseDir+filein;
		fileout=Tools.getWebRoot()+AlgorithmExcelAction.ExcelProBaseDir+fileout;
		info.setAlgorthm(algid);
		info.setFileInputPath(filein);
		info.setFileOutputPath(fileout);
		return info;
	}

	public int getStatus(int pro_id) {
		String sql = "select t.status from t_projects t where  t.id=? ";
		SQLQuery q2 = session.createSQLQuery(sql);
		q2.setParameter(0, pro_id);
		Integer status = ((Integer) q2.uniqueResult());

		return status;
	}

	public void setProCalcStatus(int proid,int status,String info) {
		HibernateSessionManager.getThreadLocalTransaction();
		Date modifyTime = new Date();
		SQLQuery q = session
				.createSQLQuery("update t_projects t set t.status=?,info=?  where t.ID=?");
		q.setParameter(0, status);

		q.setParameter(1, info);
		q.setParameter(2, proid);
		int re = q.executeUpdate();
		
	}

	public void setProCalcEnd(int proid) {
		HibernateSessionManager.getThreadLocalTransaction();
		Date modifyTime = new Date();
		SQLQuery q = session
				.createSQLQuery("update t_projects t set t.LastCalcEndTime=now()  where t.ID=?");

		q.setParameter(0, proid);
		int re = q.executeUpdate();
		
	}

	public List<Integer> getRunPro() {
		SQLQuery q3 = session
				.createSQLQuery("select t.id from t_projects t where  t.status=1");
		
		List l = q3.list();
		List<Integer> temp = new ArrayList<Integer>();
		for (int i = 0; i < l.size(); i++) {
			// TestDb user = (TestDb)l.get(i);
			// System.out.println(user.getUsername());

			Integer value = (Integer) l.get(i);
			temp.add(value);

		}
		return temp;
	}

	public int getcalcLastest(int pro_id) {
		String sql = "select max(t.id) from t_calchis t where  t.pro_id=? ";
		SQLQuery q2 = session.createSQLQuery(sql);
		q2.setParameter(0, pro_id);
		Object temp=q2.uniqueResult();
		Integer calcHis ;
		if(temp!=null){
		 calcHis = ((Integer) temp);
		
		}
		else{
			calcHis=-1;
		}
		return calcHis;
	}

	public List<LogInfo> getLogList(int calcHisID) {
		SQLQuery q3 = session
				.createSQLQuery("select t.logtime,t.info from t_calchis_log t where  t.calchis_id=? order by id asc");
		q3.setParameter(0, calcHisID);

		List l = q3.list();
		List<LogInfo> temp = new ArrayList<LogInfo>();
		for (int i = 0; i < l.size(); i++) {
			// TestDb user = (TestDb)l.get(i);
			// System.out.println(user.getUsername());
			Object[] row = (Object[]) l.get(i);
			Date time = (Date) row[0];
			String infos=(String)row[1];
			LogInfo info=new LogInfo(time,infos);
			temp.add(info);

		}
		return temp;
	}
	public String getProName(int proid){
		String sql = "select t.Name from t_projects t where  t.id=? ";
		SQLQuery q2 = session.createSQLQuery(sql);
		q2.setParameter(0, proid);
		String name = ((String) q2.uniqueResult());

		return name;
	}

}
