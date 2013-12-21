package com.oil.map.action;


import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import org.apache.struts2.json.annotations.JSON;

import com.oil.map.business.Point;
import com.oil.test.TestData;
import com.opensymphony.xwork2.ActionSupport;

public class TableDeleteAction extends ActionSupport{
	

	String id;
	
	
	public String getId(){
		return id;
	}
	public void setId(String id){
		this.id=id;
	}
	

	public String execute()
	{
//		testinit();
		
		return "SUCCESS";
	}
	
}
