package cn.edu.cup.manage.dao;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;

import cn.edu.cup.manage.business.AlgorithmGraphi;
import cn.edu.cup.manage.business.GraphOutput;
import cn.edu.cup.manage.business.GraphiLine;
import cn.edu.cup.manage.business.GraphiPoint;
import cn.edu.cup.manage.business.Parameters;
import cn.edu.cup.manage.business.ProjectOutputs;
import cn.edu.cup.tools.HibernateSessionManager;
import cn.edu.cup.tools.Tools;

public class ProjectOutputDao {

	

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
		
	

	public ProjectOutputDao()
	{	
		session = HibernateSessionManager.getThreadLocalSession();
	
	}
	
	public int cleanLastResult(int pro_id){

		HibernateSessionManager.getThreadLocalTransaction();
		SQLQuery q = session.createSQLQuery("delete from t_projectoutputs  where Pro_ID=?");
		q.setParameter(0, pro_id);
		int re=q.executeUpdate();
		//tx.commit();
		return re;
	}
/*	public ProjectInputs searchInput(int iD) {
		// TODO Auto-generated method stub
		Date modifyTime=new Date();
		SQLQuery q = session.createSQLQuery("select t1.ID,t1.par_display,t1.par_id,t1.par_messID,t1.par_name,t1.par_value,t1.Pro_ID,CONCAT(t2.CName,'(',t2.Symbol,')') from t_projectinputs t1,t_measure t2 where t1.par_messID=t2.ID and t1.ID=? ");
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
		  
		ProjectInputs p=new ProjectInputs(id,display,parid,meid,name,vaule,pid,messSymbol);
		return p;
	}*/
	
	public List<ProjectOutputs> getProOutputsList(int pro_id,int page, int rows,
			String sidx, String sord) {
		SQLQuery q = session.createSQLQuery("select t1.ID,t1.par_display,t1.par_id,t1.par_messID,t1.par_name,t1.par_value,t1.Pro_ID,CONCAT(t2.CName,'(',t2.Symbol,')') from t_projectoutputs t1,t_measure t2 where t1.par_messID=t2.ID and t1.Pro_ID=? order by t1."+sidx+" "+sord);
		q.setParameter(0, pro_id);
		if(page!=0&&rows!=0){
			q.setFirstResult((page-1)*rows);
			q.setMaxResults(rows);
		}
		List l = q.list();
		List<ProjectOutputs> re=new ArrayList<ProjectOutputs>();
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
			  double value=(Double)row[5];
			  Integer pid = ((Integer)row[6]);
			  String messSymbol=(String)row[7];
			  
			  
			  ProjectOutputs p=new ProjectOutputs(id,display,parid,meid,name,value,pid,messSymbol);
			  
			  
			  re.add(p);
		}
		
		return re;
	}

	public int getCountProOutputs(int proid) {
		// TODO Auto-generated method stub
		String sql="select count(*) from t_projectOutputs t2 where t2.pro_id=? ";
		SQLQuery q = session.createSQLQuery(sql);
		q.setParameter(0, proid);
		Integer count=((BigInteger)q.uniqueResult()).intValue();
		return count;

	}
	public int addInput(int pro_id,int param_id,double value) {
		ParameterDao pDao=new ParameterDao();

		HibernateSessionManager.getThreadLocalTransaction();
		double ISOValue=pDao.getISOValue(param_id, value);
		Query q = session.createSQLQuery("INSERT into t_projectinputs  select NULL,?,t1.id,t1.display,?,t1.name,t1.measureID,? from t_parameters t1 where t1.ID=?;");
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
	
	public int deleteInput(int  id) {

		HibernateSessionManager.getThreadLocalTransaction();
		SQLQuery q = session.createSQLQuery("delete from t_projectinputs where ID=?");
		q.setParameter(0, id);
		int re=q.executeUpdate();
//		tx.commit();
		return re;
		
	}


	public int updateInput(int iD, double value) {

		HibernateSessionManager.getThreadLocalTransaction();
		// TODO Auto-generated method stub
		Date modifyTime=new Date();
		SQLQuery q = session.createSQLQuery("update t_projectinputs t set t.par_value=? where t.ID=?");
		q.setParameter(0, value);
		q.setParameter(1, iD);
		int re=q.executeUpdate();

		return re;
	}

	public int save(int pro_id, String name, double paramOutput) {

		HibernateSessionManager.getThreadLocalTransaction();
		ParameterDao pDao=new ParameterDao();
		double MessValue=pDao.getMessValueByName(name, paramOutput);
		Query q = session.createSQLQuery("INSERT into t_projectoutputs  select NULL,?,t1.id,t1.display,?,t1.name,t1.measureID,?,t1.type,0 from t_parameters t1 where t1.name=?;");
		q.setParameter(0, pro_id);
		q.setParameter(1, MessValue);
		q.setParameter(2, paramOutput);
		q.setParameter(3, name);
		
		int result=q.executeUpdate();
		
		int ret_id=0; 
		Query q2 = session.createSQLQuery("select LAST_INSERT_ID()"); 
		ret_id=((BigInteger) q2.uniqueResult()).intValue();
		return ret_id;
		
	}
	public int save(int pro_id, String name, List<Double> Output) {

		HibernateSessionManager.getThreadLocalTransaction();
		ParameterDao pDao=new ParameterDao();
		//double MessValue=pDao.getMessValueByName(name, paramOutput);
		String ListID=Tools.getUUID();
		Query q = session.createSQLQuery("INSERT into t_projectoutputs  select NULL,?,t1.id,t1.display,?,t1.name,t1.measureID,?,t1.type,? from t_parameters t1 where t1.name=?;");
		q.setParameter(0, pro_id);
		q.setParameter(1, 0);
		q.setParameter(2, 0);
		q.setParameter(3, ListID);
		q.setParameter(4, name);
		
		int result=q.executeUpdate();
		
		int ret_id=0; 
		Query q2 = session.createSQLQuery("select LAST_INSERT_ID()"); 
		ret_id=((BigInteger) q2.uniqueResult()).intValue();
		
		for(int i=0;i<Output.size();i++){
			double MessValue=pDao.getMessValueByName(name, Output.get(i));
			int param_id=pDao.getParID(name);
			q = session.createSQLQuery("INSERT into t_projectoutputlist  (UUID,pro_id,par_id,list_index,list_value,list_ISOValue) values(?,?,?,?,?,?)");

			q.setParameter(0, ListID);
			q.setParameter(1, pro_id);
			q.setParameter(2, param_id);
			q.setParameter(3, i);
			q.setParameter(4, MessValue);
			q.setParameter(5, Output.get(i));
			
			result=q.executeUpdate();
		}
		return ret_id;
		
	}

	public GraphOutput getProGraphi(int pro_id, int graphID) {
		// TODO Auto-generated method stub
		AlgorithmGraphiDao graphiDao=new AlgorithmGraphiDao();
		int type=graphiDao.getGraphiTypeByID(graphID);
		GraphOutput temp=new GraphOutput();
		if(type==0){
			//线形图
			temp.setType(type);
			temp.setTypeS(AlgorithmGraphi.getTypeSByNum(type));
			temp.setGraphiName(graphiDao.getGraphiNameByID(graphID));
			temp.setX(this.getProGraphiLineX(pro_id,graphID));
			temp.setY(this.getProGraphiLineY(pro_id,graphID));
			
		}
		if(type==1){
			//饼图
			temp.setType(type);
			temp.setTypeS(AlgorithmGraphi.getTypeSByNum(type));
			temp.setGraphiName(graphiDao.getGraphiNameByID(graphID));
			temp.setPoints(this.getProGraphiPoint(pro_id,graphID));		
			}
		if(type==2){
			//柱状图
			temp.setType(type);
			temp.setTypeS(AlgorithmGraphi.getTypeSByNum(type));
			temp.setGraphiName(graphiDao.getGraphiNameByID(graphID));
			temp.setX(this.getProGraphiLineX(pro_id,graphID));
			temp.setY(this.getProGraphiLineY(pro_id,graphID));
			
			
		}
		return temp;
	}
	
	
	public List<GraphiLine> getProGraphiHistogram(int pro_id, int graphID) {
		// TODO Auto-generated method stub
		AlgorithmGraphiDao graphiDao=new AlgorithmGraphiDao();
		ParameterDao pDao=new ParameterDao();
		GraphiLine line;
		List<Integer> paramids=graphiDao.getGraphiDetailByInfo(graphID,"");
		List<GraphiLine> lines=new ArrayList<GraphiLine>(paramids.size());
		
		for(int i=0;i<paramids.size();i++){
			line=new GraphiLine();
			int pid=paramids.get(i);
			String display=pDao.getDisplayName(pid);
			String messure=pDao.getMessureShow(pid);
			line.setDisplay(display);
			line.setMessure(messure);
			List<Double> value=this.getListOutputValueByParID(pro_id,pid);
			List<Double> ISOvalue=this.getListOutputISOValueByParID(pro_id,pid);
			line.setValue(value);
			line.setISOValue(ISOvalue);
			lines.add(line);
		}
		return lines;
	}
	private List<GraphiPoint> getProGraphiPoint(int pro_id, int graphID) {

		ParameterDao pDao=new ParameterDao();
		GraphiPoint point;
		List<GraphiPoint> points=new ArrayList<GraphiPoint>();
		SQLQuery q3 = session.createSQLQuery("select t1.display ,t.par_value,t.par_ISOValue,t.par_id from t_projectoutputs t,t_parameters t1,t_graphdetail t2 where t.par_id=t1.ID and t2.ParamID=t.Par_ID and t2.graphid=? and t.Pro_ID=? order by t.id  desc ");
		q3.setParameter(0, graphID);
		q3.setParameter(1, pro_id);
		
		List l=q3.list();
		
		for(int i=0;i<l.size();i++){
			point=new GraphiPoint();

			  Object[] row = (Object[])l.get(i);
			
			  
			String display= (String)row[0];
			String messure=pDao.getMessureShow((Integer)(row[3]));
			point.setDisplay(display);
			point.setMessure(messure);
			point.setValue((Double)row[1]);
			point.setISOValue((Double)row[2]);
			points.add(point);
		}
		return points;
	}

	public GraphiLine getProGraphiLineX(int pro_id, int graphID) {
		// TODO Auto-generated method stub
		AlgorithmGraphiDao graphiDao=new AlgorithmGraphiDao();
		ParameterDao pDao=new ParameterDao();
		GraphiLine line=new GraphiLine();
		List<Integer> paramids=graphiDao.getGraphiDetailByInfo(graphID,"X");
		
		
		String display=pDao.getDisplayName(paramids.get(0));
		String messure=pDao.getMessureShow(paramids.get(0));
		line.setDisplay(display);
		line.setMessure(messure);
		List<Double> value=this.getListOutputValueByParID(pro_id,paramids.get(0));
		List<Double> ISOvalue=this.getListOutputISOValueByParID(pro_id,paramids.get(0));
		line.setValue(value);
		line.setISOValue(ISOvalue);
		
		return line;
	}
	public List<GraphiLine> getProGraphiLineY(int pro_id, int graphID) {
		// TODO Auto-generated method stub
		AlgorithmGraphiDao graphiDao=new AlgorithmGraphiDao();
		ParameterDao pDao=new ParameterDao();
		GraphiLine line;
		List<Integer> paramids=graphiDao.getGraphiDetailByInfo(graphID,"Y");
		List<GraphiLine> lines=new ArrayList<GraphiLine>(paramids.size());
		
		for(int i=0;i<paramids.size();i++){
			line=new GraphiLine();
			int pid=paramids.get(i);
			String display=pDao.getDisplayName(pid);
			String messure=pDao.getMessureShow(pid);
			line.setDisplay(display);
			line.setMessure(messure);
			List<Double> value=this.getListOutputValueByParID(pro_id,pid);
			List<Double> ISOvalue=this.getListOutputISOValueByParID(pro_id,pid);
			line.setValue(value);
			line.setISOValue(ISOvalue);
			lines.add(line);
		}
		return lines;
	}
	private List<Double> getListOutputValueByParID(int pro_id, int par_id) {
			String UUID=getOutputUUID(pro_id,par_id);
			SQLQuery q3 = session.createSQLQuery("select t.list_value from t_projectoutputlist t where  t.UUID=? order by list_index asc");
			q3.setParameter(0, UUID);
			
			List l = q3.list();
			List<Double> temp=new ArrayList<Double>();
			for(int i=0;i<l.size();i++)
			{
				//TestDb user = (TestDb)l.get(i);
				//System.out.println(user.getUsername());

				  
				  Double value=(Double)l.get(i);
				  temp.add(value);
				  
				 
				  
			}
			return temp;
		
	}
	private List<Double> getListOutputISOValueByParID(int pro_id, int par_id) {
		String UUID=getOutputUUID(pro_id,par_id);
		SQLQuery q3 = session.createSQLQuery("select t.list_ISOvalue from t_projectoutputlist t where  t.UUID=? order by list_index asc");
		q3.setParameter(0, UUID);
		
		List l = q3.list();
		List<Double> temp=new ArrayList<Double>();
		for(int i=0;i<l.size();i++)
		{
			//TestDb user = (TestDb)l.get(i);
			//System.out.println(user.getUsername());

			  
			  Double value=(Double)l.get(i);
			  temp.add(value);
			  
			 
			  
		}
		return temp;
	
}
	public String getOutputUUID(int pro_id,int paramid){		
		SQLQuery q = session.createSQLQuery("select par_listUUID from t_projectoutputs t where t.pro_id=? and t.par_id=? ");
		q.setParameter(0, pro_id);
		q.setParameter(1, paramid);
		String re=(String)q.uniqueResult();
		return re;
	}

}
