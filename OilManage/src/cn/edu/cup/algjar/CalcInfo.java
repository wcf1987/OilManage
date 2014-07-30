package cn.edu.cup.algjar;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CalcInfo {
	public Map<String,Double> paramInputs=new HashMap<String,Double>();
	public Map<String,Double> paramOutputs=new HashMap<String,Double>();

	public Map<String,List<Double>> listInputs=new HashMap<String,List<Double>>();
	public Map<String,List<Double>> listOutputs=new HashMap<String,List<Double>>();
	public int Algorthm;
	public Map<String, Double> getParamInputs() {
		return paramInputs;
	}
	public Map<String, List<Double>> getListOutputs() {
		return listOutputs;
	}
	public void setListOutputs(Map<String, List<Double>> listOutputs) {
		this.listOutputs = listOutputs;
	}
	public void setParamInputs(Map<String, Double> paramInputs) {
		this.paramInputs = paramInputs;
	}
	public int getAlgorthm() {
		return Algorthm;
	}
	public void setAlgorthm(int algorthm) {
		Algorthm = algorthm;
	}
	public void addParamInput(String paramName,Double value){
		this.paramInputs.put(paramName, value);
	}
	public double getParamInput(String paramName){
		return this.paramInputs.get(paramName);
	}
	public List<Double> getListInput(String paramName){
		return this.listInputs.get(paramName);
	}
	public double getParamOutput(String paramName){
		return this.paramOutputs.get(paramName);
	}
	public void addParamOutput(String paramName,Double value){
		this.paramOutputs.put(paramName, value);
	}
	public void addListInput(String paramName,List<Double> value){
		this.listInputs.put(paramName, value);
	}
	public void addListOutput(String paramName,List<Double> value){
		this.listOutputs.put(paramName, value);
	}
	
	public List<Double> getListOutput(String paramName){
		return this.listOutputs.get(paramName);
	}
	public CalcInfo() {
		super();
	}
}
