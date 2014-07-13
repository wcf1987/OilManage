package cn.edu.cup.manage.business;

import java.util.List;

public class ProjectInputs {
	int ID;
	int pro_id;
	int par_id;
	double value;
	String UUID;
	int type;
	List<Double> valuelist;
	public List<Double> getValuelist() {
		return valuelist;
	}
	public void setValuelist(List<Double> valuelist) {
		this.valuelist = valuelist;
	}
	String Name;
	String Display;
	String Mess;
	int mess_id;
	public int getPro_id() {
		return pro_id;
	}
	public void setPro_id(int pro_id) {
		this.pro_id = pro_id;
	}
	public int getPar_id() {
		return par_id;
	}
	public void setPar_id(int par_id) {
		this.par_id = par_id;
	}
	public double getValue() {
		return value;
	}
	public void setValue(double value) {
		this.value = value;
	}
	public int getMess_id() {
		return mess_id;
	}
	public void setMess_id(int mess_id) {
		this.mess_id = mess_id;
	}
	public int getID() {
		return ID;
	}
	public void setID(int iD) {
		ID = iD;
	}
	public String getName() {
		return Name;
	}
	public void setName(String name) {
		Name = name;
	}
	public String getDisplay() {
		return Display;
	}
	public void setDisplay(String display) {
		Display = display;
	}
	public String getMess() {
		return Mess;
	}
	public void setMess(String mess) {
		Mess = mess;
	}
	public ProjectInputs(Integer id, String name, String display, String mess,
			Double value) {
		// TODO Auto-generated constructor stub
	}
	public ProjectInputs(Integer id2, String display2, Integer parid,
			Integer meid, String name2, double vaule2, Integer pid,
			String messSymbol,int type2,String UUID2) {
		// TODO Auto-generated constructor stub
		this.ID=id2;
		this.Display=display2;
		this.Mess=messSymbol;
		this.par_id=parid;
		this.mess_id=meid;
		this.Name=name2;
		this.value=vaule2;
		this.pro_id=pid;
		this.type=type2;
		this.UUID=UUID2;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	
}
