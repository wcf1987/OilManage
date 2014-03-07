package cn.edu.cup.manage.dao;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.print.attribute.standard.MediaSize.ISO;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;
import org.hibernate.service.ServiceRegistryBuilder;

import cn.edu.cup.manage.business.Measure;
import cn.edu.cup.manage.business.Physical;
import cn.edu.cup.manage.business.Style;
import cn.edu.cup.map.business.Graphi;
import cn.edu.cup.map.business.Line;
import cn.edu.cup.map.business.Point;
import cn.edu.cup.test.TestHibernate;

public class PhysicalDao {


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
	public int addPhysical(String CName,String EName, String Description,String ISOBasicUnit){
		
		Query q = session.createSQLQuery("insert into T_Physical (CName,EName,Description,ISOBasicUnit) values (?,?,?,?)");
		q.setParameter(0, CName);
		q.setParameter(1, EName);
		q.setParameter(2, Description);
		q.setParameter(3, ISOBasicUnit);
		int result=q.executeUpdate();
		
		tx.commit();
		return result;
	}
	
	
	
	
	
	
	public int addMessure(String PhysicalID,String EName,String CName,String Symbol,String RatioA,String RatioB,String styleID) {
		Query q = session.createSQLQuery("insert into T_Measure (PhysicalID,EName,CName,Symbol,RatioA,RatioB,StyleID) values (?,?,?,?,?,?,?)");
		q.setParameter(0, PhysicalID);
		q.setParameter(1, EName);
		q.setParameter(2, CName);
		q.setParameter(3, Symbol);
		q.setParameter(4, RatioA);
		q.setParameter(5, RatioB);
		q.setParameter(6, styleID);
		int result=q.executeUpdate();
		
		tx.commit();
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
	

	public PhysicalDao()
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
	public void commit(){
		tx.commit();
		session.close();
	}
	public int getCountMessure(){
		SQLQuery q = session.createSQLQuery("select count(*) from T_Measure");
		Integer a=((BigInteger)q.uniqueResult()).intValue();
		return a;
	}
	public int getCountPhysical(){
		SQLQuery q = session.createSQLQuery("select count(*) from T_Physical");
		Integer a=((BigInteger)q.uniqueResult()).intValue();
		return a;
	}





	public List<Measure> getMessureList(int page,int rows,String sidx,String sord) {
		SQLQuery q = session.createSQLQuery("select t1.ID mid,t1.CName mCName,t1.EName mEName,t1.RatioA,t1.RatioB,t1.Symbol,t2.ID pid,t2.CName pCName,t2.EName pEName,t2.Description,t2.ISOBasicUnit,t3.StyleID,t3.StyleName from T_Measure t1,T_Physical t2,T_PhysicalStyle t3 where t1.PhysicalID=t2.ID and t1.StyleID=t3.StyleID order by t1."+sidx+" "+sord);

		q.setFirstResult((page-1)*rows);
		q.setMaxResults(rows);
		List l = q.list();
		List<Measure> re=new ArrayList<Measure>();
		for(int i=0;i<l.size();i++)
		{
			//TestDb user = (TestDb)l.get(i);
			//System.out.println(user.getUsername());

			  Object[] row = (Object[])l.get(i);;
			  Integer mid = (Integer)row[0];
			  String mCName = (String)row[1];  
			  String mEName = (String)row[2];  
			  Double ra=(Double)row[3];
			  Double rb=(Double)row[4];
			  String mSymbol = (String)row[5]; 
			  Integer pid = (Integer)row[6];
			  String pCName = (String)row[7];  
			  String pEName = (String)row[8]; 
			  String Descrip = (String)row[9];  
			  String punit = (String)row[10]; 
			  
			  Integer sid = (Integer)row[11];
			  String sName = (String)row[12];  
			  
			  Physical phy=new Physical(pid, pCName, pEName, Descrip, punit);
			  Style style=new Style(sid, sName);
			  Measure m=new Measure(mid, pid, phy, style, mEName, mCName, mSymbol, ra, rb, sid);
			  
			  
			  re.add(m);
		}
		
		return re;
	}

	public List<Physical> getPhysicalList(int page,int rows,String sidx,String sord) {
		SQLQuery q = session.createSQLQuery("select t2.ID,t2.CName,t2.EName,t2.Description,t2.ISOBasicUnit from T_Physical t2 order by t2."+sidx+" "+sord);
		q.setFirstResult((page-1)*rows);
		q.setMaxResults(rows);
		List l = q.list();
		List<Physical> re=new ArrayList<Physical>();
		for(int i=0;i<l.size();i++)
		{
			//TestDb user = (TestDb)l.get(i);
			//System.out.println(user.getUsername());

			  Object[] row = (Object[])l.get(i);
			  
			  Integer pid = (Integer)row[0];
			  String pCName = (String)row[1];  
			  String pEName = (String)row[2]; 
			  String Descrip = (String)row[3];  
			  String punit = (String)row[4]; 
			  
			  
			  
			  Physical phy=new Physical(pid, pCName, pEName, Descrip, punit);
			  
			  
			  re.add(phy);
		}
		
		return re;
	}
	
	public int deleteMessure(String  id) {
		SQLQuery q = session.createSQLQuery("delete from T_Measure where ID=?");
		q.setParameter(0, id);
		int re=q.executeUpdate();
		tx.commit();
		return re;
		
	}
	public int deletePhysical(int id) {
		SQLQuery q = session.createSQLQuery("delete from T_Physical where ID=?");
		q.setParameter(0, id);
		int re=q.executeUpdate();
		
		
		return re;
		
	}

	public int updatePhysical(String iD, String cName, String eName,
			String description, String iSOBasicUnit) {
		// TODO Auto-generated method stub
		SQLQuery q = session.createSQLQuery("update T_Physical t set EName=?,CName=?,description=?,iSOBasicUnit=? where t.ID=?");
		q.setParameter(0, eName);
		q.setParameter(1, cName);
		q.setParameter(2, description);
		q.setParameter(3, iSOBasicUnit);
		q.setParameter(4, iD);
		int re=q.executeUpdate();
		tx.commit();
		return re;
	}

	public int updateMessure(String id, String physicalID, String eName,
			String cName, String symbol, String ratioA, String ratioB,
			String styleID) {
		// TODO Auto-generated method stub
		SQLQuery q = session.createSQLQuery("update T_Measure set physicalID=?,eName=?,cName=?,symbol=?,ratioA=?,ratioB=?,styleID=? where id=?");
		q.setParameter(0, physicalID);
		q.setParameter(1, eName);
		q.setParameter(2, cName);
		q.setParameter(3, symbol);
		q.setParameter(4, ratioA);
		q.setParameter(0, ratioB);
		q.setParameter(1, styleID);
		q.setParameter(2, id);
		int re=q.executeUpdate();
		tx.commit();
		return re;
		
	}


}
