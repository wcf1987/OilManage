package cn.edu.cup.manage.business;

import java.util.List;

public class GraphiPoint {
	double value;
	double ISOValue;
	public double getValue() {
		return value;
	}
	public void setValue(double value) {
		this.value = value;
	}
	public double getISOValue() {
		return ISOValue;
	}
	public void setISOValue(double iSOValue) {
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
	String display;
	String messure;
	
}
