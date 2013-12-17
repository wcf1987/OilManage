package com.oil.map;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import com.opensymphony.xwork2.ActionSupport;

public class UploadAction  extends ActionSupport{
	private static final long serialVersionUID = 837481714629791752L;
	private File mapfile;
	private String mapfileContentType;
	private String mapfileFileName;
	List<Point> points;
	public String re;
	public Point analyzeFile(String line){
		Point a=new Point();
		try{
		String arrayTemp[]=line.split(",");
		a.setGroupNO(arrayTemp[0].trim());
		a.setWellNO(arrayTemp[1].trim());
		a.setGeodeticCoordinatesX(Double.valueOf(arrayTemp[2].trim()));
		a.setGeodeticCoordinatesY(Double.valueOf(arrayTemp[3].trim()));
		a.getLatLonFromGeo();	
		}catch(Exception e){
			a=null;
		}
		return a;
	}
	public String uploadFile() throws Exception {
		points=new ArrayList<Point>();
		//System.out.println(mapfileFileName);		 
	     BufferedReader reader = null;
	        try {
	           
	            reader = new BufferedReader(new FileReader(mapfile));
	            String tempString = null;
	            int line = 1;
	            // 一次读入一行，直到读入null为文件结束
	            while ((tempString = reader.readLine()) != null) {
	                // 显示行号
	                //System.out.println("line " + line + ": " + tempString);
	                line++;
	                
	                Point a=analyzeFile(tempString);
	                if (a!=null){
	                	points.add(a);
	                	System.out.println(a.latitude);
	                }else{
	                	re="文件格式有误";
	                	break;
	                }
	                re="文件解析成功";
	            }
	            reader.close();
	        } catch (IOException e) {
	            e.printStackTrace();
	        } finally {
	            if (reader != null) {
	                try {
	                    reader.close();
	                } catch (IOException e1) {
	                }
	            }
	        }
		return "SUCCESS";
		
	}



	public String getRe() {
		return re;
	}
	public List<Point> getPoints() {
		return points;
	}
	public void setMapfile(File mapfile) {
		this.mapfile = mapfile;
	}



	public void setMapfileContentType(String mapfileContentType) {
		this.mapfileContentType = mapfileContentType;
	}



	public void setMapfileFileName(String mapfileFileName) {
		this.mapfileFileName = mapfileFileName;
	}
}
