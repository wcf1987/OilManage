package cn.edu.cup.manage.algtest;

import java.util.ArrayList;
import java.util.List;

import cn.edu.cup.manage.business.AlgorithmPlugBase;

public class TestList extends AlgorithmPlugBase{
	public TestList(int pro_id) {
		super(pro_id);
		// TODO Auto-generated constructor stub
	}

	public String startCalc() {
		List<Double> a=this.info.getListInput("listin");
		List<Double> b=new ArrayList<Double>();
		for(int i=0;i<a.size();i++){
			b.add(a.get(i)*a.get(i));
		}
		this.info.addListOutput("listout", b);
		return null;
	}
}
