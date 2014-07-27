package cn.edu.cup.manage.business;

import java.util.List;

public class GraphiLine {
	List<Double> value;
	List<Double> ISOValue;
	String display;
	String messure;
	public List<Double> getValue() {
		return value;
	}
	public void setValue(List<Double> value) {
		this.value = value;
	}
	public List<Double> getISOValue() {
		return ISOValue;
	}
	public void setISOValue(List<Double> iSOValue) {
		ISOValue = iSOValue;
	}
	public String getDisplay() {
		return display;
	}
	public void setDisplay(String display) {
		this.display = display;
	}
	public String getMessure() {
		return messure;
	}
	public void setMessure(String messure) {
		this.messure = messure;
	}
}
