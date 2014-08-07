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
	public int editCell(int index_ID, int col_ID, String newValue) {
		// TODO Auto-generated method stub
		List<String> temp=sheetContent.get(index_ID);//获取第几行
		updateValueByIndex(temp,col_ID,newValue);//修改该行的第col_ID的值
		return 1;
	}
	public int removeRow(int index){//删除行
		if(sheetContent.get(index).get(0).equals(String.valueOf(index))){
			sheetContent.set(index,null);
			
		}
		
		return 1;
	}
	public int updateSheet(){//修改excel的行的序号，去掉空行
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
		list.set(index,valueNew);
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
				 if(index>=sheetContent.get(i).size()){
					 value="";
				 }else{
				 value=sheetContent.get(i).get(index);
				 }
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
	int sheetID;
	public SheetContent(Sheet sheet,int sheetID) {
		this.sheetID=sheetID;
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
						if(rIndex==0&&value.equals(""))
						{
						
						}else{
							valueTemp.add(value);
						}
						//System.out.print(value + "\t");
						if(rIndex==0&&!value.equals("")){
							if(this.sheetID==1){
							//	System.out.println("catch");
							}
							this.sheetTitle.put(value, cIndex+1);
							
							colModel.add(new ColModel(value));
						}
					}
					
				}
				sheetContent.add(valueTemp);
				//System.out.println();
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
	
	List<List<String>> sheetContent;//二维数组，第一行是list是title的数组
	Map<String,Integer>  sheetTitle;
	int type;
	String Name;
	public String getName() {
		return Name;
	}
	public int getSize() {
		
		return sheetContent.size();
	}
	public int addRow(Map<String, String> postMap) {
		List<String> row=new ArrayList<String>();
		String value;
		String titleS;
		for(int i=0;i<sheetTitle.size();i++){
			titleS=getKeyFromValue(sheetTitle,i);
			value=postMap.get(titleS);
			
			row.add(value);
		 }
		sheetContent.add(row);
		updateSheet();
		return 1;
		
	}
	public String getKeyFromValue(Map<String,Integer> map,int value){
		String t;
		for(Iterator<String> iter=sheetTitle.keySet().iterator();iter.hasNext();){
			 t=iter.next();
			 int index=sheetTitle.get(t);
			 if(index==value){
				 return t;
			 }
			
			 
		 }
		return null;
	}
	public void coveredByImport(SheetContent sheetContent2) {
		this.clearSheet();
		for(int i=1;i<sheetContent2.sheetContent.size();i++){
			this.sheetContent.add(sheetContent2.sheetContent.get(i));
		}
		this.updateSheet();
	}
	public void clearSheet(){
		List<String> titile=this.sheetContent.get(0);
		this.sheetContent.clear();
		this.sheetContent.add(titile);
		
	}

}
