package cn.edu.cup.manage.action;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

import javax.servlet.ServletContext;

import org.apache.struts2.ServletActionContext;

import cn.edu.cup.manage.dao.GUIPointTypeDao;
import cn.edu.cup.map.business.Graphi;
import cn.edu.cup.map.business.Line;
import cn.edu.cup.map.business.Point;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class UploadTypeIconAction  extends ActionSupport{
	private static final long serialVersionUID = 837481714629791752L;
	private int ID;
	private String type;
	private String remark;
	private String suffix;
	private File iconfile;
	private String fileName;
//	private File mapfile;
	//private String mapfileContentType;
	//private String mapfileFileName;
	//private Graphi graphi;
	private String FilePath;
	private String relativePath;
	public static String UPLOADPATH="editor/icons/";
	private static String   WEB_ROOT_PATH;
	private Boolean exist;
/*	public Graphi getGraphi() {
		return graphi;
	}*/


	
	public String re;

	public int getID() {
		return ID;
	}
	public void setID(int iD) {
		ID = iD;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	
	public String getSuffix() {
		return suffix;
	}
	public void setSuffix(String suffix) {
		this.suffix = suffix;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	
	public Boolean getExist() {
		return exist;
	}
	public void setExist(Boolean exist) {
		this.exist = exist;
	}
	public String getWebFileRoot(){
		 ActionContext ac = ActionContext.getContext();     
	     ServletContext sc = (ServletContext) ac.get(ServletActionContext.SERVLET_CONTEXT);     
	     WEB_ROOT_PATH = sc.getRealPath("/"); 
	     return WEB_ROOT_PATH;
	}
	public String uploadTypeIcon() throws Exception {
		//graphi=new Graphi();
		//System.out.println(mapfileFileName);		 
	     BufferedReader reader = null;
	        try {	                 
	        	GUIPointTypeDao dao=new GUIPointTypeDao();	
	        	int cou=dao.countType(type);
	        	if(cou>0){
	        		exist=true;
	        	}else{
	        		exist=false;
	        	    reader = new BufferedReader(new FileReader(iconfile)); 	           
	            	String path=getWebFileRoot()+this.UPLOADPATH;
	            	//relativePath=this.UPLOADPATH+String.valueOf(System.currentTimeMillis())+".svg";	        
	            	//path=path+String.valueOf(System.currentTimeMillis())+".svg";    
	          
	            	relativePath=this.UPLOADPATH+type+suffix;	        		              
	            	path=path+type+suffix;                
	                FilePath=path;	                
	                copyFile(iconfile,new File(FilePath));	       
		            reader.close();
	        		ID=dao.addType(this.type,this.remark,this.relativePath);
	        	}
	        	dao.close();    	
	    		
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


    public String getFilePath() {
		return FilePath;
	}
    
	public String getRelativePath() {
		return relativePath;
	}
	private void copyFile(File sourceFile, File targetFile) throws IOException {
        BufferedInputStream inBuff = null;
        BufferedOutputStream outBuff = null;
        try {
            // 新建文件输入流并对它进行缓冲
            inBuff = new BufferedInputStream(new FileInputStream(sourceFile));

            // 新建文件输出流并对它进行缓冲
            outBuff = new BufferedOutputStream(new FileOutputStream(targetFile));

            // 缓冲数组
            byte[] b = new byte[1024 * 5];
            int len;
            while ((len = inBuff.read(b)) != -1) {
                outBuff.write(b, 0, len);
            }
            // 刷新此缓冲的输出流
            outBuff.flush();
        } finally {
            // 关闭流
            if (inBuff != null)
                inBuff.close();
            if (outBuff != null)
                outBuff.close();
        }
    }
	public String getRe() {
		return re;
	}
	

	public File getIconfile() {
		return iconfile;
	}
	public void setIconfile(File iconfile) {
		this.iconfile = iconfile;
	}
/*	public void setMapfileContentType(String mapfileContentType) {
		this.mapfileContentType = mapfileContentType;
	}



	public void setMapfileFileName(String mapfileFileName) {
		this.mapfileFileName = mapfileFileName;
	}*/
}
