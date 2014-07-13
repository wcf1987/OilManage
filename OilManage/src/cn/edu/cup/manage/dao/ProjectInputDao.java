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

import cn.edu.cup.manage.business.ProjectInputs;
import cn.edu.cup.tools.HibernateSessionManager;
import cn.edu.cup.tools.Tools;

public class ProjectInputDao {


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

	public ProjectInputDao()
	{	
		session = HibernateSessionManager.getThreadLocalSession();
	
	}
	

	public ProjectInputs searchInput(int iD) {
		// TODO Auto-generated method stub
		Date modifyTime=new Date();
		SQLQuery q = session.createSQLQuery("select t1.ID,t1.par_display,t1.par_id,t1.par_messID,t1.par_name,t1.par_value,t1.Pro_ID,CONCAT(t2.CName,'(',t2.Symbol,')'),par_type,par_listUUID from t_projectinputs t1,t_measure t2 where t1.par_messID=t2.ID and t1.ID=? ");
		q.setParameter(0, iD);
		Object[] row=(Object[]) q.uniqueResult();
		Integer id = ((Integer)row[0]);
	    String display = ((String)row[1]);
		Integer parid = ((Integer)row[2]);
		Integer meid = ((Integer)row[3]);
		String name=(String)row[4];
		double vaule=(Double)row[5];
		Integer pid = ((Integer)row[6]);
		String messSymbol=(String)row[7];

		  int type=(Integer)row[8];

		  String listUUID=(String)row[9];
		ProjectInputs p=new ProjectInputs(id,display,parid,meid,name,vaule,pid,messSymbol,type,listUUID);
		return p;
	}
	
	public List<ProjectInputs> getProInputsList(int pro_id,int page, int rows,
			String sidx, String sord) {
		SQLQuery q = session.createSQLQuery("select t1.ID,t1.par_display,t1.par_id,t1.par_messID,t1.par_name,t1.par_value,t1.Pro_ID,CONCAT(t2.CName,'(',t2.Symbol,')'),t1.type,t1.par_type,t1.par_listUUID from t_projectinputs t1,t_measure t2 where t1.par_messID=t2.ID and t1.Pro_ID=? order by t1."+sidx+" "+sord);
		q.setParameter(0, pro_id);
		q.setFirstResult((page-1)*rows);
		q.setMaxResults(rows);
		List l = q.list();
		List<ProjectInputs> re=new ArrayList<ProjectInputs>();
		for(int i=0;i<l.size();i++)
		{
			//TestDb user = (TestDb)l.get(i);
			//System.out.println(user.getUsername());

			  Object[] row = (Object[])l.get(i);;
			  Integer id = ((Integer)row[0]);
			  String display = ((String)row[1]);
			  Integer parid = ((Integer)row[2]);
			  Integer meid = ((Integer)row[3]);
			  String name=(String)row[4];
			  double vaule=(Double)row[5];
			  Integer pid = ((Integer)row[6]);
			  String messSymbol=(String)row[7];

			  int type=(Integer)row[8];

			  String listUUID=(String)row[9];
			  
			  ProjectInputs p=new ProjectInputs(id,display,parid,meid,name,vaule,pid,messSymbol,type,listUUID);
			  if(type==1){
				  
				  p.setValuelist(getListValueByUUID(listUUID));
			  }
			  
			  re.add(p);
		}
		
		return re;
	}
	public List<Double> getListValueByUUID(String UUID){
		List<Double> list=new ArrayList<Double>();
		SQLQuery q = session.createSQLQuery("select t1.list_index,t1.list_value from t_projectinputlist t1 where  t1.UUID=? order by t1.list_index desc");
		q.setParameter(0, UUID);
		List l = q.list();
		for(int i=0;i<l.size();i++)
		{
			//TestDb user = (TestDb)l.get(i);
			//System.out.println(user.getUsername());

			  Object[] row = (Object[])l.get(i);;
			  Integer id = ((Integer)row[0]);
			  double value=(Double)row[1];
			  list.add(value);
		}
		return list;
	}
	public int getCountProInputs(int proid) {
		// TODO Auto-generated method stub
		String sql="select count(*) from t_projectinputs t2 where t2.pro_id=? ";
		SQLQuery q = session.createSQLQuery(sql);
		q.setParameter(0, proid);
		Integer count=((BigInteger)q.uniqueResult()).intValue();
		return count;

	}
	public int addInput(int pro_id,int param_id,double value) {
		ParameterDao pDao=new ParameterDao();
		
		
		HibernateSessionManager.getThreadLocalTransaction();

		double ISOValue=pDao.getISOValue(param_id, value);
		Query q = session.createSQLQuery("INSERT into t_projectinputs  select NULL,?,t1.id,t1.display,?,t1.name,t1.measureID,?,0,0 from t_parameters t1 where t1.ID=?;");
		q.setParameter(0, pro_id);
		q.setParameter(1, value);
		q.setParameter(2, ISOValue);
		q.setParameter(3, param_id);
		
		int result=q.executeUpdate();
		
		int ret_id=0; 
		Query q2 = session.createSQLQuery("select LAST_INSERT_ID()"); 
		ret_id=((BigInteger) q2.uniqueResult()).intValue();
		return ret_id;
		
	}
	public int addInput(int pro_id,int param_id,List<Double> value) {
		ParameterDao pDao=new ParameterDao();
		
		
		HibernateSessionManager.getThreadLocalTransaction();
		String ListID=Tools.getUUID();
		Query q = session.createSQLQuery("INSERT into t_projectinputs  select NULL,?,t1.id,t1.display,0,t1.name,t1.measureID,0,1,? from t_parameters t1 where t1.ID=?;");
		q.setParameter(0, pro_id);
		q.setParameter(1, ListID);
		q.setParameter(2, param_id);
		
		int result=q.executeUpdate();
		
		int ret_id=0; 
		Query q2 = session.createSQLQuery("select LAST_INSERT_ID()"); 
		ret_id=((BigInteger) q2.uniqueResult()).intValue();
		
		for(int i=0;i<value.size();i++){
			double ISOValue=pDao.getISOValue(param_id, value.get(i));
			q = session.createSQLQuery("INSERT into t_projectinputlist  (UUID,pro_id,par_id,list_index,list_value,list_ISOValue) values(?,?,?,?,?,?)");

			q.setParameter(0, ListID);
			q.setParameter(1, pro_id);
			q.setParameter(2, param_id);
			q.setParameter(3, i);
			q.setParameter(4, value.get(i));
			q.setParameter(5, ISOValue);
			
			result=q.executeUpdate();
		}
		
		return ret_id;
		
		
	}
	public int deleteInput(int  id) {

		HibernateSessionManager.getThreadLocalTransaction();
		SQLQuery q = session.createSQLQuery("delete from t_projectinputs where ID=?");
		q.setParameter(0, id);
		int re=q.executeUpdate();
//		tx.commit();
		return re;
		
	}


	public int updateInput(int iD, double value) {
		// TODO Auto-generated method stub

		HibernateSessionManager.getThreadLocalTransaction();
		Date modifyTime=new Date();
		int paramID=getParamID(iD);
		ParameterDao pDao=new ParameterDao();
		
		double ISOValue=pDao.getISOValue(paramID, value);
		
		SQLQuery q = session.createSQLQuery("update t_projectinputs t set t.par_value=?,t.par_ISOValue=? where t.ID=?");
		q.setParameter(0, value);

		q.setParameter(1, ISOValue);
		q.setParameter(2, iD);
		int re=q.executeUpdate();

		return re;
	}

	public int getParamID(int id){
		String sql="select t2.par_id from t_projectinputs t2 where t2.id=?";
		SQLQuery q = session.createSQLQuery(sql);
		q.setParameter(0, id);
		Integer paramid=((Integer)q.uniqueResult()).intValue();
		return paramid;

	}
}
