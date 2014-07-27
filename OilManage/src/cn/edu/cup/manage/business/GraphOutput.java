package cn.edu.cup.manage.business;

import java.util.List;

public class GraphOutput {
	public List<GraphiPoint> getPoints() {
		return points;
	}
	public void setPoints(List<GraphiPoint> points) {
		this.points = points;
	}
	int type;
	String typeS;
	GraphiLine X;
	List<GraphiLine> Y;
	List<GraphiPoint> points;
	List<GraphiLine> histogram ;
	public List<GraphiLine> getHistogram() {
		return histogram;
	}
	public void setHistogram(List<GraphiLine> histogram) {
		this.histogram = histogram;
	}
	String GraphiName;
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public String getTypeS() {
		return typeS;
	}
	public void setTypeS(String typeS) {
		this.typeS = typeS;
	}
	public GraphiLine getX() {
		return X;
	}
	public void setX(GraphiLine x) {
		X = x;
	}
	public List<GraphiLine> getY() {
		return Y;
	}
	public void setY(List<GraphiLine> y) {
		Y = y;
	}
	public String getGraphiName() {
		return GraphiName;
	}
	public void setGraphiName(String graphiName) {
		GraphiName = graphiName;
	}
	
}
