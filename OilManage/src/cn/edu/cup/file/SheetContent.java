package cn.edu.cup.file;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;

public class SheetContent {
	public List<String> getTitle(){
		return this.sheetContent.get(0);
	}
	List<Map<String,String>> content;
	List<ColModel> colModel;
	public List<ColModel> getColModel() {
		return colModel;
	}
	public int removeRow(int index){
		if(sheetContent.get(index).get(0).equals(String.valueOf(index))){
			sheetContent.add(index,null);
			sheetContent.remove(index+1);
			
		}
		
		return 1;
	}
	public int updateSheet(){
		List<List<String>> copy=new ArrayList<List<String>>();
		for(int i=0,k=0;i<sheetContent.size();i++){
			List temp=sheetContent.get(i);
			if(temp==null){
				continue;
			}
			copy.add(updateValueByIndex(temp,0,String.valueOf(k)));
			k++;
		}
		sheetContent=copy;
		return 1;
	}
	public List<String> updateValueByIndex(List<String> list,int index,String valueNew){
		list.add(index,valueNew);
		list.remove(index+1);
		return list;
	}
	public int buildContent(int page, int rows){
		content=new ArrayList<Map<String,String>>();
		Map<String, String> temp;
		String titleS;
		String value;
		int index;
		int start=1+(page-1)*rows;
		for(int i=start;i<sheetContent.size()&&(i<start+rows);i++){
			 temp=new HashMap<String, String>();
			 for(Iterator<String> iter=sheetTitle.keySet().iterator();iter.hasNext();){
				 titleS=iter.next();
				 index=sheetTitle.get(titleS);
				 value=sheetContent.get(i).get(index);
				 temp.put(titleS, value);
			 }
			 content.add(temp);
		}
		return 1;
	}
	public List<Map<String, String>> getContent() {
		
		//buildContent();
		
		return content;
	}
	public void insertIndexID(){
		sheetTitle.put("Index_ID",0);
		colModel.add(0, new ColModel("Index_ID",true));
		if(sheetContent.size()==0){
			return;
		}
		sheetContent.get(0).add(0,"Index_ID");
		for(int i=1;i<sheetContent.size();i++){
			List<String> list=sheetContent.get(i);			
			list.add(0, String.valueOf(i));
		}
	}
	public SheetContent(Sheet sheet) {

		int firstRowIndex = sheet.getFirstRowNum();
		int lastRowIndex = sheet.getLastRowNum();
		List<String> valueTemp;
		this.Name=sheet.getSheetName();
		this.sheetTitle=new HashMap<String,Integer>();
		colModel=new ArrayList<ColModel>();
		
		getType(this.Name);
		sheetContent=new ArrayList<List<String>>();
		for (int rIndex = firstRowIndex; rIndex <= lastRowIndex; rIndex++) {
			Row row = sheet.getRow(rIndex);
			if (row != null) {
				int firstCellIndex = row.getFirstCellNum();
				int lastCellIndex = row.getLastCellNum();
				valueTemp=new ArrayList<String>();
				
				for (int cIndex = firstCellIndex; cIndex < lastCellIndex; cIndex++) {
					Cell cell = row.getCell(cIndex);
					String value = "";
					if (cell != null) {
						value = cell.toString();
						valueTemp.add(value);
						//System.out.print(value + "\t");
						if(rIndex==0){
							this.sheetTitle.put(value, cIndex+1);
							
							colModel.add(new ColModel(value));
						}
					}
					
				}
				sheetContent.add(valueTemp);
				System.out.println();
			}
		}
		insertIndexID();
	}
	public int getType(String sName){
		if(sName.indexOf("输入")!=-1){
			type=1;
		}
		if(sName.indexOf("输出")!=-1){
			type=2;
		}
		return type;
	}
	
	List<List<String>> sheetContent;
	Map<String,Integer>  sheetTitle;
	int type;
	String Name;
	public String getName() {
		return Name;
	}
	public int getSize() {
		
		return sheetContent.size();
	}
}
