package cn.edu.cup.manage.dao;

// default package

import java.math.BigInteger;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Table;  
import javax.persistence.TableGenerator;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;
import org.hibernate.service.ServiceRegistryBuilder;

import cn.edu.cup.manage.business.Style;
import cn.edu.cup.manage.business.User;
import cn.edu.cup.map.business.Line;
import cn.edu.cup.map.business.MapPro;
import cn.edu.cup.test.TestHibernate;
import cn.edu.cup.tools.HibernateSessionManager;


public class UserDao  {
    
	//property constants
	public static final String USERNAME = "username";
	public static final String PASSWORD = "password";
	public static final String USERGROUPID = "usergroupid";
	public static final String EMAIL = "email";
	public static final String STATE = "state";
	public static final String INFO = "info";
		

	public UserDao()
	{	
		
		session = HibernateSessionManager.getThreadLocalSession();
		
	
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
			  //System.out.println(id+" "+name);
		}
	}
	
	//读取
	public  void load()
	{
		TestHibernate obj = (TestHibernate) session.load(TestHibernate.class, new Long(2));
		
			
		
		//System.out.println(obj.getUsername());
	}
	
	public int addUser(String username,String password){

		HibernateSessionManager.getThreadLocalTransaction();
		Query q = session.createSQLQuery("insert into T_User (username,password) values (?,?)");
		q.setParameter(0, username);
		q.setParameter(1, password);
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
	
	 
	 Session session ;
	
	

	public void initDao()
	{	
		session = HibernateSessionManager.getThreadLocalSession();
	
	}
	

	public int getCountUser(){
		SQLQuery q = session.createSQLQuery("select count(*) from t_user");
		Integer a=((BigInteger)q.uniqueResult()).intValue();
		return a;
	}
	
	public User searchUser(String name,String pass,String type){
	
		User userR=null;
		try {
		        Query query = session.createSQLQuery("select * from t_user s where s.username=? and s.password=?");
		        query.setParameter(0, name);
		        query.setParameter(1, pass);
		        
		        List users=new ArrayList<User>();
				List l = query.list();
				for(int i=0;i<l.size();i++)
				{
					//TestDb user = (TestDb)l.get(i);
					//System.out.println(user.getUsername());

					  Object[] row = (Object[])l.get(i);;
					  int id = (Integer) row[0];
					  String username = (String)row[1];  
					  String password = (String)row[2];
					  User user=new User();
					  user.setUserid(id);
					  user.setUsername(username);
					  user.setPassword(password);
					  users.add(user);
				}
				if(!users.isEmpty()){
					userR=new User();
					userR=(User)users.get(0);
				}
				
				} catch (Exception e) {
			e.printStackTrace();
		}		
		return userR;
	}
	
	public List<User> getUserList(int flag) {
		SQLQuery q;
		if(flag==0){
			q = session.createSQLQuery("select t.ID,t.username,t.AddTime,t.LastLoginTime,t.LoginTimes from t_user t where t.ID not in (select t1.user_id from t_userrole t1)");
		}else{
			q = session.createSQLQuery("select t.ID,t.username,t.AddTime,t.LastLoginTime,t.LoginTimes from t_user t");
		}		
		List l = q.list();
		List<User> re=new ArrayList<User>();
		for(int i=0;i<l.size();i++)
		{
			  Object[] row = (Object[])l.get(i);
			  Integer uid = (Integer)row[0];
			  String uName = (String)row[1];  
			  Date addTime=(Date)row[2];
			  Date lastLoginTime=(Date)row[3];
			  int loginTimes=0;
			  if(row[4]!=null){
				 loginTimes=(Integer)row[4];
			  }  
			  User user=new User(uid, uName,addTime,lastLoginTime,loginTimes); 
			  re.add(user);
		}
		return re;
	}
	
	public Boolean findByUsername(String name){
		SQLQuery q=session.createSQLQuery("select count(*) from t_user t where t.username=?");
		q.setParameter(0, name);
		int count=((BigInteger)q.uniqueResult()).intValue();
		if(count>0){
			return true;
		}else{
			return false;
		}
	}


	public int delUser(int userID) {
//		tx = session.beginTransaction();

		HibernateSessionManager.getThreadLocalTransaction();
		Query q = session.createSQLQuery(" delete from t_user where id=?");
		q.setParameter(0, userID);
		int result=q.executeUpdate();		
		Query q1 = session.createSQLQuery(" delete from t_userrole where user_id=?");
		q1.setParameter(0, userID);
		int result1=result;
		try{
			result1=q1.executeUpdate();	
		}catch(Exception e){
			e.printStackTrace();
		}
//		this.commit();
		return result1;
	}

	public static String getUSERNAME() {
		return USERNAME;
	}

	public static String getPASSWORD() {
		return PASSWORD;
	}

	public static String getUSERGROUPID() {
		return USERGROUPID;
	}

	public static String getEMAIL() {
		return EMAIL;
	}

	public static String getSTATE() {
		return STATE;
	}

	public static String getINFO() {
		return INFO;
	}

}