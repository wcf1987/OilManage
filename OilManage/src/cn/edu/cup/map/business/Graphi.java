package cn.edu.cup.map.business;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


public class Graphi {
	int GISReal;
	public int getGISReal() {
		return GISReal;
	}
	public void setGISReal(int gISReal) {
		GISReal = gISReal;
	}
	Map<String,Point> points;
	List<Line> lines;
	/*public List getJSON(){
		List temp=new ArrayList();
		temp.addAll(points.values());
		temp.addAll(lines);
		return temp;
	}*/
	public void setPoints(Map<String, Point> points) {
		this.points = points;
	}
	public void setLines(List<Line> lines) {
		this.lines = lines;
	}
	public Map<String, Point> getPoints() {
		return points;
	}
	public List<Line> getLines() {
		return lines;
	}
	public Graphi(){
		lines=new ArrayList<Line>();
		points=new HashMap<String, Point>();

	}
	public Boolean addPoint(Point temp){
		if(!points.containsValue(temp)){
			points.put(temp.getName(), temp);			
			return true;
		}
		return false;
	}
	public Boolean addLine(String start,String end){
		return true;
	}
	public Point getPoint(String start) {
		
		return points.get(start);
	}

}
