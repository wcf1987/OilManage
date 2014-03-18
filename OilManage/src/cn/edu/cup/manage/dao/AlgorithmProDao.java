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
import cn.edu.cup.manage.business.AlgorithmsCycle;

public class AlgorithmProDao {

	
	 SessionFactory sessionFactory;
	 Session session ;
	 Transaction tx ;
		
	public  void close()
	{
		tx.commit();
		session.close();
		//sessionFactory.close();
	}

	public AlgorithmProDao()
	{	
		Configuration cfg = new Configuration();  
      cfg.configure();          
      ServiceRegistry  sr = new ServiceRegistryBuilder().applySettings(cfg.getProperties()).buildServiceRegistry();           
      SessionFactory sessionFactory = cfg.buildSessionFactory(sr);  
                
		//sessionFactory = new Configuration().configure().buildSessionFactory();
		session = sessionFactory.openSession();
		tx = session.beginTransaction();
	
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
	public int addAlgorithmPro(String description, String authorID,String name) {
		Date addDate=new Date();
		Query q = session.createSQLQuery("insert into t_projects (description,authorID,addtime,name) values (?,?,?,?)");
		q.setParameter(0, description);
		q.setParameter(1, authorID);
		q.setParameter(2, addDate);
		q.setParameter(3, name);
		int result=q.executeUpdate();
		
		tx.commit();
		return result;
	}
	
	public int deletePro(int  id) {
		SQLQuery q = session.createSQLQuery("delete from t_projects where ID=?");
		q.setParameter(0, id);
		int re=q.executeUpdate();
//		tx.commit();
		return re;
		
	}


	public int updatePro(String iD, String name, String description) {
		// TODO Auto-generated method stub
		Date modifyTime=new Date();
		SQLQuery q = session.createSQLQuery("update t_projects t set Name=?, Description=? where t.ID=?");
		q.setParameter(0, name);
		q.setParameter(1, description);


		q.setParameter(2, iD);
		int re=q.executeUpdate();
		tx.commit();
		return re;
	}



	
}
