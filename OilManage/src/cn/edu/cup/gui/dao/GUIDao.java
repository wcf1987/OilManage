package cn.edu.cup.gui.dao;

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

import cn.edu.cup.gui.business.GUIPro;
import cn.edu.cup.gui.business.PointProper;
import cn.edu.cup.gui.business.PointValue;
import cn.edu.cup.manage.business.CalcInfo;
import cn.edu.cup.manage.business.Measure;
import cn.edu.cup.manage.dao.ParameterDao;
import cn.edu.cup.manage.dao.PhysicalDao;

public class GUIDao {

	
	 SessionFactory sessionFactory;
	 Session session ;
	 Transaction tx ;
		
	public  void close()
	{
		tx.commit();
		session.close();
		//sessionFactory.close();
	}
	public  void roll()
	{
		tx.rollback();

		//sessionFactory.close();
	}
	public GUIDao()
	{	
	 Configuration cfg = new Configuration();  
     cfg.configure();          
     ServiceRegistry  sr = new ServiceRegistryBuilder().applySettings(cfg.getProperties()).buildServiceRegistry();           
     SessionFactory sessionFactory = cfg.buildSessionFactory(sr);  
               
		//sessionFactory = new Configuration().configure().buildSessionFactory();
		session = sessionFactory.openSession();
		tx = session.beginTransaction();
	}
	
	public List<PointValue> getPointPraList(int pro_id,String name,String type,int page, int rows,
			String sidx, String sord) {
		String sql="select count(*) from t_guipointvalue t where t.pro_id=? and t.point_name=? and t.point_type=?";
		SQLQuery q = session.createSQLQuery(sql);
		q.setParameter(0, pro_id);
		q.setParameter(1, name);
		q.setParameter(2, type);
		Integer count=((BigInteger)q.uniqueResult()).intValue();
		if(count==0){
			q = session.createSQLQuery("insert INTO t_guipointvalue (pro_id,point_name,point_type,proper_id,par_value,par_ISOValue,point_id) select ?,?,t1.point_type,t1.id,0,0,0 from t_guipointproper t1 where t1.point_type=?");
			q.setParameter(0, pro_id);
			q.setParameter(1, name);
			q.setParameter(2, type);
			q.executeUpdate();
		}
			q = session.createSQLQuery("select t1.id,t2.par_name,t2.par_display,t1.par_value,t1.par_ISOValue,t3.CName,t3.Symbol from t_guipointvalue t1,t_guipointproper t2,t_measure t3 WHERE t1.proper_id=t2.id and t2.par_messID=t3.ID and t1.point_name=? and t1.pro_id=? and t1.point_type=? order by t1."+sidx+" "+sord);
			q.setParameter(0, name);
			q.setParameter(1, pro_id);
			q.setParameter(2, type);
			q.setFirstResult((page-1)*rows);
			q.setMaxResults(rows);
		
		

		List l = q.list();
		List<PointValue> re=new ArrayList<PointValue>();
		for(int i=0;i<l.size();i++)
		{
			//TestDb user = (TestDb)l.get(i);
			//System.out.println(user.getUsername());

			  Object[] row = (Object[])l.get(i);;
			  Integer id = ((Integer)row[0]);
			  String par_name=((String)row[1]);
			  String par_display=((String)row[2]);
			  double par_value=(Double)row[3];
			  double par_ISOValue=(Double)row[4];
			  String measure_CName=((String)row[5]);
			  String measure_Symbol=((String)row[6]);
  
			  PointValue p=new PointValue(id,par_display,par_name,par_value,par_ISOValue,measure_CName,measure_Symbol);
			  
			  
			  re.add(p);
		}
		tx.commit();
		return re;
	}
	
	public int getCountPointPras(String pointType) {
		// TODO Auto-generated method stub
		String sql="select count(*) from t_guipointproper t where t.point_type=?";
		SQLQuery q = session.createSQLQuery(sql);
		q.setParameter(0, pointType);
		Integer count=((BigInteger)q.uniqueResult()).intValue();
		return count;

	}
	
	public int updatePointPra(int iD, double par_value) {
		// TODO Auto-generated method stub
//		Date modifyTime=new Date();
		String sql="select max(t1.par_messID) from t_guipointproper t1,t_guipointvalue t2 where t2.id=? and t2.proper_id=t1.id ";
		SQLQuery q = session.createSQLQuery(sql);
		q.setParameter(0, iD);
//		Object a = q.uniqueResult();
		
		Integer messid= (Integer) q.uniqueResult();
		
		
		PhysicalDao phydao=new PhysicalDao();
		Measure m=phydao.getMess(messid);
		double ISOvalue=m.getRatioA()*par_value+m.getRatioB();
		phydao.close();
		q = session.createSQLQuery("update t_guipointvalue t set par_value=?, par_ISOvalue=? where t.ID=?");
		q.setParameter(2, iD);
		q.setParameter(0, par_value);
		q.setParameter(1, ISOvalue);
		int re=q.executeUpdate();
		tx.commit();
		return re;
	}
	
	public List<GUIPro> getGUIProsList(int page, int rows,
			String sidx, String sord) {
		SQLQuery q = session.createSQLQuery("select t1.ID,t1.name,t1.Description,t1.AuthorID,t2.Username,t1.AddTime from t_guipro t1,t_user t2 where t1.AuthorID=t2.ID order by t1."+sidx+" "+sord);

		q.setFirstResult((page-1)*rows);
		q.setMaxResults(rows);
		List l = q.list();
		List<GUIPro> re=new ArrayList<GUIPro>();
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
			  
			  
			  
			  GUIPro p=new GUIPro(id, proname,aid,author,description,addTime);
			  
			  
			  re.add(p);
		}
		
		return re;
	}

	public int getCountGUIPros() {
		// TODO Auto-generated method stub
		String sql="select count(*) from t_guipro t2 ";
		SQLQuery q = session.createSQLQuery(sql);
		Integer count=((BigInteger)q.uniqueResult()).intValue();
		return count;

	}

	
	public int deletePro(int  id) {
		SQLQuery q = session.createSQLQuery("delete from t_guipro where ID=?");
		q.setParameter(0, id);
		int re=q.executeUpdate();
//		tx.commit();
		return re;
		
	}


	public int updatePro(int iD, String data,Date modifyTime,String ScalN) {
		// TODO Auto-generated method stub
		
		SQLQuery q = session.createSQLQuery("update t_guipro t set addtime=? where t.ID=?");
		q.setParameter(1, iD);
		q.setParameter(0, modifyTime);
		
		int re=q.executeUpdate();
		q = session.createSQLQuery("update t_guijson t set JSONData=?,ScalN=?  where t.ID=?");
		q.setParameter(2, iD);
		
		q.setParameter(0, data);
		q.setParameter(1, ScalN);
		re=q.executeUpdate();
		
		return re;
	}
	
	public int searchProAlg(int proID){
		Query q=session.createSQLQuery("select t.algorithm_id from t_projects t where t.ID=?");
		q.setParameter(0, proID);
		int result=0;
		result=(Integer) q.uniqueResult(); 
		tx.commit();
		return result;
	}


	public GUIPro getGUIProView(int pro_id) {
		// TODO Auto-generated method stub
		SQLQuery q = session.createSQLQuery("select t1.ID,t1.name,t1.Description,t1.AuthorID,t2.Username,t1.AddTime ,t3.JSONData , t3.ScalN from t_guipro t1,t_user t2,t_guijson t3 where t1.AuthorID=t2.ID and t1.id=? and t1.id=t3.id");
		q.setParameter(0, pro_id);
		GUIPro temp=null;
		List l = q.list();
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
			  String jsondata=(String)row[6];
			  Double ScalN=(Double)row[7];
			  temp=new GUIPro(id, proname, aid, author, description, addTime);
			  temp.setScalN(ScalN);
			  temp.setJSONData(jsondata);
			  return temp;
			 
			  
		}
		
		
		return temp;
	}

	public void updateProInfo(int id) {
		Date modifyTime=new Date();
		SQLQuery q = session.createSQLQuery("update t_projects t set t.CalcHisNum=(select count(*) from t_calchis t1 where t1.Pro_ID=?),t.LastCalcTime=(select max(t2.Calc_EndTime) from t_calchis t2 where t2.Pro_ID=?) where t.ID=?");
		
		q.setParameter(0, id);
		q.setParameter(1, id);
		q.setParameter(2, id);
		int re=q.executeUpdate();
		
		
	}
	
	public int searchProByName(String name){
		Query searchQuery = session.createSQLQuery("select count(t.id) from t_guipro t where t.name=?");
		searchQuery.setParameter(0, name);
		int searchCou=((BigInteger)searchQuery.uniqueResult()).intValue();
		return searchCou;
	}
	
	public int addPro(String description,String name, String data, Date date, int authorID,int type) {
		Date addDate=new Date();
		Query q = session.createSQLQuery("insert into t_guipro (description,authorID,addtime,name,type) values (?,?,?,?,?)");
		q.setParameter(0, description);
		q.setParameter(1, authorID);
		q.setParameter(2, addDate);
		q.setParameter(3, name);
		q.setParameter(4, type);
		int result=q.executeUpdate();	
		
		int ret_id = 0;
		Query q2 = session.createSQLQuery("select LAST_INSERT_ID()");
		ret_id = ((BigInteger) q2.uniqueResult()).intValue();
		
		q = session.createSQLQuery("insert into t_guijson (id,JSONData,ScalN) values (?,?,1)");
		q.setParameter(0, ret_id);
		q.setParameter(1, data);
		result=q.executeUpdate();
		tx.commit();
		return ret_id;
		
	}
	public void clearOld(int id){
		Query q = session.createSQLQuery("update t_guipoint t set t.statusNow=-1 where t.statusNow=1 and t.pro_id=?");
		q.setParameter(0, id);
		int result=q.executeUpdate();
		q = session.createSQLQuery("update t_guiconnect t set t.statusNow=-1 where t.statusNow=1 and t.pro_id=?");
		q.setParameter(0, id);
		result=q.executeUpdate();
	}
	public void addPoint(int iD, String name, int type, String typeName,Date addDate) {
		// TODO Auto-generated method stub
		
		
		Query q = session.createSQLQuery("insert into t_guipoint (pro_id,name,type,typename,statusNow,updateTime) values (?,?,?,?,?,?)");
		q.setParameter(0, iD);
		q.setParameter(1, name);
		q.setParameter(2, type);
		q.setParameter(3, typeName);
		q.setParameter(4, 1);
		q.setParameter(5, addDate);
		int result=q.executeUpdate();
		
		
		Query q2 = session.createSQLQuery("select LAST_INSERT_ID()");
		int ret_id = ((BigInteger) q2.uniqueResult()).intValue();
		
		
		q = session.createSQLQuery("UPDATE t_guipointvalue t set t.point_id=? where t.pro_id=? and t.point_name=? and t.point_type=? ");
		q.setParameter(0, ret_id);
		q.setParameter(1, iD);
		q.setParameter(2, name);
		q.setParameter(3, typeName);
		result=q.executeUpdate();
	}

	public void addConnect(int iD, String left, String right,Date addDate) {
		// TODO Auto-generated method stub
		int left_id=getPointIDByName(left,iD);
		int right_id=getPointIDByName(right,iD);
		Query q = session.createSQLQuery("insert into t_guiconnect (pro_id,left_id,pointleft,right_id,pointright,statusNow,updateTime) values (?,?,?,?,?,?,?)");
		q.setParameter(0, iD);
		q.setParameter(1, left_id);
		q.setParameter(2, left);
		q.setParameter(3, right_id);
		q.setParameter(4, right);
		q.setParameter(5, 1);
		q.setParameter(6, addDate);
		int result=q.executeUpdate();
	}
	public int getPointIDByName(String name,int pro_id) {
		// TODO Auto-generated method stub
		
		Query q=session.createSQLQuery("select t1.id from t_guipoint t1 where t1.pro_id=? and t1.statusNow=1 and t1.name=?");
		q.setParameter(0, pro_id);

		q.setParameter(1, name);

		int result=0;
		result=(Integer) q.uniqueResult(); 
		return result;
	}
	
	/**
	 * 用来生成GUI空间的属性列表
	 * @param page
	 * @param rows
	 * @param sidx
	 * @param sord
	 * @return
	 */
	public List<PointProper> getPointProperList(int page, int rows,
			String sidx, String sord) {
		
		
		 SQLQuery q = session.createSQLQuery("select t2.id,t2.point_type,t2.par_name,t2.par_display,t3.CName,t3.Symbol,t3.ID mess_id from t_guipointproper t2,t_measure t3 WHERE t2.par_messID=t3.ID  order by t2."+sidx+" "+sord);

			q.setFirstResult((page-1)*rows);
			q.setMaxResults(rows);
		
		

		List l = q.list();
		List<PointProper> re=new ArrayList<PointProper>();
		for(int i=0;i<l.size();i++)
		{
			//TestDb user = (TestDb)l.get(i);
			//System.out.println(user.getUsername());

			  Object[] row = (Object[])l.get(i);;
			  Integer id = ((Integer)row[0]);
			  String point_type=((String)row[1]);
			  String par_name=((String)row[2]);
			  String par_display=((String)row[3]);
	
			  String measure_CName=((String)row[4]);
			  String measure_Symbol=((String)row[5]);
			  Integer mess_id = ((Integer)row[6]);
			  PointProper p=new PointProper(id,point_type,par_display,par_name,measure_CName,measure_Symbol,mess_id);
			  
			  
			  re.add(p);
		}
		tx.commit();
		return re;
	}
	public int getCountPointProper() {
		String sql="select count(*) from t_guipointproper t ";
		SQLQuery q = session.createSQLQuery(sql);
		
		Integer count=((BigInteger)q.uniqueResult()).intValue();
		return count;

	}
	public int addProper(String point_type,String par_name, String par_display,
			 int measure_id) {
		Query q = session.createSQLQuery("insert into t_guipointproper (point_type,par_name,par_display,par_messID) values (?,?,?,?)");
		q.setParameter(0, point_type);
		q.setParameter(1, par_name);
		q.setParameter(2, par_display);
		q.setParameter(3, measure_id);

		int result=q.executeUpdate();
		tx.commit();
		return 0;
	}
	public int deleteProper(int id) {
		// TODO Auto-generated method stub
		SQLQuery q = session.createSQLQuery("delete from t_guipointproper where ID=?");
		q.setParameter(0, id);
		int re=q.executeUpdate();
//		tx.commit();
		return re;
	}




}
