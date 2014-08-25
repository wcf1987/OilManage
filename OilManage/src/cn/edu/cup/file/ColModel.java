package cn.edu.cup.file;

import java.util.HashMap;
import java.util.Map;

public class ColModel {
	String name;
	String index;
	String edittype;
	Map editoptions;
	boolean editable=true;
	int width;
	public boolean isEditable() {
		return editable;
	}

	boolean hidden;
	public boolean isHidden() {
		return hidden;
	}

	String align="center";
	public void setName(String name) {
		this.name = name;
	}
	private Map<String,String> getDoubleKeyMap(String[] k){
		Map<String,String> a=new HashMap<>();
		for(int i=0;i<k.length;i++){
		a.put(k[i], k[i]);
		}
		return a;
		
	}
	private Map<String,Map<String,String>> getValueMap(String k,Map<String,String> v){
		Map<String,Map<String,String>> a=new HashMap<>();
		a.put(k, v);
		return a;
		
	}
	public ColModel(String name) {
		super();
		this.name = name;
		this.index=name;
		this.hidden=false;
		this.edittype="text";
		if(this.name.equals("控制模式")){
			this.edittype="select";
			String str[] = {"Flow","Pressure"};
			this.editoptions=getValueMap("value", getDoubleKeyMap(str));
			//this.editoptions="{ value: \"FE:FedEx\"}";
		}
		if(this.name.equals("管段类型")){
			this.edittype="select";
			String str[] = {"CentCompressor","ReciCompressor","Pipe"};
			this.editoptions=getValueMap("value", getDoubleKeyMap(str));
			
			//this.editoptions="{value:{CentCompressor:'CentCompressor',ReciCompressor:'ReciCompressor',Pipe:'Pipe'}}";	
		}
	}
	public String getEdittype() {
		return edittype;
	}
	
	public Map getEditoptions() {
		return editoptions;
	}
	public ColModel(String name,boolean hidden) {
		super();
		this.name = name;
		this.index=name;
		this.hidden=hidden;
	}
	public void setIndex(String index) {
		this.index = index;
	}

	public void setAlign(String align) {
		this.align = align;
	}
	public String getName() {
		return name;
	}
	public String getIndex() {
		return index;
	}

	public String getAlign() {
		return align;
	}
	public int getWidth() {
		return width;
	}
	public void setWidth(int width) {
		this.width = width;
	}
	
}
