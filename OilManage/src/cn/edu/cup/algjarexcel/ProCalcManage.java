package cn.edu.cup.algjarexcel;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

public class ProCalcManage {
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
	    	  CalcThread a=clearThread(proid);
	    	  a.stopByForce();
	    	  
				
	      }
		public CalcThread clearThread(int proid){
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
		Map<Integer,CalcThread> threadMap;
		public void run(int proid) {
			ProjectInfo proinfo=new ProjectInfo(proid);
			proinfo.markStatus(1, "开始运算");		
			proinfo.createHisID(new Date());
			startThread(proinfo);
		}

}
