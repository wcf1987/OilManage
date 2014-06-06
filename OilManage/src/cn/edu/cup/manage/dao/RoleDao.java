package cn.edu.cup.manage.dao;

import java.math.BigInteger;
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

import cn.edu.cup.manage.business.AlgRoleBase;
import cn.edu.cup.manage.business.RoleBase;
import cn.edu.cup.manage.business.User;
import cn.edu.cup.test.TestHibernate;

public class RoleDao {


		

	public RoleDao()
	{	
		Configuration cfg = new Configuration();  
        cfg.configure();          
        ServiceRegistry  sr = new ServiceRegistryBuilder().applySettings(cfg.getProperties()).buildServiceRegistry();           
        SessionFactory sessionFactory = cfg.buildSessionFactory(sr);  
                  
		//sessionFactory = new Configuration().configure().buildSessionFactory();
		session = sessionFactory.openSession();
		
	
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
			  System.out.println(id+" "+name);
		}
	}
	
	//读取
	public  void load()
	{
		TestHibernate obj = (TestHibernate) session.load(TestHibernate.class, new Long(2));
		
			
		
		//System.out.println(obj.getUsername());
	}
	
	public int addUser(String username,String password,int usergroupid,String email,String state,String info){
		
		Query q = session.createSQLQuery("insert into T_User (username,password,usergroupid,email,state,info) values (?,?,?,?,?,?)");
		q.setParameter(0, username);
		q.setParameter(1, password);
		q.setParameter(2, usergroupid);
		q.setParameter(3, email);
		q.setParameter(4, state);
		q.setParameter(5, info);
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
	

	public void initDao()
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
		session.close();
		//sessionFactory.close();
	}
	private  void commit()
	{
		tx.commit();
		session.close();
		//sessionFactory.close();
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
	
	public List<User> getUserList() {
		SQLQuery q = session.createSQLQuery("select t.ID,t.username from t_user t");
		List l = q.list();
		List<User> re=new ArrayList<User>();
		for(int i=0;i<l.size();i++)
		{
			  Object[] row = (Object[])l.get(i);;
			  Integer uid = (Integer)row[0];
			  String uName = (String)row[1];  
			  User user=new User(uid, uName,null,0,null,0,null);	 
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


	public List<RoleBase> getRolesList() {
		// TODO Auto-generated method stub
		SQLQuery q = session.createSQLQuery("select t.id,t.RoleName,t.RoleDescription from t_roles t");
		List l = q.list();
		this.close();
		List<RoleBase> re=new ArrayList<RoleBase>();
		for(int i=0;i<l.size();i++)
		{
			  Object[] row = (Object[])l.get(i);;
			  Integer rid = (Integer)row[0];
			  String rName = (String)row[1]; 
			  String rDes = (String)row[2]; 
			  RoleBase role=new RoleBase(rid,rName,rDes);
			 re.add(role);
		}
		
		return re;
		
	}


	public List<AlgRoleBase> getAlgsListByRole(int roleID) {
		// TODO Auto-generated method stub
				SQLQuery q = session.createSQLQuery("select t2.id id,t1.id roleid,t1.RoleName,t3.ID algid,t3.Name,t3.Description from t_roles t1,t_algrole t2,t_algorithmscycle t3 where t1.ID=t2.role_id and t2.algorithm_id=t3.ID and t1.ID=?");
				q.setParameter(0, roleID);
				List l = q.list();
				this.close();
				List<AlgRoleBase> re=new ArrayList<AlgRoleBase>();
				for(int i=0;i<l.size();i++)
				{
					  Object[] row = (Object[])l.get(i);;
					  Integer id = (Integer)row[0];
					  
					  Integer rid = (Integer)row[1];
					  String rName = (String)row[2]; 
					  
					  Integer algid = (Integer)row[3];
					  String algName = (String)row[4];
					  AlgRoleBase algrole=new AlgRoleBase(id,rid,rName,algid,algName);
					 re.add(algrole);
				}
				
				return re;// TODO Auto-generated method stub
	
	}


	public List<User> getUsersListByRole(int roleID) {
		SQLQuery q = session.createSQLQuery("select t2.id ,t1.id roleID,t1.RoleName,t3.ID userID,t3.Username from t_roles t1,t_userrole t2,t_user t3 where t1.ID=t2.role_id and t2.user_id=t3.ID and t1.ID=?");
		q.setParameter(0, roleID);
		List l = q.list();
		this.close();
		List<User> re=new ArrayList<User>();
		for(int i=0;i<l.size();i++)
		{
			  Object[] row = (Object[])l.get(i);;
			  Integer id = (Integer)row[0];
			  
			  Integer rid = (Integer)row[1];
			  String rName = (String)row[2]; 
			  
			  Integer uid = (Integer)row[3];
			  String uName = (String)row[4];
			  User algrole=new User(id,rid,rName,uid,uName);
			 re.add(algrole);
		}
		
		return re;// TODO Auto-generated method stub

	}


	public int addRole(String roleName, String roleDes) {
		
		tx = session.beginTransaction();
		Query q = session.createSQLQuery(" insert into t_roles (roleName,roleDescription) VALUES(?,?)");
		q.setParameter(0, roleName);
		q.setParameter(1, roleDes);
		int result=q.executeUpdate();		
		this.commit();
		return result;
		
	}


	public int delRole(int roleID) {
		tx = session.beginTransaction();
		Query q = session.createSQLQuery(" delete from t_roles where id=?");
		q.setParameter(0, roleID);

		int result=q.executeUpdate();		
		this.commit();
		return result;
	}


	public int addUserRole(int userID, int roleID) {
		tx = session.beginTransaction();
		Query q = session.createSQLQuery(" insert into t_userrole (user_id,role_id) VALUES(?,?)");
		q.setParameter(0, userID);
		q.setParameter(1, roleID);
		int result=q.executeUpdate();		
		this.commit();
		return result;
	}


	public int addAlgRole(int algID, int roleID) {
		tx = session.beginTransaction();
		Query q = session.createSQLQuery(" insert into t_algrole (role_id,algorithm_id,type,other) VALUES(?,?,0,0)");
		q.setParameter(0, roleID);
		q.setParameter(1, algID);
		int result=q.executeUpdate();		
		this.commit();
		return result;

	}


	public int delAlgRole(int algRoleID) {
		tx = session.beginTransaction();
		Query q = session.createSQLQuery(" delete from t_algrole where id=?");
		q.setParameter(0, algRoleID);

		int result=q.executeUpdate();		
		this.commit();
		return result;
		
	}


	public int delUserRole(int userRoleID) {
		tx = session.beginTransaction();
		Query q = session.createSQLQuery(" delete from t_userrole where id=?");
		q.setParameter(0, userRoleID);

		int result=q.executeUpdate();		
		this.commit();
		return result;
	
	}
	
}
