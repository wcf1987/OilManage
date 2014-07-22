package cn.edu.cup.manage.dao;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;
import org.hibernate.service.ServiceRegistryBuilder;

import cn.edu.cup.manage.business.AlgorithmPro;
import cn.edu.cup.manage.business.CalcInfo;
import cn.edu.cup.tools.HibernateSessionManager;

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
	 Session session ;

		
	

	public AlgorithmProDao()
	{	
		session = HibernateSessionManager.getThreadLocalSession();
	}
	public List<AlgorithmPro> getAlgorithmProsList(int page, int rows,
			String sidx, String sord) {
		
		SQLQuery q = session.createSQLQuery("select t1.ID,t1.name,t1.Description,t1.AuthorID,t2.Username,t1.AddTime,t1.LastCalcTime ,t1.CalcHisNum from t_projects t1,t_user t2 where t1.AuthorID=t2.ID order by t1."+sidx+" "+sord);

		q.setFirstResult((page-1)*rows);
		q.setMaxResults(rows);
		List l = q.list();
		List<AlgorithmPro> re=new ArrayList<AlgorithmPro>();
		for(int i=0;i<l.size();i++)
		{
			//TestDb user = (TestDb)l.get(i);
			//System.out.println(user.getUsername());

			  Object[] row = (Object[])l.get(i);;
			  Integer id = ((Integer)row[0]);
			  String proname = ((String)row[1]);
			  String description=(String)row[2];
			  Integer aid=((Integer)row[3]);
			  String author=(String)row[4];
			  Date addTime=(Date)row[5];
			  
			  Date lastCalcTime=(Date)row[6];
			  Integer CalcHisNum=(Integer)row[7];
			  
			  
			  AlgorithmPro p=new AlgorithmPro(id, proname,aid,author,description,addTime,lastCalcTime,CalcHisNum);
			  
			  
			  re.add(p);
		}
		
		return re;
	}

	public int getCountAlgorithms() {
		// TODO Auto-generated method stub
		String sql="select count(*) from t_projects t2 ";
		SQLQuery q = session.createSQLQuery(sql);
		Integer count=((BigInteger)q.uniqueResult()).intValue();
		return count;

	}
	public int addAlgorithmPro(String description, int authorID,String name) {
		Date addDate=new Date();
		HibernateSessionManager.getThreadLocalTransaction();
		Query q = session.createSQLQuery("insert into t_projects (description,authorID,addtime,name) values (?,?,?,?)");
		q.setParameter(0, description);
		q.setParameter(1, authorID);
		q.setParameter(2, addDate);
		q.setParameter(3, name);
		int result=q.executeUpdate();
		
	
		return result;
	}
	
	public int deletePro(int  id) {
		HibernateSessionManager.getThreadLocalTransaction();
		SQLQuery q = session.createSQLQuery("delete from t_projects where ID=?");
		q.setParameter(0, id);
		int re=q.executeUpdate();
//		tx.commit();
		return re;
		
	}


	public int updatePro(int iD, String name, String description) {
		// TODO Auto-generated method stub
		Date modifyTime=new Date();
		HibernateSessionManager.getThreadLocalTransaction();
		SQLQuery q = session.createSQLQuery("update t_projects t set Name=?, Description=? where t.ID=?");
		q.setParameter(0, name);
		q.setParameter(1, description);
		q.setParameter(2, iD);
		int re=q.executeUpdate();

		return re;
	}
	public int searchProAlg(int proID){
		Query q=session.createSQLQuery("select t.algorithm_id from t_projects t where t.ID=?");
		q.setParameter(0, proID);
		int result=0;
		result=(Integer) q.uniqueResult(); 

		return result;
	}
	public int addAlgorithm(int iD,int algID){
		HibernateSessionManager.getThreadLocalTransaction();
		Query q = session.createSQLQuery("update t_projects t set t.algorithm_ID =? where t.ID=? ");
		q.setParameter(0, algID);
		q.setParameter(1, iD);
		int result=q.executeUpdate();		
	
		return result;
	}
	public String getAlgorithmFile(int pro_id) {
		String sql="select t2.FilePath from t_projects t,t_algorithmscycle t2 where  t.id=? and t2.ID=t.Algorithm_id";
		SQLQuery q2 = session.createSQLQuery(sql);
		q2.setParameter(0, pro_id);
		String alg=((String)q2.uniqueResult());
		
		return alg;
	}
	public String getAlgorithmClass(int pro_id) {
		String sql="select t2.ClassName from t_projects t,t_algorithmscycle t2 where  t.id=? and t2.ID=t.Algorithm_id";
		SQLQuery q2 = session.createSQLQuery(sql);
		q2.setParameter(0, pro_id);
		String className=((String)q2.uniqueResult());
		
		return className;
	}
	public List<Double> getListInput(String UUID){
		SQLQuery q3 = session.createSQLQuery("select t.list_ISOValue from t_projectinputlist t where  t.UUID=? order by list_index asc");
		q3.setParameter(0, UUID);
		
		List l = q3.list();
		List<Double> temp=new ArrayList<Double>();
		for(int i=0;i<l.size();i++)
		{
			//TestDb user = (TestDb)l.get(i);
			//System.out.println(user.getUsername());

			  
			  Double value=(Double)l.get(i);
			  temp.add(value);
			  
			 
			  
		}
		return temp;
	}
	public CalcInfo getProInfo(int pro_id) {
		// TODO Auto-generated method stub
		CalcInfo temp=new CalcInfo();
		
	
		SQLQuery q = session.createSQLQuery("SELECT t.par_name,t.par_ISOValue,t.par_type,t.par_listUUID from t_projectinputs t where t.Pro_ID=?");
		q.setParameter(0, pro_id);
		
		List l = q.list();
		for(int i=0;i<l.size();i++)
		{
			//TestDb user = (TestDb)l.get(i);
			//System.out.println(user.getUsername());

			  Object[] row = (Object[])l.get(i);;
			  
			  String name=(String)row[0];
			  Double value=(Double)row[1];
			  int type=(Integer)row[2];
				//加载单值
			  if(type==0){
			  temp.addParamInput(name, value);
			  }
			  //加载多值
			  if(type==1){
				  String UUID=(String)row[3];
				  List temp2=this.getListInput(UUID);
				  temp.addListInput(name, temp2);
			  }
			 
			  
		}
	
		
		
		
		String sql="select Algorithm_ID from t_projects t where  t.id=?";
		SQLQuery q2 = session.createSQLQuery(sql);
		q2.setParameter(0, pro_id);
		Integer alg=((Integer)q2.uniqueResult()).intValue();
		temp.setAlgorthm(alg);
		
		SQLQuery q3 = session.createSQLQuery("SELECT t1.name from t_algorithmoutput t,t_parameters t1 where t.CycleID=? and t.ParamID=t1.ID");
		q3.setParameter(0, alg);
		
		l = q3.list();
		for(int i=0;i<l.size();i++)
		{
			//TestDb user = (TestDb)l.get(i);
			//System.out.println(user.getUsername());

			 
			  
			  String name=(String)l.get(i);
			 
			  temp.addParamOutput(name, 0d);
			  
			 
			  
		}
		
		
		return temp;
	}

	public void updateProInfo(int id) {
		HibernateSessionManager.getThreadLocalTransaction();
		Date modifyTime=new Date();
		SQLQuery q = session.createSQLQuery("update t_projects t set t.CalcHisNum=(select count(*) from t_calchis t1 where t1.Pro_ID=?),t.LastCalcTime=(select max(t2.Calc_EndTime) from t_calchis t2 where t2.Pro_ID=?) where t.ID=?");
		
		q.setParameter(0, id);
		q.setParameter(1, id);
		q.setParameter(2, id);
		int re=q.executeUpdate();
		
		
	}



	
}
