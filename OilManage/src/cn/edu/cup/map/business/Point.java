package cn.edu.cup.map.business;

import java.util.Map;

public class Point {

	String Name;

	String type;



	/**
	 * da di zuo biao 
	 */
	double GeodeticCoordinatesX;
	/**
	 * da di zuo biao 
	 */
	double GeodeticCoordinatesY;
	
	/**
	 * 经度
	 */
	double Longitude;
	/**
	 * 纬度
	 */
	double latitude;

	public Point() {
		// TODO Auto-generated constructor stub
	}
	public void getLatLonFromGeo(){
		double a[]=new CoordinateConversion().utm2LatLon("50 S "+String.valueOf(this.GeodeticCoordinatesX)+" "+String.valueOf(this.GeodeticCoordinatesY));
		this.latitude=a[0];
		this.Longitude=a[1];
	}
	public void getGeoFromLatLon(){
		this.GeodeticCoordinatesX=new CoordinateConversion().latLon2UTMX(this.latitude,this.Longitude);
		this.GeodeticCoordinatesY=new CoordinateConversion().latLon2UTMY(this.latitude,this.Longitude);
	}
	public String getName() {
		return Name;
	}
	public void setName(String name) {
		Name = name;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public double getGeodeticCoordinatesX() {
		return GeodeticCoordinatesX;
	}
	public void setGeodeticCoordinatesX(double geodeticCoordinatesX) {
		GeodeticCoordinatesX = geodeticCoordinatesX;
	}
	public double getGeodeticCoordinatesY() {
		return GeodeticCoordinatesY;
	}
	public void setGeodeticCoordinatesY(double geodeticCoordinatesY) {
		GeodeticCoordinatesY = geodeticCoordinatesY;
	}
	public double getLongitude() {
		return Longitude;
	}
	public void setLongitude(double longitude) {
		Longitude = longitude;
	}
	public double getLatitude() {
		return latitude;
	}
	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}
	Map<String,String> attribute;

	public Map<String, String> getAttribute() {
		return attribute;
	}
	public void setAttribute(Map<String, String> attribute) {
		this.attribute = attribute;
	}
}
