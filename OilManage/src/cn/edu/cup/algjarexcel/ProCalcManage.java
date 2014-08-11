package cn.edu.cup.algjarexcel;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import cn.edu.cup.manage.dao.AlgorithmProDao;

public class ProCalcManage {//工程计算进程管理类，控制计算进程calcThread
	private ProCalcManage() {
		threadMap=new HashMap<Integer, CalcThread>();
		
		
		
	}
	     //已经自行实例化 
	      private static final ProCalcManage single = new ProCalcManage();
	      //静态工厂方法 
	      public static ProCalcManage getInstance() {
	          return single;
	     }

	      public void stopThread(int proid){
	    	  CalcThread a=clearThread(proid);//根据proid从threadMap中将该进程剔除
	    	  a.stopByForce();//杀掉进程
	    	  
				
	      }
	     public int getStatus(int proid){
	    	 CalcThread thread=threadMap.get(proid);
	    	 if(thread==null){
	    		 return 2;
	    	 }
	    	 if(thread.isAlive()==false){
	    		 return 2;
	    	 }else{
	    		 return 1;
	    	 }
	     }
		public CalcThread clearThread(int proid){//根据proid从threadMap中将该进程剔除
			CalcThread thread=threadMap.get(proid);
			threadMap.remove(proid);
			return thread;
			
		}
		private void startThread(ProjectInfo proinfo) 
		{  CalcThread thread=new CalcThread();
			
			thread.setProInfo(proinfo);
			thread.start();
			threadMap.put(proinfo.getProid(), thread);
			//proinfo.save();
			
		}
		Map<Integer,CalcThread> threadMap;//prodi:calcThread
		public void run(int proid) {
			ProjectInfo proinfo=new ProjectInfo(proid);
				
			proinfo.createHisID(new Date());
			proinfo.markStatus(1, "开始运算");	
			proinfo.logInfo("计算开始");
			startThread(proinfo);
		}



		public void checkRunStatus() {
			// TODO Auto-generated method stub
			AlgorithmProDao dao=new AlgorithmProDao();
			List<Integer> list=dao.getRunPro();//获取正在运行的项目ID
			for(int i=0;i<list.size();i++){
				int pro_id=list.get(i);
				int status=getStatus(pro_id);//根据进程是否活着返回状态信息1：正在运行；2：运行完毕
				if(status!=1){
					dao.setProCalcStatus(pro_id, status, "运行完毕");
				}
			}
			dao.close();
		}

}
