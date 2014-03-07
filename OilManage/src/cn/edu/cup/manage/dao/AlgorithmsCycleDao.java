package cn.edu.cup.manage.dao;

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

public class AlgorithmsCycleDao {
	
	 SessionFactory sessionFactory;
	 Session session ;
	 Transaction tx ;
		
		private  void close()
		{
			tx.commit();
			session.close();
			//sessionFactory.close();
		}

	public AlgorithmsCycleDao()
	{	
		Configuration cfg = new Configuration();  
       cfg.configure();          
       ServiceRegistry  sr = new ServiceRegistryBuilder().applySettings(cfg.getProperties()).buildServiceRegistry();           
       SessionFactory sessionFactory = cfg.buildSessionFactory(sr);  
                 
		//sessionFactory = new Configuration().configure().buildSessionFactory();
		session = sessionFactory.openSession();
		tx = session.beginTransaction();
	
	}
	public List<AlgorithmsCycle> getAlgorithmsList(int page, int rows,
			String sidx, String sord) {
		// TODO Auto-generated method stub
		return null;
	}

	public int getCountAlgorithms() {
		// TODO Auto-generated method stub
		return 0;
	}
	public int addAlgorithm(String description, String authorID) {
		Date addDate=new Date();
		Query q = session.createSQLQuery("insert into t_algorithmscycle (description,authorID,addtime,LastUpdateTime) values (?,?,?,?)");
		q.setParameter(0, description);
		q.setParameter(1, authorID);
		q.setParameter(2, addDate);
		q.setParameter(3, addDate);
		int result=q.executeUpdate();
		
		tx.commit();
		return result;
	}
	
	public int deleteAlgorithm(String  id) {
		SQLQuery q = session.createSQLQuery("delete from t_algorithmscycle where ID=?");
		q.setParameter(0, id);
		int re=q.executeUpdate();
		tx.commit();
		return re;
		
	}


	public int updateParameter(String iD, String inputID, String planID,
			String outputID, String description) {
		// TODO Auto-generated method stub
		Date modifyTime=new Date();
		SQLQuery q = session.createSQLQuery("update t_algorithmscycle t set inputID=?,planID=?,outputID=?,Description=?,LastUpdateTime=? where t.ID=?");
		q.setParameter(0, inputID);
		q.setParameter(1, planID);
		q.setParameter(2, outputID);
		q.setParameter(3, description);

		q.setParameter(4, modifyTime);

		q.setParameter(5, iD);
		int re=q.executeUpdate();
		tx.commit();
		return re;
	}



	

}
