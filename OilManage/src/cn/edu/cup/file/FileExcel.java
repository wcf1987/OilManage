package cn.edu.cup.file;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import cn.edu.cup.manage.business.DeviceKV;
import cn.edu.cup.manage.dao.AlgorithmsCycleDao;
import cn.edu.cup.map.business.Graphi;
import cn.edu.cup.map.business.Line;
import cn.edu.cup.map.business.Point;
import cn.edu.cup.tools.Tools;

public class FileExcel {
	private static String ExcelAlgBaseDir = "ExcelFrame";
	private static String ExcelProBaseDir = "ExcelProject";

	public String getMsg() {
		return msg;
	}

	public int getSheetNum() {
		return sheetNum;
	}

	public List<SheetContent> getExcelContent() {
		return excleContent;
	}

	String msg = "";
	int sheetNum = 0;
	List<SheetContent> excleContent;

	/*
	 * private void saveInSession(){ ActionContext actionContext =
	 * ActionContext.getContext();
	 * 
	 * Map session = actionContext.getSession();
	 * 
	 * session.put("operatingExcel", excleContent);
	 * 
	 * } private void getInSession(){ ActionContext actionContext =
	 * ActionContext.getContext();
	 * 
	 * Map session = actionContext.getSession();
	 * 
	 * excleContent=(List<SheetContent>)session.get("operatingExcel");
	 * 
	 * }
	 */
	public static void main(String args[]) {
		// new FileExcel().readExcel(1,"E:\\profit\\oil项目\\Input-General.xls");
	}

	public int getProID() {
		return proID;
	}

	public SheetContent getSheetByID(int id) {
		return excleContent.get(id);
	}

	int proID;
	int algID;
	String InOrOut;

	public String getInOrOut() {
		return InOrOut;
	}

	String fileName;

	public String getFileName() {
		return fileName;
	}

	public int readExcel(int proID, int algid, String InOrOut, String fileName)
			throws IOException {
		this.proID = proID;
		this.algID = algid;
		this.fileName = fileName;
		this.InOrOut = InOrOut;
		InputStream inputStream;
		try {
			String path = Tools.getWebRoot() + fileName;
			inputStream = new FileInputStream(new File(path));
			// System.out.println(123);
			Workbook wb = null;
			// 解析xls格式
			if (fileName.endsWith("xls")) {

				// System.out.println("read excel"+fileName);
				wb = new HSSFWorkbook(inputStream);

				// 解析xlsx格式
			} else if (fileName.endsWith("xlsx")) {
				wb = new XSSFWorkbook(inputStream);// 解析xlsx格式
			}
			sheetNum = wb.getNumberOfSheets();
			excleContent = new ArrayList<SheetContent>();
			for (int i = 0; i < sheetNum; i++) {
				Sheet sheet = wb.getSheetAt(i);// 第i个工作表
				SheetContent temp = new SheetContent(sheet, i);
				excleContent.add(temp);
				// System.out.println(sheet.getSheetName());

			}
			msg = "excle解析成功";
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

			msg = "Excel文件未找到";
			return -1;
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			msg = "Excel文件格式不正确";
			// inputStream.close();
			return -1;
		}
		inputStream.close();
		return 1;
	}

	public int getAlgID() {
		return algID;
	}

	Cell cell1_1;

	public int insertCell(Row row1, int i, int j, String value) {
		if (j == 0) {
			return 1;
		}
		cell1_1 = row1.createCell(j - 1);
		if(Tools.getType(value)==3){
			cell1_1.setCellType(Cell.CELL_TYPE_STRING);
			cell1_1.setCellValue(value);
		}if(Tools.getType(value)==1||Tools.getType(value)==2){
			cell1_1.setCellType(Cell.CELL_TYPE_NUMERIC);
			cell1_1.setCellValue(Double.valueOf(value));
		}if(Tools.getType(value)==-1){
			cell1_1.setCellType(Cell.CELL_TYPE_BLANK);
			//cell1_1.setCellValue(null);
		}
		
		
		return 1;
	}

	Row row;

	public int insertRow(Sheet sheet, int i, List<String> values) {
		row = sheet.createRow(i);
		for (int j = 0; j < values.size(); j++) {
			insertCell(row, i, j, values.get(j));
		}

		return 1;
	}

	public int saveExcel() {// 保存到文件
		// 生成Workbook
		// Workbook wb = new SXSSFWorkbook(1000);
		Workbook wb = new HSSFWorkbook();
		// 添加Worksheet（不添加sheet时生成的xls文件打开时会报错）
		// @SuppressWarnings("unused")
		List<Sheet> sheets = new ArrayList<Sheet>();
		for (int i = 0; i < this.excleContent.size(); i++) {
			sheets.add(wb.createSheet(excleContent.get(i).getName()));
			SheetContent temp = excleContent.get(i);
			for (int k = 0; k < temp.sheetContent.size(); k++) {
				insertRow(sheets.get(i), k, temp.sheetContent.get(k));
			}
		}

		// 保存为Excel文件
		FileOutputStream out = null;

		try {
			out = new FileOutputStream(Tools.getWebRoot() + this.fileName);
			System.out.println("save " + this.fileName);
			wb.write(out);
		} catch (IOException e) {

			// System.out.println(e.toString());
			return -1;
		} finally {
			try {
				out.close();
			} catch (IOException e) {
				// System.out.println(e.toString());
			}
		}

		return 1;
	}

	public String writeExcel(String fileName) {

		return "Success";

	}

	// 读取表头
	public String getTitle() {
		return "";
	}

	public void coverFromImport(FileExcel importExcle) {
		List<SheetContent> list = importExcle.getExcelContent();
		for (int i = 0; i < list.size()&&i <this.excleContent.size(); i++) {
			SheetContent temp = this.excleContent.get(i);
			if (temp.getName().equals(list.get(i).getName())) {
				this.excleContent.get(i).coveredByImport(list.get(i));
			}
		}

	}

	public Graphi getGraphi() {
		Graphi a = new Graphi();
		a.setPoints(getPoints());
		a.setLines(getLines());

		return a;
	}

	public Graphi getGisGraphi() {
		Graphi a = new Graphi();
		a.setPoints(getGisPoints());
		a.setLines(getGisLines());
		Collection<Point> names=a.getPoints().values();
		for(Iterator<Point> temp=names.iterator();temp.hasNext();){
			Point t=temp.next();
			if(t.getLatitude()<20&&t.getLongitude()<20){
				a.setGISReal(0);
				break;
			}
		}

		if(a.getGISReal()==0){
			updatePointGPS(names);
		}
		return a;
	}

	public int getType(int algid) {
		AlgorithmsCycleDao dao = new AlgorithmsCycleDao();
		return dao.getAlgType(algid);

	}

	private Map<String, Point> getPoints() {

		int type = getType(algID);
		Map<String, Point> Points = new HashMap<String, Point>();
		if (type == 1) {
			for (int i = 0; i < this.excleContent.size(); i++) {

				SheetContent temp = this.excleContent.get(i);

				Points.putAll(temp.getSimulationPoints(this));

			}
		}
		if (type == 2) {
			for (int i = 0; i < this.excleContent.size(); i++) {

				SheetContent temp = this.excleContent.get(i);

				Points.putAll(temp.getPoints());

			}
		}
		return Points;
	}

	private Map<String, Point> getGisPoints() {

		int type = getType(algID);
		Map<String, Point> Points = new HashMap<String, Point>();
		if (type == 1) {
			for (int i = 0; i < this.excleContent.size(); i++) {

				SheetContent temp = this.excleContent.get(i);

				Points.putAll(temp.getGisSimulationPoints(this));

			}
		}
		if (type == 2) {
			for (int i = 0; i < this.excleContent.size(); i++) {

				SheetContent temp = this.excleContent.get(i);

				Points.putAll(temp.getPoints());

			}
		}
		return Points;
	}

	private List<Line> getLines() {

		int type = getType(algID);
		List<Line> lines = new ArrayList<Line>();
		if (type == 1) {
			for (int i = 0; i < this.excleContent.size(); i++) {

				SheetContent temp = this.excleContent.get(i);

				lines.addAll(temp.getSimulationLines());

			}
		}
		if (type == 2) {

			for (int i = 0; i < this.excleContent.size(); i++) {

				SheetContent temp = this.excleContent.get(i);

				lines.addAll(temp.getLines());

			}
		}

		return lines;
	}

	private List<Line> getGisLines() {

		int type = getType(algID);
		List<Line> lines = new ArrayList<Line>();
		if (type == 1) {
			for (int i = 0; i < this.excleContent.size(); i++) {

				SheetContent temp = this.excleContent.get(i);

				lines.addAll(temp.getGisSimulationLines());

			}
		}
		if (type == 2) {

			for (int i = 0; i < this.excleContent.size(); i++) {

				SheetContent temp = this.excleContent.get(i);

				lines.addAll(temp.getLines());

			}
		}

		return lines;
	}

	public Graphi getObstacleGraphi() {
		Graphi a = null;
		for (int i = 0; i < this.excleContent.size(); i++) {

			SheetContent temp = this.excleContent.get(i);

			if (temp.getName().equals("障碍区")) {
				a = temp.getObstacle();
			}

		}

		return a;
	}
	
	public Map<String, List<Point>> getPathGraphi() {
		Map<String, List<Point>> a = new HashMap<String, List<Point>>();
		for (int i = 0; i < this.excleContent.size(); i++) {

			SheetContent temp = this.excleContent.get(i);

			if (temp.getName().equals("路径")) {
				a = temp.getPathMap();
			}

		}

		Collection<List<Point>> names1=a.values();
		int tempReal=1;
		Collection<Point> names=new ArrayList<Point>();
		for(Iterator<List<Point>> temp=names1.iterator();temp.hasNext();){
			List<Point> t=temp.next();
			names.addAll(t);
		}
		for(Iterator<Point> temp=names.iterator();temp.hasNext();){
			Point t=temp.next();
			if(t.getLatitude()<20&&t.getLongitude()<20){
				tempReal=0;
				break;
			}
		}
		
		if(tempReal==0){
			updatePointGPS(names);
		}
		return a;
	}
	public void updatePointGPS(Collection<Point> names){
		double Xmax=0;
		double Xmin=100000000;
		double Ymax=0;
		double Ymin=100000000;
		for(Iterator<Point> temp=names.iterator();temp.hasNext();){
			Point t=temp.next();
			if(t.getGeodeticCoordinatesX()>Xmax){
				Xmax=t.getGeodeticCoordinatesX();
			}
			if(t.getGeodeticCoordinatesX()<Xmin&&t.getGeodeticCoordinatesX()!=0){
				Xmin=t.getGeodeticCoordinatesX();
			}
			if(t.getGeodeticCoordinatesY()>Ymax){
				Ymax=t.getGeodeticCoordinatesY();
			}
			if(t.getGeodeticCoordinatesY()<Ymin&&t.getGeodeticCoordinatesY()!=0){
				Ymin=t.getGeodeticCoordinatesY();
			}
		}
		double Xc=0.02/(Xmax-Xmin);
		double Yc=0.02/(Ymax-Ymin);
		for(Iterator<Point> temp=names.iterator();temp.hasNext();){
			Point t=temp.next();				
			t.setLongitude((t.getGeodeticCoordinatesX()-Xmin)*Xc+116);
			t.setLatitude((t.getGeodeticCoordinatesY()-Ymin)*Yc+39);
		}
		
	}
	public Map<String, List<Point>> getObstacleMap() {
		Map<String, List<Point>> a = new HashMap<String, List<Point>>();
		for (int i = 0; i < this.excleContent.size(); i++) {

			SheetContent temp = this.excleContent.get(i);

			if (temp.getName().equals("障碍区")) {
				a = temp.getObstacleMap();
			}

		}

		Collection<List<Point>> names1=a.values();
		int tempReal=1;
		Collection<Point> names=new ArrayList<Point>();
		for(Iterator<List<Point>> temp=names1.iterator();temp.hasNext();){
			List<Point> t=temp.next();
			names.addAll(t);
		}
		for(Iterator<Point> temp=names.iterator();temp.hasNext();){
			Point t=temp.next();
			if(t.getLatitude()<20&&t.getLongitude()<20){
				tempReal=0;
				break;
			}
		}
		
		if(tempReal==0){
			updatePointGPS(names);
			
		}
		return a;
	}

	public SheetContent getObstacleSheet() {
		for (int i = 0; i < this.excleContent.size(); i++) {

			SheetContent temp = this.excleContent.get(i);

			if (temp.getName().equals("障碍区")) {
				return temp;
			}

		}
		return null;
	}

	public SheetContent getSheetByName(FileExcel excel, String name) {
		for (int i = 0; i < excel.excleContent.size(); i++) {

			SheetContent temp = this.excleContent.get(i);

			if (temp.getName().equals(name)) {
				return temp;
			}

		}
		return null;
	}

	public int getTypeCodeByName(String Name) {
		if (Name.equalsIgnoreCase("气井数据") || Name.equalsIgnoreCase("气源数据")
				|| Name.equalsIgnoreCase("分输点数据") || Name.equals("设备连接点数据"))
			return 0;
		if (Name.equalsIgnoreCase("离心压缩机数据")
				|| Name.equalsIgnoreCase("往复式压缩机数据"))
			return 1;
		if (Name.equalsIgnoreCase("管道数据"))
			return 2;
		if (Name.equalsIgnoreCase("阀数据") || Name.equalsIgnoreCase("过滤器数据"))
			return 3;

		return 9;
	}

	public boolean checkCol(String type, String colName) {

		if (type.equalsIgnoreCase("离心压缩机数据")
				|| type.equalsIgnoreCase("往复式压缩机数据")) {
			String colNames[] = { "序号", "名称", "管段类型", "管长(km)", "管内径(m)",
					"绝对粗糙度(m)", "气体方程", "分段数" };
			for (int i = 0; i < colNames.length; i++) {
				if (colName.equalsIgnoreCase(colNames[i])) {
					return false;
				}
			}
			return true;
		}
		if (type.equalsIgnoreCase("管道数据")) {
			String colNames[] = { "设备名称" };
			for (int i = 0; i < colNames.length; i++) {
				if (colName.equalsIgnoreCase(colNames[i])) {
					return false;
				}
			}
			return true;
		}
		if (type.equalsIgnoreCase("阀数据")) {
			String colNames[] = { "名称", "管段类型", "分段数" };
			for (int i = 0; i < colNames.length; i++) {
				if (colName.equalsIgnoreCase(colNames[i])) {
					return false;
				}
			}
			return true;
		}
		if (type.equalsIgnoreCase("过滤器数据")) {
			String colNames[] = { "名称", "管段类型", "绝对粗糙度(m)", "分段数", "气体方程" };
			for (int i = 0; i < colNames.length; i++) {
				if (colName.equalsIgnoreCase(colNames[i])) {
					return false;
				}
			}
			return true;
		}

		return true;
	}

	public String getTypeByYSJLS(String Name) {
		if (Name.equalsIgnoreCase("集气增压站"))
			return "JQZYZ01";
		if (Name.equalsIgnoreCase("主动增压点"))
			return "ZDZYD01";
		if (Name.equalsIgnoreCase("中央处理厂"))
			return "ZYCLC01";
		return "";
	}

	public int addPoint(String type, String name, String YSJLS) {
		SheetContent a = getSheetByName(this, type);
		// int row=a.getExcelDataIndex(a, a.getTitleByName("名称"),name );

		int row;
		/*
		 * if(row==-1){ Map<String,String> p=new HashMap<String,String>();
		 * 
		 * p.put("名称", name);
		 * 
		 * row=a.addRow(p);
		 * 
		 * }else{ return row; }
		 */
		if (getTypeCodeByName(type) == 1) {
			a = getSheetByName(this, type);
			SheetContent b = getSheetByName(this, "管段连接");
			row = a.getExcelDataIndex(a, a.getTitleByName("名称"), name);
			int row2 = b.getExcelDataIndex(b, b.getTitleByName("设备名称"), name);

			if (row == -1 && row2 == -1) {
				Map<String, String> p = new HashMap<String, String>();
				YSJLS = getTypeByYSJLS(YSJLS);
				p.put("名称", name);
				p.put("设备位置", YSJLS);
				row = a.addRow(p);

				Map<String, String> p1 = new HashMap<String, String>();
				p1.put("设备名称", name);
				p1.put("名称", name);

				if (type.equals("离心压缩机数据")) {
					p1.put("管段类型", "CentCompressor");
					p1.put("设备位置", YSJLS);
				}
				if (type.equals("往复式压缩机数据")) {
					p1.put("管段类型", "ReciCompressor");
					p1.put("设备位置", YSJLS);
				}
				if (type.equals("阀数据")) {
					p1.put("管段类型", "Valve");
				}
				if (type.equals("过滤器数据")) {
					p1.put("管段类型", "Filter");
				}
				row2 = b.addRow(p1);
				return -1;
			} else {
				return row;
			}
		}
		if (getTypeCodeByName(type) == 0) {
			a = getSheetByName(this, "节点数据");
			row = a.getExcelDataIndex(a, a.getTitleByName("名称"), name);
			if (row == -1) {
				Map<String, String> p = new HashMap<String, String>();
				p.put("名称", name);
				p.put("气井、气源或分输点名称", name);
				p.put("隶属关系", type.replace("数据", ""));
				row = a.addRow(p);
				return -1;
			} else {
				return row;
			}
		}
		if (getTypeCodeByName(type) == 2) {
			a = getSheetByName(this, "管段连接");
			row = a.getExcelDataIndex(a, a.getTitleByName("名称"), name);
			if (row == -1) {
				Map<String, String> p = new HashMap<String, String>();
				p.put("名称", name);
				p.put("管段类型", "Pipe");
				row = a.addRow(p);
				return -1;
			} else {
				return row;
			}
		}
		if (getTypeCodeByName(type) == 3) {
			a = getSheetByName(this, type);
			row = a.getExcelDataIndex(a, a.getTitleByName("名称"), name);
			if (row == -1) {
				Map<String, String> p = new HashMap<String, String>();
				p.put("名称", name);
				row = a.addRow(p);
				return -1;
			} else {
				return row;
			}
		}
		return 0;
	}

	public int delPoint(String type, String name) {
		SheetContent a = getSheetByName(this, type);
		int row;
		if (a != null) {
			row = a.getExcelDataIndex(a, a.getTitleByName("名称"), name);

			if (row != -1) {
				a.removeRow(row);
				a.updateSheet();
			}
		}

		a = getSheetByName(this, "节点数据");
		row = a.getExcelDataIndex(a, a.getTitleByName("名称"), name);

		if (row != -1) {
			a.removeRow(row);

		}
		a.updateSheet();
		a = getSheetByName(this, "管段连接");
		row = a.getExcelDataIndex(a, a.getTitleByName("上游节点"), name);
		if (row != -1) {
			a.removeRow(row);
		}
		row = a.getExcelDataIndex(a, a.getTitleByName("下游节点"), name);
		if (row != -1) {
			a.removeRow(row);
		}
		row = a.getExcelDataIndex(a, a.getTitleByName("名称"), name);
		if (row != -1) {
			a.removeRow(row);
		}
		a.updateSheet();
		return 0;
	}

	public void updateConn(Line line) {
		SheetContent a = getSheetByName(this, "管段连接");

		int row = a
				.getExcelDataIndex(a, a.getTitleByName("名称"), line.getName());

		if (row != -1) {
			a.editCell(row, a.getTitleByName("上游节点"), line.getStart());
			a.editCell(row, a.getTitleByName("下游节点"), line.getEnd());

		} else {

		}

	}

	public List<DeviceKV> getDiviceOut(String type, String name,
			FileExcel excelIn) {
		Point e = new Point();
		List<DeviceKV> a = new ArrayList<>();

		if (getTypeCodeByName(type) == 0) {
			SheetContent sheet = getSheetByName(this, type);
			SheetContent sheet1 = excelIn.getSheetByName(excelIn, "节点数据");
			int row1 = sheet1.getExcelDataIndex(sheet1,
					sheet1.getTitleByName("名称"), name);
			String name1 = sheet1.getExcelData(sheet1, row1,
					sheet1.getTitleByName("气井、气源或分输点名称"));
			int row = sheet.getExcelDataIndex(sheet,
					sheet.getTitleByName("名称"), name1);
			List<String> line = sheet.sheetContent.get(row);
			Map<String, String> map = sheet.getAttribute(line);
			List<String> list = sheet.sheetContent.get(0);
			list = list.subList(1, list.size());
			for (Iterator<String> iter = list.iterator(); iter.hasNext();) {
				String key = iter.next();
				String value = map.get(key);
				DeviceKV KV = new DeviceKV();
				KV.setName(key);
				KV.setValue(value);
				a.add(KV);
			}
		}
		if (getTypeCodeByName(type) == 2) {
			SheetContent sheet = getSheetByName(this, "管道数据");
			int row = sheet.getExcelDataIndex(sheet,
					sheet.getTitleByName("名称"), name);
			List<String> line = sheet.sheetContent.get(row);
			Map<String, String> map = sheet.getAttribute(line);
			List<String> list = sheet.sheetContent.get(0);
			list = list.subList(1, list.size());
			for (Iterator<String> iter = list.iterator(); iter.hasNext();) {
				String key = iter.next();
				String value = map.get(key);
				DeviceKV KV = new DeviceKV();
				KV.setName(key);
				KV.setValue(value);
				a.add(KV);
			}
		}
		if (getTypeCodeByName(type) == 1) {

			// SheetContent sheet1=excelIn.getSheetByName(excelIn, type);
			// int row1=sheet1.getExcelDataIndex(sheet1,
			// sheet1.getTitleByName("名称"), name);
			// String name1=sheet1.getExcelData(sheet1, row1,
			// sheet1.getTitleByName("设备位置"));

			SheetContent sheet = getSheetByName(this, type);
			int row = sheet.getExcelDataIndex(sheet,
					sheet.getTitleByName("名称"), name);
			List<String> line = sheet.sheetContent.get(row);
			Map<String, String> map = sheet.getAttribute(line);
			List<String> list = sheet.sheetContent.get(0);
			list = list.subList(1, list.size());
			for (Iterator<String> iter = list.iterator(); iter.hasNext();) {
				String key = iter.next();
				String value = map.get(key);
				DeviceKV KV = new DeviceKV();
				KV.setName(key);
				KV.setValue(value);
				a.add(KV);
			}
		}
		if (getTypeCodeByName(type) == 3) {
			SheetContent sheet = getSheetByName(this, type);
			int row = sheet.getExcelDataIndex(sheet,
					sheet.getTitleByName("名称"), name);
			List<String> line = sheet.sheetContent.get(row);
			Map<String, String> map = sheet.getAttribute(line);
			List<String> list = sheet.sheetContent.get(0);
			list = list.subList(1, list.size());
			for (Iterator<String> iter = list.iterator(); iter.hasNext();) {
				String key = iter.next();
				String value = map.get(key);
				DeviceKV KV = new DeviceKV();
				KV.setName(key);
				KV.setValue(value);
				a.add(KV);
			}
		}
		return a;

	}
	public List<DeviceKV> getDiviceOptOut(String type, String name,
			FileExcel excelIn) {
		Point e = new Point();
		List<DeviceKV> a = new ArrayList<>();

		
		
		SheetContent sheet = getSheetByName(this, type);
		int row = sheet.getExcelDataIndex(sheet,
				sheet.getTitleByName("名称"), name);
		List<String> line = sheet.sheetContent.get(row);
		Map<String, String> map = sheet.getAttribute(line);
		List<String> list = sheet.sheetContent.get(0);
		list = list.subList(1, list.size());
		for (Iterator<String> iter = list.iterator(); iter.hasNext();) {
			String key = iter.next();
			String value = map.get(key);
			DeviceKV KV = new DeviceKV();
			KV.setName(key);
			KV.setValue(value);
			if (key.equals("序号") || key.equals("隶属关系")) {
				continue;
			}
			a.add(KV);
		}
		
		
		return a;

	}
	public List<DeviceKV> getDiviceOptIn(String type, String name) {

		Point e = new Point();
		List<DeviceKV> a = new ArrayList<>();		
		SheetContent sheet = getSheetByName(this, "井数据");
		int row = sheet.getExcelDataIndex(sheet,sheet.getTitleByName("名称"), name);
			List<String> line = sheet.sheetContent.get(row);
			Map<String, String> map = sheet.getAttribute(line);
			List<String> list = sheet.sheetContent.get(0);
			list = list.subList(1, list.size());
			for (Iterator<String> iter = list.iterator(); iter.hasNext();) {
				String key = iter.next();
				String value = map.get(key);
				DeviceKV KV = new DeviceKV();
				KV.setName(key);
				KV.setValue(value);
				if (key.equals("序号") || key.equals("隶属关系")) {
					continue;
				}
				a.add(KV);
			}	
		return a;

	}
	public List<DeviceKV> getDiviceIn(String type, String name) {
		Point e = new Point();
		List<DeviceKV> a = new ArrayList<>();

		if (getTypeCodeByName(type) == 0) {
			SheetContent sheet = getSheetByName(this, "节点数据");
			int row = sheet.getExcelDataIndex(sheet,
					sheet.getTitleByName("名称"), name);
			List<String> line = sheet.sheetContent.get(row);
			Map<String, String> map = sheet.getAttribute(line);
			List<String> list = sheet.sheetContent.get(0);
			list = list.subList(1, list.size());
			for (Iterator<String> iter = list.iterator(); iter.hasNext();) {
				String key = iter.next();
				String value = map.get(key);
				DeviceKV KV = new DeviceKV();
				KV.setName(key);
				KV.setValue(value);
				if (key.equals("序号") || key.equals("隶属关系")) {
					continue;
				}
				a.add(KV);
			}

		}
		if (getTypeCodeByName(type) == 2) {
			SheetContent sheet = getSheetByName(this, "管段连接");
			int row = sheet.getExcelDataIndex(sheet,
					sheet.getTitleByName("名称"), name);
			List<String> line = sheet.sheetContent.get(row);
			Map<String, String> map = sheet.getAttribute(line);
			List<String> list = sheet.sheetContent.get(0);
			list = list.subList(1, list.size());
			for (Iterator<String> iter = list.iterator(); iter.hasNext();) {
				String key = iter.next();
				String value = map.get(key);
				DeviceKV KV = new DeviceKV();
				KV.setName(key);
				KV.setValue(value);
				if (key.equals("序号") || key.equals("设备名称")) {
					continue;
				}
				a.add(KV);
			}

		}
		if (getTypeCodeByName(type) == 1) {
			TransTable temp = new TransTable(this, type);
			a = temp.createData(name);
			/*
			 * SheetContent sheet=getSheetByName(this,"管段连接"); int
			 * row=sheet.getExcelDataIndex(sheet, sheet.getTitleByName("设备名称"),
			 * name); List<String> line=sheet.sheetContent.get(row);
			 * Map<String,String> map=sheet.getAttribute(line); List<String>
			 * list=sheet.sheetContent.get(0); list=list.subList(1,
			 * list.size()); for (int i=0;i<BASE.length;i++) {
			 * 
			 * String key=BASE[i]; String value=map.get(key); DeviceKV KV=new
			 * DeviceKV(); KV.setName(key); KV.setValue(value); a.add(KV); }
			 * 
			 * String value=map.get("设备名称"); DeviceKV KV=new DeviceKV();
			 * KV.setName("压缩机名称"); KV.setValue(value); a.add(KV);
			 * 
			 * 
			 * value=map.get("设备名称"); KV=new DeviceKV(); KV.setName("压缩机类型");
			 * KV.setValue(type); a.add(KV);
			 * 
			 * sheet=getSheetByName(this,type);
			 * row=sheet.getExcelDataIndex(sheet, sheet.getTitleByName("名称"),
			 * name); line=sheet.sheetContent.get(row);
			 * map=sheet.getAttribute(line); list=sheet.sheetContent.get(0);
			 * list=list.subList(1, list.size());
			 * if(type.equalsIgnoreCase("离心压缩机数据")){ for (int
			 * i=0;i<LXYSJ.length;i++) {
			 * 
			 * String key=LXYSJ[i]; value=map.get(key); KV=new DeviceKV();
			 * KV.setName(key); KV.setValue(value); a.add(KV); } }
			 * if(type.equalsIgnoreCase("往复式压缩机数据")){ for (int
			 * i=0;i<WFYSJ.length;i++) {
			 * 
			 * String key=WFYSJ[i]; value=map.get(key); KV=new DeviceKV();
			 * KV.setName(key); KV.setValue(value); a.add(KV); }
			 * 
			 * }
			 */
		}
		if (getTypeCodeByName(type) == 3) {

			/*
			 * SheetContent sheet=getSheetByName(this,"管段连接"); int
			 * row=sheet.getExcelDataIndex(sheet, sheet.getTitleByName("设备名称"),
			 * name); List<String> line=sheet.sheetContent.get(row);
			 * Map<String,String> map=sheet.getAttribute(line);
			 * 
			 * ArrayList<Note>=TransTable.findByType(type);
			 * 
			 * for (int i=0;i<KEYS.length;i++) {
			 * 
			 * String key=KEYS[i]; String value=map.get(key); if(value==null){
			 * value=map2.get(key); } DeviceKV KV=new DeviceKV();
			 * KV.setName(key); KV.setValue(value); a.add(KV); }
			 */
			TransTable temp = new TransTable(this, type);
			a = temp.createData(name);
		}
		return a;

	}

	public void updateDevice(String type, String name, String proper,
			String newValue) {
		if (getTypeCodeByName(type) == 0) {
			SheetContent sheet = getSheetByName(this, "节点数据");
			int row = sheet.getExcelDataIndex(sheet,
					sheet.getTitleByName("名称"), name);
			sheet.editCell(row, sheet.getTitleByName(proper), newValue);

		}
		if (getTypeCodeByName(type) == 2) {
			SheetContent sheet = getSheetByName(this, "管段连接");
			int row = sheet.getExcelDataIndex(sheet,
					sheet.getTitleByName("名称"), name);
			sheet.editCell(row, sheet.getTitleByName(proper), newValue);
		}
		if (getTypeCodeByName(type) == 1) {
			TransTable temp = new TransTable(this, type);
			temp.updateData(name, proper, newValue);
			/*
			 * SheetContent sheet = getSheetByName(this, type); int row =
			 * sheet.getExcelDataIndex(sheet, sheet.getTitleByName("名称"), name);
			 * sheet.editCell(row, sheet.getTitleByName(proper), newValue);
			 */
		}
		if (getTypeCodeByName(type) == 3) {
			TransTable temp = new TransTable(this, type);
			temp.updateData(name, proper, newValue);
			/*
			 * SheetContent sheet = getSheetByName(this, type); int row =
			 * sheet.getExcelDataIndex(sheet, sheet.getTitleByName("名称"), name);
			 * 
			 * sheet.editCell(row, sheet.getTitleByName(proper), newValue);
			 */
		}

	}
	public String checkNum(String numS,String a,String b){
		if (numS == null || numS.equals("")) {
			return a+"中，"+b+"要大于0";
		}
		Double temp;
		try {
			temp = Double.valueOf(numS);
		} catch (NumberFormatException e) {
			return a+"中，"+b+"要是数字";

		}
		if (temp <= 0) {
			return a+"中，"+b+"要大于0";
		}
		return "OK";
	}
	public String checkNumLow(String numS,String a,String b){
		if (numS == null || numS.equals("")) {
			return a+"中，"+b+"要小于0";
		}
		Double temp;
		try {
			temp = Double.valueOf(numS);
		} catch (NumberFormatException e) {
			return a+"中，"+b+"要是数字";

		}
		if (temp > 0) {
			return a+"中，"+b+"要小于0";
		}
		return "OK";
	}
	/*
	  * 判断是否为整数 
	  * @param str 传入的字符串 
	  * @return 是整数返回true,否则返回false 
	*/


	  public static boolean isInteger(String str) {  
	    Pattern pattern = Pattern.compile("^[-\\+]?[\\d]*$");  
	    return pattern.matcher(str).matches();  
	  }

	public String checkNumInt(String numS,String a,String b){
		if (numS == null || numS.equals("")) {
			return a+"中，"+b+"要大于0";
		}
		Double temp;
		try {
			temp = Double.valueOf(numS);
		} catch (NumberFormatException e) {
			return a+"中，"+b+"要是数字";

		}
		if (temp <= 0) {
			return a+"中，"+b+"要大于0";
		}
		if (temp <= 0) {
			return a+"中，"+b+"要大于0";
		}
		if(!isInteger(numS)){
			return a+"中，"+b+"要是整数";
		}
		return "OK";
	}
	public String check1() {
		// 一个模型中，至少要有一个气井、气源或分输点
		SheetContent sheet = getSheetByName(this, "节点数据");
		if (sheet != null) {
			int row1 = sheet.getExcelDataIndex(sheet,
					sheet.getTitleByName("隶属关系"), "气源");
			int row2 = sheet.getExcelDataIndex(sheet,
					sheet.getTitleByName("隶属关系"), "气源");
			int row3 = sheet.getExcelDataIndex(sheet,
					sheet.getTitleByName("隶属关系"), "气源");
			if (row1 == -1 && row2 == -1 && row3 == -1) {
				return "一个模型中，至少要有一个气井、气源或分输点";
			}

		}
		return "OK";
	}

	public String check2() {
		// 过滤器中，管长、管内径、上下游节点的压力要大于0
		SheetContent sheet = getSheetByName(this, "管段连接");
		SheetContent sheet2 = getSheetByName(this, "节点数据");
		if (sheet != null&&sheet.getTitleByName("管段类型")!=null) {
			List<Integer> rowList = sheet.getExcelDataIndexs(sheet,
					sheet.getTitleByName("管段类型"), "Filter");
			for (int i = 0; i < rowList.size(); i++) {
				String stemp = sheet.getExcelData(sheet, rowList.get(i),
						sheet.getTitleByName("管长(km)"));
				String re=checkNum(stemp,"过滤器","管长(km)");
				if(!re.equals("OK")){
					return re;
				}			
				
				stemp = sheet.getExcelData(sheet, rowList.get(i),
						sheet.getTitleByName("管内径(m)"));
				re=checkNum(stemp,"过滤器","管内径");
				if(!re.equals("OK")){
					return re;
				}
				
				stemp = sheet.getExcelData(sheet, rowList.get(i),
						sheet.getTitleByName("上游节点"));
				int row2=sheet2.getExcelDataIndex(sheet2, sheet.getTitleByName("名称"), stemp);
				stemp = sheet2.getExcelData(sheet, row2,
						sheet2.getTitleByName("节点压力(MPa)"));
				
				re=checkNum(stemp,"过滤器","上游节点压力");
				if(!re.equals("OK")){
					return re;
				}
				
				stemp = sheet.getExcelData(sheet, rowList.get(i),
						sheet.getTitleByName("下游节点"));
				row2=sheet2.getExcelDataIndex(sheet2, sheet.getTitleByName("名称"), stemp);
				stemp = sheet2.getExcelData(sheet, row2,
						sheet2.getTitleByName("节点压力(MPa)"));
				re=checkNum(stemp,"过滤器","下游节点压力");
				if(!re.equals("OK")){
					return re;
				}

			}
		}
		return "OK";
	}
	public String check3() {
		// 在阀的属性窗口中，管长、管内径、绝对粗糙度、上下游节点的压力要大于0
		SheetContent sheet = getSheetByName(this, "管段连接");
		SheetContent sheet2 = getSheetByName(this, "节点数据");
		if (sheet != null&&sheet.getTitleByName("管段类型")!=null) {
			List<Integer> rowList = sheet.getExcelDataIndexs(sheet,
					sheet.getTitleByName("管段类型"), "Valve");
			for (int i = 0; i < rowList.size(); i++) {
				String stemp = sheet.getExcelData(sheet, rowList.get(i),
						sheet.getTitleByName("管长(km)"));
				String re=checkNum(stemp,"阀","管长");
				if(!re.equals("OK")){
					return re;
				}

				stemp = sheet.getExcelData(sheet, rowList.get(i),
						sheet.getTitleByName("管内径(m)"));
				re=checkNum(stemp,"阀","管内径");
				if(!re.equals("OK")){
					return re;
				}
				
				stemp = sheet.getExcelData(sheet, rowList.get(i),
						sheet.getTitleByName("绝对粗糙度(m)"));
				re=checkNum(stemp,"阀","绝对粗糙度");
				if(!re.equals("OK")){
					return re;
				}
				
				stemp = sheet.getExcelData(sheet, rowList.get(i),
						sheet.getTitleByName("上游节点"));
				int row2=sheet2.getExcelDataIndex(sheet2, sheet.getTitleByName("名称"), stemp);
				stemp = sheet2.getExcelData(sheet, row2,
						sheet2.getTitleByName("节点压力(MPa)"));
				
				re=checkNum(stemp,"阀","上游节点压力");
				if(!re.equals("OK")){
					return re;
				}

				stemp = sheet.getExcelData(sheet, rowList.get(i),
						sheet.getTitleByName("下游节点"));
				row2=sheet2.getExcelDataIndex(sheet2, sheet.getTitleByName("名称"), stemp);
				stemp = sheet2.getExcelData(sheet, row2,
						sheet2.getTitleByName("节点压力(MPa)"));
				re=checkNum(stemp,"阀","下游节点压力");
				if(!re.equals("OK")){
					return re;
				}

			}
		}
		return "OK";
	}
	
	public String check4() {
		// 在阀的属性窗口中，管长、管内径、绝对粗糙度、上下游节点的压力要大于0
		SheetContent sheet = getSheetByName(this, "管段连接");
		SheetContent sheet2 = getSheetByName(this, "节点数据");
		SheetContent sheet3 = getSheetByName(this, "往复式压缩机数据");
		if (sheet != null&&sheet.getTitleByName("管段类型")!=null) {
			List<Integer> rowList = sheet.getExcelDataIndexs(sheet,
					sheet.getTitleByName("管段类型"), "ReciCompressor");
			for (int i = 0; i < rowList.size(); i++) {
				String stemp = sheet.getExcelData(sheet, rowList.get(i),
						sheet.getTitleByName("设备名称"));
				int row=sheet3.getExcelDataIndex(sheet3, sheet3.getTitleByName("名称"), stemp);
				

				stemp = sheet3.getExcelData(sheet3, row,
						sheet3.getTitleByName("相对余隙容积α"));
				String re=checkNum(stemp,"往复式压缩机数据","相对余隙容积α");
				if(!re.equals("OK")){
					return re;
				}
				
				stemp = sheet3.getExcelData(sheet3, row,
						sheet3.getTitleByName("活塞直径D(m)"));
				re=checkNum(stemp,"往复式压缩机数据","活塞直径D(m)");
				if(!re.equals("OK")){
					return re;
				}
				
				stemp = sheet3.getExcelData(sheet3, row,
						sheet3.getTitleByName("活塞行程S(m)"));
				re=checkNum(stemp,"往复式压缩机数据","活塞行程S(m)");
				if(!re.equals("OK")){
					return re;
				}
				
				stemp = sheet3.getExcelData(sheet3, row,
						sheet3.getTitleByName("气缸级数n"));
				re=checkNumInt(stemp,"往复式压缩机数据","气缸级数n");
				if(!re.equals("OK")){
					return re;
				}
				
				stemp = sheet3.getExcelData(sheet3, row,
						sheet3.getTitleByName("转速N(r/min)"));
				re=checkNum(stemp,"往复式压缩机数据","转速N(r/min)");
				if(!re.equals("OK")){
					return re;
				}
				stemp = sheet.getExcelData(sheet, rowList.get(i),
						sheet.getTitleByName("上游节点"));
				int row2=sheet2.getExcelDataIndex(sheet2, sheet.getTitleByName("名称"), stemp);
				stemp = sheet2.getExcelData(sheet, row2,
						sheet2.getTitleByName("节点压力(MPa)"));
				re=checkNum(stemp,"往复式压缩机数据","上游节点压力");
				if(!re.equals("OK")){
					return re;
				}
				

				stemp = sheet.getExcelData(sheet, rowList.get(i),
						sheet.getTitleByName("下游节点"));
				row2=sheet2.getExcelDataIndex(sheet2, sheet.getTitleByName("名称"), stemp);
				stemp = sheet2.getExcelData(sheet, row2,
						sheet2.getTitleByName("节点压力(MPa)"));
				re=checkNum(stemp,"往复式压缩机数据","下游节点压力");
				if(!re.equals("OK")){
					return re;
				}

			}
		}
		return "OK";
	}
	
	public String check5(String type) {
		// 在气井和气源属性窗口中，流体的质量含气率需在(0,1)区间内，流体中的固体颗粒浓度需在[0,0.768]区间内，流体温度需大于0，体积流量和质量流量要小于0 ；

		SheetContent sheet = getSheetByName(this, "节点数据");

		if (sheet != null) {
			List<Integer> rowList = sheet.getExcelDataIndexs(sheet,
					sheet.getTitleByName("隶属关系"), type);
			for (int i = 0; i < rowList.size(); i++) {
				String stemp1 = sheet.getExcelData(sheet, rowList.get(i),
						sheet.getTitleByName("名称"));
				String stemp;
				Integer col=sheet.getTitleByName("流体的质量含气率");
		
				if(col!=null){
					stemp = sheet.getExcelData(sheet, rowList.get(i),col);
					String re=checkNum(stemp,type,"流体的质量含气率");
					if(!re.equals("OK")){
						return re;
					}
					double temp = Double.valueOf(stemp);
					if(temp<0||temp>1){
						return type+"中，"+"流体的质量含气率"+"要大于0小于1";
					}
				}
				
				col=sheet.getTitleByName("流体中的固体颗粒浓度(g/s)");
				
				if(col!=null){
					stemp = sheet.getExcelData(sheet, rowList.get(i),col);
					String re=checkNum(stemp,type,"流体中的固体颗粒浓度");
					if(!re.equals("OK")){
						return re;
					}
					double temp = Double.valueOf(stemp);
					if(temp<0||temp>0.768){
						return type+"中，"+"流体的质量含气率"+"要大于0小于0.768";
					}
				}
				
				col=sheet.getTitleByName("流体温度");				
				if(col!=null){
					stemp = sheet.getExcelData(sheet, rowList.get(i),col);
					String re=checkNum(stemp,type,"流体温度");
					if(!re.equals("OK")){
						return re;
					}					
				}
				
				col=sheet.getTitleByName("体积流量");				
				if(col!=null){
					stemp = sheet.getExcelData(sheet, rowList.get(i),col);
					String re=checkNumLow(stemp,type,"体积流量");
					if(!re.equals("OK")){
						return re;
					}					
				}
				
				col=sheet.getTitleByName("质量流量");				
				if(col!=null){
					stemp = sheet.getExcelData(sheet, rowList.get(i),col);
					String re=checkNumLow(stemp,type,"质量流量");
					if(!re.equals("OK")){
						return re;
					}					
				}

			}
		}
		return "OK";
	}
	public String check6() {
		// 在气井和气源属性窗口中，流体的质量含气率需在(0,1)区间内，流体中的固体颗粒浓度需在[0,0.768]区间内，流体温度需大于0，体积流量和质量流量要小于0 ；

		SheetContent sheet = getSheetByName(this, "节点数据");

		if (sheet != null) {		
			for (int i = 1; i < sheet.getSize(); i++) {
				String stemp1 = sheet.getExcelData(sheet, i,
						sheet.getTitleByName("名称"));
				String stemp;
				Integer col=sheet.getTitleByName("控制模式");
				stemp = sheet.getExcelData(sheet, i,col);
				if(stemp!=null&&!stemp.equals("")){
					if(stemp.equals("Pressure")){
						col=sheet.getTitleByName("节点压力(MPa)");
						stemp = sheet.getExcelData(sheet, i,col);
						String re=checkNum(stemp,"节点","节点压力");
						if(!re.equals("OK")){
							return re;
						}	
					}
				}else{
					return "节点数据中，控制模式不能为空";
				}			

			}
		}
		return "OK";
	}
	public String checkStatus() {
		String s=check1();
		if(!s.equals("OK")){
			return s;
		}
		s=check2();
		if(!s.equals("OK")){
			return s;
		}
		s=check3();
		if(!s.equals("OK")){
			return s;
		}
		s=check4();
		if(!s.equals("OK")){
			return s;
		}
		s=check5("气井");
		if(!s.equals("OK")){
			return s;
		}
		s=check5("气源");
		if(!s.equals("OK")){
			return s;
		}
		s=check6();
		if(!s.equals("OK")){
			return s;
		}
		
		return "OK";
	}
}
