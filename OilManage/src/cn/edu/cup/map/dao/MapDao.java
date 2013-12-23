package cn.edu.cup.map.dao;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;
import org.hibernate.service.ServiceRegistryBuilder;

import cn.edu.cup.map.business.MapPro;
import cn.edu.cup.test.TestHibernate;

public class MapDao {

	//遍历
	public  void all()
	{
		Query q = session.createSQLQuery("select id,name from Test");
		
		List l = q.list();
		for(int i=0;i<l.size();i++)
		{
			//TestDb user = (TestDb)l.get(i);
			//System.out.println(user.getUsername());

			  Object[] row = (Object[])l.get(i);;
			  Integer id = (Integer)row[0];
			  String name = (String)row[1];  
			  System.out.println(id+" "+name);
		}
	}
	
	//读取
	public  void load()
	{
		TestHibernate obj = (TestHibernate) session.load(TestHibernate.class, new Long(2));
		
			
		
		//System.out.println(obj.getUsername());
	}
	public int addPro(String ProName,String FilePath){
		
		Query q = session.createSQLQuery("insert into T_MapPro (proname,filepath,adddate) values (?,?,now())");
		q.setParameter(0, ProName);
		q.setParameter(1, FilePath);
		int result=q.executeUpdate();
		return result;
	}
	//更新
	public  void update()
	{
		TestHibernate obj = (TestHibernate) session.load(TestHibernate.class, new Long(2));
		//obj.setUsername("cg");
	}
	
	//插入
	public  void insert()
	{
		TestHibernate user = new TestHibernate();
		//user.setUsername("sb");

		session.save(user);
	}
	
	 SessionFactory sessionFactory;
	 Session session ;
	 Transaction tx ;
	

	public MapDao()
	{	
		Configuration cfg = new Configuration();  
        cfg.configure();          
        ServiceRegistry  sr = new ServiceRegistryBuilder().applySettings(cfg.getProperties()).buildServiceRegistry();           
        SessionFactory sessionFactory = cfg.buildSessionFactory(sr);  
                  
		//sessionFactory = new Configuration().configure().buildSessionFactory();
		session = sessionFactory.openSession();
		tx = session.beginTransaction();
	
	}
	
	private  void close()
	{
		tx.commit();
		session.close();
		//sessionFactory.close();
	}

	public List<MapPro> list(int page,int rows) {
		SQLQuery q = session.createSQLQuery("select id,proname,filepath,adddate from t_MapPro");
		q.setFirstResult(page);
		q.setMaxResults(rows);
		List l = q.list();
		List re=new ArrayList<MapPro>();
		for(int i=0;i<l.size();i++)
		{
			//TestDb user = (TestDb)l.get(i);
			//System.out.println(user.getUsername());

			  Object[] row = (Object[])l.get(i);;
			  Integer id = (Integer)row[0];
			  String proName = (String)row[1];  
			  String filePath = (String)row[2];
			  String addDate= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format((java.sql.Timestamp)row[3]);
			  MapPro pro=new MapPro();
			  pro.setId(String.valueOf(id));
			  pro.setProName(proName);
			  pro.setFilePath(filePath);
			  pro.setAddDate(addDate);
			  re.add(pro);
		}
		return re;
	}
}
