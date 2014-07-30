package cn.edu.cup.manage.algtest;

import java.util.ArrayList;
import java.util.List;

import cn.edu.cup.algjar.AlgorithmPlug;
//extends AlgorithmPlugBase
public class TestList  extends AlgorithmPlug{
	public TestList() {		
	}

	public String startCalc() {
		List<Double> a=getList("listin");
		List<Double> b=new ArrayList<Double>();
		for(int i=0;i<a.size();i++){
			b.add(a.get(i)*a.get(i));
		}
		List<Double> x=getList("Xp1");
		List<Double> sinx=new ArrayList<Double>();
		List<Double> cosx=new ArrayList<Double>();
		for(int i=0;i<x.size();i++){
			sinx.add(Math.sin(x.get(i)));
			cosx.add(Math.cos(x.get(i)));
		}
		save("listout", b);
		save("A1", 1.5);
		save("A2", 1.648);
		save("A3", 0.7);
		save("A4", 3.198);
		save("Xp1", x);
		save("sinx1", sinx);
		save("cosx", cosx);
		return null;
	}
}
