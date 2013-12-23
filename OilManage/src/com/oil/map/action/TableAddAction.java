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

public class TableAddAction extends ActionSupport{
	

	String id;
	String name;
	String address;
	String town;
	String country;
	
	public String getId(){
		return id;
	}
	public void setId(String id){
		this.id=id;
	}
	
	public String getName(){
		return name;
	}
	public void setName(String name){
		this.name=name;
	}
	
	public String getAddress(){
		return address;
	}
	public void setAddress(String address){
		this.address=address;
	}
	
	public String getTown(){
		return town;
	}
	public void setTown(String town){
		this.town=town;
	}
	
	public String getCountry(){
		return country;
	}
	public void setCountry(String country){
		this.country=country;
	}

	public String execute()
	{
		id="1";
	    
		return "SUCCESS";
	}
	
}
