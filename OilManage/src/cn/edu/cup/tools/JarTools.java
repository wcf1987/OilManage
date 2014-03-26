package cn.edu.cup.tools;

import cn.edu.cup.manage.algtest.TestAlg;
import cn.edu.cup.manage.business.AlgorithmJarPlug;

public class JarTools {
	public static AlgorithmJarPlug getPlug(String filename,int pro_id){
		return new TestAlg(pro_id);
	}
}
