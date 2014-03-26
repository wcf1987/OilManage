package cn.edu.cup.manage.business;

import cn.edu.cup.manage.dao.AlgorithmProDao;

public abstract class AlgorithmPlugBase implements AlgorithmJarPlug{
	public CalcInfo info;
	public AlgorithmPlugBase(int pro_id){
		AlgorithmProDao dao=new AlgorithmProDao();
		info=dao.getProInfo(pro_id);
	}
	public String startCalc() {
		
		return null;
	}

}
