package cn.edu.cup.map.business;

import java.util.HashMap;

import java.util.Map;


public class Point {

	String Name;

	String type;
	int Draw2DX;
	int Draw2DY;
	public int getDraw2DX() {
		return Draw2DX;
	}
	public void setDraw2DX(int draw2dx) {
		Draw2DX = draw2dx;
	}
	public int getDraw2DY() {
		return Draw2DY;
	}
	public void setDraw2DY(int draw2dy) {
		Draw2DY = draw2dy;
	}
	public void addAttr(String key,String value){
		this.attribute.put(key, value);
	}
	public void addAttr(Map<String,String>  KV){
		this.attribute.putAll(KV);
	}
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
		this.attribute=new HashMap<String, String>();
	}
	public void getLatLonFromGeo(){
		double a[]=CoordinateConversion.GaussProjInvCal(this.GeodeticCoordinatesX,this.GeodeticCoordinatesY);
		this.latitude=a[1];
		this.Longitude=a[0];
	}
	public void getGeoFromLatLon(){
		double temp[] = CoordinateConversion.GaussProjCal(this.latitude, this.Longitude);
		this.GeodeticCoordinatesX=temp[0];
		this.GeodeticCoordinatesY=temp[1];
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
