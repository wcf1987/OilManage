package com.oil.map;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.opensymphony.xwork2.ActionSupport;

public class UploadAction  extends ActionSupport{
	private static final long serialVersionUID = 837481714629791752L;
	private File mapfile;
	private String mapfileContentType;
	private String mapfileFileName;
	
	
	
	public String uploadFile() throws Exception {
		System.out.println(mapfileFileName);
		return "SUCCESS";
		
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
