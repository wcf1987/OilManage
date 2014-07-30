package cn.edu.cup.algjar;

import java.util.Date;
import java.util.List;

public abstract class AlgorithmPlug {
	public abstract String startCalc();
	CalcInfo info;
	public void injectInfo(CalcInfo info){
		this.info=info;
	}
	public CalcInfo getInfo(){
		return this.info;
	}
	public void save(String paramName,List<Double> value){
		 info.addListOutput(paramName,value);
		
	}
	public void save(String paramName,Double value){
		 info.addParamOutput(paramName,value);
		
	}
	public List<Double> getList(String name){
		return info.getListInput(name);
	}
	public Double getParam(String name){
		return info.getParamInput(name);
	}
}
