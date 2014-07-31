package cn.edu.cup.manage.dao;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.Transaction;

import cn.edu.cup.gui.business.GUIPro;
import cn.edu.cup.gui.business.PointProper;
import cn.edu.cup.gui.business.PointType;
import cn.edu.cup.gui.business.PointValue;
import cn.edu.cup.manage.business.Measure;
import cn.edu.cup.manage.dao.PhysicalDao;
import cn.edu.cup.tools.HibernateSessionManager;

public class GUIPointTypeDao {

	 
	 //SessionFactory sessionFactory;
	 Session session ;
	 Transaction tx ;
		

	public GUIPointTypeDao()
	{	
	 
               
		//sessionFactory = new Configuration().configure().buildSessionFactory();
		session = HibernateSessionManager.getThreadLocalSession();
		
	}


	
	public List<PointType> getPointTypeList(int page, int rows,
			String sidx, String sord) {
		
		SQLQuery q = session.createSQLQuery("select t.id,t.type,t.remark,t.path from t_guipointtype t  order by t."+sidx+" "+sord);

		q.setFirstResult((page-1)*rows);
		q.setMaxResults(rows);
		
		

		List l = q.list();
		List<PointType> re=new ArrayList<PointType>();
		for(int i=0;i<l.size();i++)
		{
			//TestDb user = (TestDb)l.get(i);
			//System.out.println(user.getUsername());

			  Object[] row = (Object[])l.get(i);;
			  Integer id = ((Integer)row[0]);
			  String type=((String)row[1]);
			  String remark=((String)row[2]);
			  String path=((String)row[3]);
	
			  PointType p=new PointType(id,type,remark,path);
			  
			  
			  re.add(p);
		}
	
		return re;
	}
	public int getCountPointType() {
		String sql="select count(*) from t_guipointtype t ";
		SQLQuery q = session.createSQLQuery(sql);
		
		Integer count=((BigInteger)q.uniqueResult()).intValue();
		return count;

	}
	
	public int addType(String type,String remark, String path) {
		tx = HibernateSessionManager.getThreadLocalTransaction();
		Query q = session.createSQLQuery("insert into t_guipointtype (type,remark,path) values (?,?,?)");
		q.setParameter(0, type);
		q.setParameter(1, remark);
		q.setParameter(2, path);

		int result=q.executeUpdate();

		return 0;
	}
	public int deleteType(int id) {
		tx = HibernateSessionManager.getThreadLocalTransaction();
		// TODO Auto-generated method stub
		SQLQuery q = session.createSQLQuery("delete from t_guipointtype where ID=?");
		q.setParameter(0, id);
		int re=q.executeUpdate();
//		tx.commit();
		return re;
	}

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




}
