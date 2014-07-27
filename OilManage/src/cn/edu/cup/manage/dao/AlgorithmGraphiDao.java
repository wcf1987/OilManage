package cn.edu.cup.manage.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.SQLQuery;
import org.hibernate.Session;

import cn.edu.cup.manage.business.AlgorithmGraphi;
import cn.edu.cup.manage.business.AlgorithmGraphiDetail;
import cn.edu.cup.manage.business.Parameters;
import cn.edu.cup.tools.HibernateSessionManager;

public class AlgorithmGraphiDao {
	
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

	public AlgorithmGraphiDao()
	{	
		session = HibernateSessionManager.getThreadLocalSession();
	
	}

	public List<AlgorithmGraphi> getAlgGraphiList(int CycleID) {
		SQLQuery q = session.createSQLQuery("select t.id,t.graphType,t.graphname from t_algorithmgraph t where t.CycleID=? order by t.graphType asc");
		q.setParameter(0, CycleID);

		List l = q.list();
		List<AlgorithmGraphi> re=new ArrayList<AlgorithmGraphi>();
		for(int i=0;i<l.size();i++)
		{
			//TestDb user = (TestDb)l.get(i);
			//System.out.println(user.getUsername());

			  Object[] row = (Object[])l.get(i);;
			  int id = ((Integer)row[0]);
			  int graphiType = ((Integer)row[1]);
			  String graphiName = ((String)row[2]).toString();
			  AlgorithmGraphi p=new AlgorithmGraphi(id,CycleID,graphiType,graphiName);
			  re.add(p);
		}
		
		return re;
	}
	
	public List<AlgorithmGraphiDetail> getAlgGraphiDetailList(int GraphiID) {
		SQLQuery q = session.createSQLQuery("select t.id,t.paramid,t1.display,t1.type,CONCAT(t2.CName,'(',t2.Symbol,')') from t_graphdetail t,t_parameters t1,t_measure t2  where t.ParamID=t1.ID and t1.measureID=t2.ID and t.graphid=? order by t.id desc");
		q.setParameter(0, GraphiID);

		List l = q.list();
		List<AlgorithmGraphiDetail> re=new ArrayList<AlgorithmGraphiDetail>();
		for(int i=0;i<l.size();i++)
		{
			//TestDb user = (TestDb)l.get(i);
			//System.out.println(user.getUsername());

			  Object[] row = (Object[])l.get(i);;
			  int id = ((Integer)row[0]);
			  int paramid = ((Integer)row[1]);			  
			  String displayName = ((String)row[2]);
			  int type = ((Integer)row[3]);	
			  String displayMess = ((String)row[4]);
			  
			  String typeS=Parameters.getTypeSByNum(type);
			  AlgorithmGraphiDetail p=new AlgorithmGraphiDetail(id,GraphiID,paramid,displayName,typeS,displayMess);
			  re.add(p);
		}
		
		return re;
	}
	

	public int addAlgGraphi(int cycleID, String graphiName, int graphiType) {
		HibernateSessionManager.getThreadLocalTransaction();
		SQLQuery q = session.createSQLQuery("insert into t_algorithmgraph (CycleID,graphType,graphname) values (?,?,?)");
		q.setParameter(0, cycleID);
		q.setParameter(1, graphiType);
		q.setParameter(2, graphiName);
		int re=q.executeUpdate();
		
		return re;
	}

	public int addAlgGraphiDetail(int graphiID, int paramID) {
		HibernateSessionManager.getThreadLocalTransaction();
		SQLQuery q = session.createSQLQuery("insert into t_graphdetail (graphid,ParamID) values (?,?)");
		q.setParameter(0, graphiID);
		q.setParameter(1, paramID);
		int re=q.executeUpdate();
		
		return re;
	}

	public int delAlgGraphi(int graphiID) {
		HibernateSessionManager.getThreadLocalTransaction();
		SQLQuery q = session.createSQLQuery("delete from t_algorithmgraph where ID=?");
		q.setParameter(0, graphiID);
		int re=q.executeUpdate();
		return 0;
	}

	public int delAlgGraphiDetail(int detailId) {
		// TODO Auto-generated method stub
		HibernateSessionManager.getThreadLocalTransaction();
		SQLQuery q = session.createSQLQuery("delete from t_graphdetail where ID=?");
		q.setParameter(0, detailId);
		int re=q.executeUpdate();
		return 0;
	}

	public int updateAlgGraphi(int graphiID, String graphiName) {
		HibernateSessionManager.getThreadLocalTransaction();
		SQLQuery q = session.createSQLQuery("update t_algorithmgraph set graphname=? where id=?");
		q.setParameter(0, graphiName);
		q.setParameter(1, graphiID);
		int re=q.executeUpdate();
		
		return 0;
	}

	public int getGraphiTypeByID(int graphID) {
		SQLQuery q = session.createSQLQuery("select graphType from t_algorithmgraph t where t.id=? ");
		q.setParameter(0, graphID);
		int re=(Integer)q.uniqueResult();
		return re;
	}
	public String getGraphiNameByID(int graphID) {
		SQLQuery q = session.createSQLQuery("select graphName from t_algorithmgraph t where t.id=? ");
		q.setParameter(0, graphID);
		String re=(String)q.uniqueResult();
		return re;
	}
	public List<Integer> getGraphiDetailByInfo(int graphID,String info) {
		SQLQuery q ;
		if (info==null || info.equals("")){
			 q = session.createSQLQuery("select paramID from t_graphdetail t where t.graphid=? ");
			 q.setParameter(0, graphID);
		}else{
			 q = session.createSQLQuery("select paramID from t_graphdetail t where t.graphid=? and t.info=? ");
			 q.setParameter(0, graphID);
			 q.setParameter(1, info);
		}
		

		List l = q.list();
		List<Integer> re=new ArrayList<Integer>();
		for(int i=0;i<l.size();i++)
		{
			//TestDb user = (TestDb)l.get(i);
			//System.out.println(user.getUsername());

			  int id = ((Integer)l.get(i));
			 
			  re.add(id);
		}
		return re;
	}
	
}
