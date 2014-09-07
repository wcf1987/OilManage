package cn.edu.cup.map.business;

import java.util.Map;

public class Line{
	public Line(){
		
	}
	public String getStart() {
		return start;
	}
	public void setStart(String start) {
		this.start = start;
	}
	public String getEnd() {
		return end;
	}
	public void setType(String type) {
		this.type = type;
	}
	public void setLength(String length) {
		this.length = length;
	}
	public void setAttribute(Map<String, String> attribute) {
		this.attribute = attribute;
	}
	public void setEnd(String end) {
		this.end = end;
	}

	public Line(String start2, String end2, String i) {
		// TODO Auto-generated constructor stub
		this.start=start2;
		this.end=end2;
		this.type=i;
	}
	public String getType() {
		return type;
	}
	public String getLength() {
		return length;
	}
	public Map<String, String> getAttribute() {
		return attribute;
	}
	String start;
	String end;
	String name;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	String type;
	String length;
	Map<String,String> attribute;
}