package cn.edu.cup.file;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;

public class SheetContent {
	public List<String> getTitle(){
		return this.sheetContent.get(0);
	}
	List<ColModel> colModel;
	public List<ColModel> getColModel() {
		return colModel;
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
						System.out.print(value + "\t");
						if(rIndex==0){
							this.sheetTitle.put(value, cIndex);
							colModel.add(new ColModel(value));
						}
					}
					
				}
				sheetContent.add(valueTemp);
				System.out.println();
			}
		}
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
}
