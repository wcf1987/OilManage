package cn.edu.cup.map.action;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.List;

import cn.edu.cup.map.business.Graphi;
import cn.edu.cup.map.business.Line;
import cn.edu.cup.map.business.Point;

import com.opensymphony.xwork2.ActionSupport;

public class UploadAction  extends ActionSupport{
	private static final long serialVersionUID = 837481714629791752L;
	private File mapfile;
	private String mapfileContentType;
	private String mapfileFileName;
	private Graphi graphi;



	public Graphi getGraphi() {
		return graphi;
	}



	public String re;
	public Point analyzePoint(String line){
		Point a=new Point();
		try{
		String arrayTemp[]=line.split(",");
		//a.setGroupNO(arrayTemp[0].trim());
		//a.setWellNO(arrayTemp[1].trim());
		a.setTypeByInt(arrayTemp[0].trim());
		a.setName(arrayTemp[1].trim());
		a.setGeodeticCoordinatesX(Double.valueOf(arrayTemp[2].trim()));
		a.setGeodeticCoordinatesY(Double.valueOf(arrayTemp[3].trim()));
		a.getLatLonFromGeo();	
		}catch(Exception e){
			a=null;
		}
		return a;
	}
	public Line analyzeLine(String line){
		Line a=new Line();
		try{
		String arrayTemp[]=line.split(",");
		//a.setGroupNO(arrayTemp[0].trim());
		//a.setWellNO(arrayTemp[1].trim());
		a.setStart(arrayTemp[1].trim());
		a.setEnd(arrayTemp[2].trim());
		}catch(Exception e){
			a=null;
		}
		return a;
	}
	public String uploadFile() throws Exception {
		graphi=new Graphi();
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
	                tempString=tempString.trim();
	                System.out.println( tempString);
	                if(tempString!=null&&!tempString.trim().equals("")){
	                if(Integer.valueOf(tempString.substring(0,1))<4){
	                	Point a=analyzePoint(tempString);
	                	if (a!=null){
	                		graphi.addPoint(a);
	                		//System.out.println(a.getLatitude());
	                	}else{
	                		re="文件格式有误";
	                	break;
	                	}
	                }else{
	                	Line b=analyzeLine(tempString);
	                	if(b!=null){
	                		graphi.addLine(b.getStart(), b.getEnd());
	                	}else{
	                		
	                		re="文件格式有误";
	                	break;
	                	}
	                }
	                re="文件解析成功";
	            }}
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
