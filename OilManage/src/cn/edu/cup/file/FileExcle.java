package cn.edu.cup.file;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.opensymphony.xwork2.ActionContext;

public class FileExcle {
	private static String ExcleAlgBaseDir="ExcleFrame";
	private static String ExcleProBaseDir="ExcleProject";
	
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
		new FileExcle().readExcle(1,"E:\\profit\\oil项目\\Input-General.xls");
	}
	public int getProID() {
		return proID;
	}
	public SheetContent getSheetByID(int id){
		return excleContent.get(id);
	}
	int proID;
	String fileName;
	public int readExcle(int proID,String fileName) {
		this.proID=proID;
		this.fileName=fileName;
		InputStream inputStream;
		try {
			String path=this.getClass().getClassLoader().getResource("").getPath();
			path=path.substring(0, path.lastIndexOf("/WEB-INF"));
			path=path+File.separator+fileName;
			inputStream = new FileInputStream(new File(path));

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
				SheetContent temp=new SheetContent(sheet,i); 
				excleContent.add(temp);
				//System.out.println(sheet.getSheetName());
				
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
	public int insertCell(Row row1,int i,int j,String value){
		if(j==0){
			return 1;
		}
		Cell cell1_1 = row1.createCell(j-1);  
		cell1_1.setCellValue(value);
		return 1;
	}
	public int insertRow(Sheet sheet,int i,List<String> values){
		Row row = sheet.createRow(i);  
		for(int j=0;j<values.size();j++){
			insertCell(row,i,j,values.get(j));
		}

		return 1;
	}
	public int saveExcle(){
		//生成Workbook
		HSSFWorkbook wb = new HSSFWorkbook();

		//添加Worksheet（不添加sheet时生成的xls文件打开时会报错）
		//@SuppressWarnings("unused")
		List<Sheet> sheets=new ArrayList<Sheet>();
		for(int i=0;i<this.excleContent.size();i++){
			sheets.add(wb.createSheet(excleContent.get(i).getName()));
			SheetContent temp=excleContent.get(i);
			for(int k=0;k<temp.sheetContent.size();k++){
				insertRow(sheets.get(i),k,temp.sheetContent.get(k));
			}
		}

		
		//保存为Excel文件
		FileOutputStream out = null;

		try {
		    out = new FileOutputStream(this.fileName);
		    wb.write(out);		
		} catch (IOException e) {
		
		    System.out.println(e.toString());
			return -1;
		} finally {
		    try {
		        out.close();
		    } catch (IOException e) {
		        System.out.println(e.toString());
		    }
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
