package cn.edu.cup.graphi.business;

public class Node {
	Integer id ;
	String nodeName;
	double x_location;
	double y_location;
	double latitude;
	double longitude;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getNodeName() {
		return nodeName;
	}
	public void setNodeName(String nodeName) {
		this.nodeName = nodeName;
	}
	public double getX_location() {
		return x_location;
	}
	public void setX_location(double x_location) {
		this.x_location = x_location;
	}
	public double getY_location() {
		return y_location;
	}
	public void setY_location(double y_location) {
		this.y_location = y_location;
	}
	public double getLatitude() {
		return latitude;
	}
	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}
	public double getLongitude() {
		return longitude;
	}
	public void setLongitude(double longitude) {
		this.longitude = longitude;
	}
	public double getX_location_geo() {
		return x_location_geo;
	}
	public void setX_location_geo(double x_location_geo) {
		this.x_location_geo = x_location_geo;
	}
	public double getY_location_geo() {
		return y_location_geo;
	}
	public void setY_location_geo(double y_location_geo) {
		this.y_location_geo = y_location_geo;
	}
	public Integer getBasicNodeID() {
		return BasicNodeID;
	}
	public void setBasicNodeID(Integer basicNodeID) {
		BasicNodeID = basicNodeID;
	}
	public Integer getProID() {
		return proID;
	}
	public void setProID(Integer proID) {
		this.proID = proID;
	}
	double x_location_geo;
	double y_location_geo;
	public Node(Integer id, String nodeName, double x_location,
			double y_location, double latitude, double longitude,
			double x_location_geo, double y_location_geo, Integer basicNodeID,
			Integer proID) {
		super();
		this.id = id;
		this.nodeName = nodeName;
		this.x_location = x_location;
		this.y_location = y_location;
		this.latitude = latitude;
		this.longitude = longitude;
		this.x_location_geo = x_location_geo;
		this.y_location_geo = y_location_geo;
		BasicNodeID = basicNodeID;
		this.proID = proID;
	}
	Integer BasicNodeID;
	Integer proID;
}
