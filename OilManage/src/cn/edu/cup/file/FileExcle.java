package cn.edu.cup.file;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.opensymphony.xwork2.ActionContext;

public class FileExcle {
	public String getMsg() {
		return msg;
	}
	public int getSheetNum() {
		return sheetNum;
	}
	public List<SheetContent> getExcleContent() {
		return excleContent;
	}

	String msg = "";
	int sheetNum = 0;
	List<SheetContent> excleContent;

	public String saveExcle(String fileName){
		return "success";
	}
	private void saveInSession(){
		  ActionContext actionContext = ActionContext.getContext();   
		  
	       Map session = actionContext.getSession();   
	  
	       session.put("operatingExcle", excleContent);   
	  
	}
	private void getInSession(){
		  ActionContext actionContext = ActionContext.getContext();   
		  
	       Map session = actionContext.getSession();   
	  
	       excleContent=(List<SheetContent>)session.get("operatingExcle");   
	  
	}
	public static void main(String args[]) {
		new FileExcle().readExcle("E:\\profit\\oil项目\\Input-General.xls");
	}
	public SheetContent getSheetByID(int id){
		return excleContent.get(id);
	}
	public int readExcle(String fileName) {
		InputStream inputStream;
		try {
			inputStream = new FileInputStream(new File(fileName));

			Workbook wb = null;
			// 解析xls格式
			if (fileName.endsWith("xls")) {

				wb = new HSSFWorkbook(inputStream);

				// 解析xlsx格式
			} else if (fileName.endsWith("xlsx")) {
				wb = new XSSFWorkbook(inputStream);// 解析xlsx格式
			}
			sheetNum = wb.getNumberOfSheets();
			excleContent=new ArrayList<SheetContent>();
			for (int i = 0; i < sheetNum; i++) {
				Sheet sheet = wb.getSheetAt(i);// 第i个工作表
				SheetContent temp=new SheetContent(sheet); 
				excleContent.add(temp);
				System.out.println(sheet.getSheetName());
				
				}
			
			msg="excle解析成功";
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			msg = "Excle文件未找到";
			return -1;
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			msg = "Excle文件格式不正确";
			return -1;
		}
		return 1;
	}

	public String writeExcle(String fileName) {
		return "Success";

	}

	// 读取表头
	public String getTitle() {
		return "";
	}


}
