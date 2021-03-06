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

import cn.edu.cup.manage.business.AlgorithmsCycle;
import cn.edu.cup.manage.business.Parameters;
import cn.edu.cup.tools.HibernateSessionManager;

public class AlgorithmsCycleDao {
	
	 Session session ;
	
		
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

	public AlgorithmsCycleDao()
	{	session = HibernateSessionManager.getThreadLocalSession();
	}
	
	public AlgorithmsCycle getAlgorithmDetail(int ID){
		SQLQuery q=session.createSQLQuery("select t1.ID,t1.InputID,t1.PlanID,t1.OutputID,t1.AuthorID,t2.Username,t1.Description,t1.AddTime,t1.LastUpdateTime,t1.Name,t1.ClassName,t1.alg_type,t1.structFileIn,t1.structFileOut from t_algorithmscycle t1,t_user t2 where t1.AuthorID=t2.ID and t1.ID=?");
		q.setParameter(0, ID);
		List l =q.list();
		try{
		Object[] row=(Object[]) l.get(0);
		String id = ((Integer)row[0]).toString();
		String iid = ((Integer)row[1]).toString();
		String pid = ((Integer)row[2]).toString();
		String oid=((Integer)row[3]).toString();
		String aid=((Integer)row[4]).toString();
		String author=(String)row[5];
		String description=(String)row[6];
		Date addTime=(Date)row[7];
		  
		Date lastUpdateTime=(Date)row[8];
		String Name=(String)row[9];
		String className=(String)row[10];
		int algtype=(Integer)row[11];
		String structFileIn=(String)row[12];

		String structFileOut=(String)row[13];
		AlgorithmsCycle p=new AlgorithmsCycle(id, iid, pid, oid, aid,author,description,addTime,lastUpdateTime,Name,className);
//		p.setName(Name);
		p.setAlg_type(algtype);
		p.setStructFileIn(structFileIn);
		p.setStructFileOut(structFileOut);
		
		return p;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
		
		  
	}
	
	public List<AlgorithmsCycle> getAlgorithmsList(int page, int rows,
			String sidx, String sord) {
		SQLQuery q = session.createSQLQuery("select t1.ID,t1.InputID,t1.PlanID,t1.OutputID,t1.AuthorID,t2.Username,t1.Description,t1.AddTime,t1.LastUpdateTime,t1.Name,t1.ClassName from t_algorithmscycle t1,t_user t2 where t1.AuthorID=t2.ID order by t1."+sidx+" "+sord);
		if(page>0&&rows>0){
			q.setFirstResult((page-1)*rows);
			q.setMaxResults(rows);
		}
		
		List l = q.list();
		List<AlgorithmsCycle> re=new ArrayList<AlgorithmsCycle>();
		for(int i=0;i<l.size();i++)
		{
			//TestDb user = (TestDb)l.get(i);
			//System.out.println(user.getUsername());

			  Object[] row = (Object[])l.get(i);;
			  String id = ((Integer)row[0]).toString();
			  String iid = ((Integer)row[1]).toString();
			  String pid = ((Integer)row[2]).toString();
			  String oid=((Integer)row[3]).toString();
			  String aid=((Integer)row[4]).toString();
			  String author=(String)row[5];
			  String description=(String)row[6];
			  Date addTime=(Date)row[7];
			  
			  Date lastUpdateTime=(Date)row[8];
			  String Name=(String)row[9];
			  String ClassName=(String)row[10];
			  AlgorithmsCycle p=new AlgorithmsCycle(id, iid, pid, oid, aid,author,description,addTime,lastUpdateTime,Name,ClassName);
//			  p.setName(Name);
			  
			  re.add(p);
		}
		
		return re;
	}

	public int getCountAlgorithms() {
		// TODO Auto-generated method stub
		String sql="select count(*) from t_algorithmscycle t2 ";
		SQLQuery q = session.createSQLQuery(sql);
		Integer count=((BigInteger)q.uniqueResult()).intValue();
		return count;

	}
	public int addAlgorithm(String description, String authorID,String name,String filePath,String className) {
		Date addDate=new Date();
		HibernateSessionManager.getThreadLocalTransaction();
		Query q = session.createSQLQuery("insert into t_algorithmscycle (description,authorID,addtime,LastUpdateTime,inputID,planID,outputID,Name,FilePath,ClassName) values (?,?,?,?,0,0,0,?,?,?)");
		q.setParameter(0, description);
		q.setParameter(1, authorID);
		q.setParameter(2, addDate);
		q.setParameter(3, addDate);
		q.setParameter(4, name);
		q.setParameter(5, filePath);
		q.setParameter(6, className);
		int result=q.executeUpdate();
		
		return result;
	}
	
	public int deleteAlgorithm(int  id) {
		HibernateSessionManager.getThreadLocalTransaction();
		SQLQuery q = session.createSQLQuery("delete from t_algorithmscycle where ID=?");
		q.setParameter(0, id);
		int re=q.executeUpdate();
//		tx.commit();
		return re;
		
	}
	public int getAlgType(int algID){
		String sql="select alg_type from t_algorithmscycle t2 where t2.id=?";
		SQLQuery q = session.createSQLQuery(sql);
		q.setParameter(0, algID);
		Integer count=((Integer)q.uniqueResult()).intValue();
		return count;
	}
	public int updateAlgorithm(int id,String description, String authorID,String name,String filePath,String className) {
		Date updateDate=new Date();
		HibernateSessionManager.getThreadLocalTransaction();
		Query q = session.createSQLQuery("update t_algorithmscycle t set description=?,authorID=?,LastUpdateTime=?,Name=?,FilePath=?,ClassName=? where t.ID=?");
		q.setParameter(0, description);
		q.setParameter(1, authorID);
		q.setParameter(2, updateDate);
		q.setParameter(3, name);
		q.setParameter(4, filePath);
		q.setParameter(5, className);
		q.setParameter(6,id);
		int result=q.executeUpdate();
		
		return result;
	}
	
	public int updateParameter(int iD, String inputID, String planID,
			String outputID, String description,String name) {
		// TODO Auto-generated method stub
		Date modifyTime=new Date();
		HibernateSessionManager.getThreadLocalTransaction();
		SQLQuery q = session.createSQLQuery("update t_algorithmscycle t set inputID=?,planID=?,outputID=?,Description=?,LastUpdateTime=? , Name=? where t.ID=?");
		q.setParameter(0, inputID);
		q.setParameter(1, planID);
		q.setParameter(2, outputID);
		q.setParameter(3, description);

		q.setParameter(4, modifyTime);
		q.setParameter(5, name);
		q.setParameter(6, iD);
		int re=q.executeUpdate();
		
		return re;
	}



	

}
