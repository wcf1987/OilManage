package cn.edu.cup.file;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import cn.edu.cup.manage.business.DeviceKV;

public class TransTable {
	static String BASE[] = { "名称", "上游节点", "下游节点" };
	static String LXYSJ[] = { "X坐标(m)", "Y坐标(m)", "高程(m)", "特性曲线参数a", "特性曲线参数b" };
	static String WFYSJ[] = { "X坐标(m)", "Y坐标(m)", "高程(m)", "相对余隙容积α",
			"活塞直径D(m)", "活塞行程S(m)", "气缸级数n", "转速N(r/min)" };

	// static String
	// FA[]={"名称","上游节点","下游节点","X坐标(m)","Y坐标(m)","高程(m)","气体方程","管长(km)","管内径(m)","绝对粗糙度(m)"};
	static ArrayList<Note> JD = new ArrayList<Note>();
	static ArrayList<Note> GD = new ArrayList<Note>();
	static ArrayList<Note> FA = new ArrayList<Note>();
	static ArrayList<Note> GLQ = new ArrayList<Note>();
	static ArrayList<Note> JQZYZ = new ArrayList<Note>();
	static {

		
		
		
		
		
		
		
		JQZYZ.add(new Note("名称", "管段连接", "名称", "集气增压站数据", "设备名称", 0));
		JQZYZ.add(new Note("上游节点", "管段连接", "上游节点", "集气增压站数据", "设备名称", 0));
		JQZYZ.add(new Note("下游节点", "管段连接", "下游节点", "集气增压站数据", "设备名称", 0));
		JQZYZ.add(new Note("X坐标(m)", "离心压缩机数据", "X坐标(m)", "集气增压站数据", "名称", 1));
		JQZYZ.add(new Note("Y坐标(m)", "离心压缩机数据", "Y坐标(m)", "集气增压站数据", "名称", 1));
		JQZYZ.add(new Note("高程(m)", "离心压缩机数据", "高程(m)", "集气增压站数据", "名称", 1));
		JQZYZ.add(new Note("压缩机名称", "管段连接", "设备名称", "集气增压站数据", "设备名称", 0));
		JQZYZ.add(new Note("压缩机类型", "管段连接", "管段类型", "集气增压站数据", "设备名称", 4));
		JQZYZ.add(new Note("特性曲线参数a", "离心压缩机数据", "特性曲线参数a", "集气增压站数据", "名称", 0));
		JQZYZ.add(new Note("特性曲线参数b", "离心压缩机数据", "特性曲线参数b", "集气增压站数据", "名称", 0));
		JQZYZ.add(new Note("相对余隙容积α", "往复式压缩机数据", "相对余隙容积α", "集气增压站数据", "名称", 0));
		JQZYZ.add(new Note("活塞直径D(m)", "往复式压缩机数据", "活塞直径D(m)", "集气增压站数据", "名称",
				0));
		JQZYZ.add(new Note("活塞行程S(m)", "往复式压缩机数据", "活塞行程S(m)", "集气增压站数据", "名称",
				0));
		JQZYZ.add(new Note("气缸级数n", "往复式压缩机数据", "气缸级数n", "集气增压站数据", "名称", 0));
		JQZYZ.add(new Note("转速N(r/min)", "往复式压缩机数据", "转速N(r/min)", "集气增压站数据",
				"名称", 0));
		JQZYZ.add(new Note("上游节点压力(Mpa)", "节点数据", "节点压力(MPa)", "集气增压站数据", "名称", 2));
		JQZYZ.add(new Note("上游节点流量(m3/d)", "节点数据", "节点流量(m3/d)", "集气增压站数据","名称", 2));
		JQZYZ.add(new Note("下游节点压力(Mpa)", "节点数据", "节点压力(MPa)", "集气增压站数据", "名称", 3));
		JQZYZ.add(new Note("下游节点流量(m3/d)", "节点数据", "节点流量(m3/d)", "集气增压站数据","名称", 3));
		
		FA.add(new Note("名称", "管段连接", "名称", "阀数据", "设备名称", 0));
		FA.add(new Note("上游节点", "管段连接", "上游节点", "阀数据", "设备名称", 0));
		FA.add(new Note("下游节点", "管段连接", "下游节点", "阀数据", "设备名称", 0));
		FA.add(new Note("X坐标(m)", "阀数据", "X坐标(m)", "阀数据", "名称", 0));
		FA.add(new Note("Y坐标(m)", "阀数据", "Y坐标(m)", "阀数据", "名称", 0));
		FA.add(new Note("高程(m)", "阀数据", "高程(m)", "阀数据", "名称", 0));
		FA.add(new Note("气体方程", "管段连接", "气体方程", "阀数据", "设备名称", 0));
		FA.add(new Note("管长(km)", "管段连接", "管长(km)", "阀数据", "设备名称", 0));
		FA.add(new Note("管内径(m)", "管段连接", "管内径(m)", "阀数据", "设备名称", 0));
		FA.add(new Note("绝对粗糙度(m)", "管段连接", "绝对粗糙度(m)", "阀数据", "设备名称", 0));
		FA.add(new Note("上游节点压力(Mpa)", "节点数据", "节点压力(MPa)", "阀数据", "名称", 2));
		FA.add(new Note("上游节点流量(m3/d)", "节点数据", "节点流量(m3/d)", "阀数据","名称", 2));
		FA.add(new Note("下游节点压力(Mpa)", "节点数据", "节点压力(MPa)", "阀数据", "名称", 3));
		FA.add(new Note("下游节点流量(m3/d)", "节点数据", "节点流量(m3/d)", "阀数据","名称", 3));
		
		GLQ.add(new Note("名称", "管段连接", "名称", "过滤器数据", "设备名称", 0));
		GLQ.add(new Note("上游节点", "管段连接", "上游节点", "过滤器数据", "设备名称", 0));
		GLQ.add(new Note("下游节点", "管段连接", "下游节点", "过滤器数据", "设备名称", 0));
		GLQ.add(new Note("X坐标(m)", "过滤器数据", "X坐标(m)", "过滤器数据", "名称", 0));
		GLQ.add(new Note("Y坐标(m)", "过滤器数据", "Y坐标(m)", "过滤器数据", "名称", 0));
		GLQ.add(new Note("高程(m)", "过滤器数据", "高程(m)", "过滤器数据", "名称", 0));
		GLQ.add(new Note("管长(km)", "管段连接", "管长(km)", "过滤器数据", "设备名称", 0));
		GLQ.add(new Note("管内径(m)", "管段连接", "管内径(m)", "过滤器数据", "设备名称", 0));
		GLQ.add(new Note("上游节点压力(Mpa)", "节点数据", "节点压力(MPa)", "过滤器数据", "名称", 2));
		GLQ.add(new Note("上游节点流量(m3/d)", "节点数据", "节点流量(m3/d)", "过滤器数据","名称", 2));
		GLQ.add(new Note("下游节点压力(Mpa)", "节点数据", "节点压力(MPa)", "过滤器数据", "名称", 3));
		GLQ.add(new Note("下游节点流量(m3/d)", "节点数据", "节点流量(m3/d)", "过滤器数据","名称", 3));
		
	}
	String type;
	ArrayList<Note> temp;
	FileExcel excel;

	public TransTable(FileExcel excel1, String Type) {
		type = Type;
		if (Type.equals("过滤器数据")) {
			temp = GLQ;
		}
		if (Type.equals("阀数据")) {
			temp = FA;
		}
		if (Type.equals("离心压缩机数据")) {
			temp = JQZYZ;
		}
		if (Type.equals("往复式压缩机数据")) {
			temp = JQZYZ;
		}
		if (Type.equalsIgnoreCase("气井数据") || Type.equalsIgnoreCase("气源数据")
				|| Type.equalsIgnoreCase("分输点数据") || Type.equals("设备连接点数据")) {
			temp = JD;
		}
		if (Type.equalsIgnoreCase("管道数据") ) {
			temp = GD;
		}
		excel = excel1;
	}
	
	public List<DeviceKV> createData(String value) {
		List<DeviceKV> ab=new ArrayList<DeviceKV>();
		List<DeviceKV> a = new ArrayList<DeviceKV>();
		for (int i = 0; i < temp.size(); i++) {
			Note note = temp.get(i);
			if (note.getSpesial() ==0) {
				SheetContent sheet = excel.getSheetByName(excel,
						note.getExcelSheet());
				int row = sheet.getExcelDataIndex(sheet,
						sheet.getTitleByName(note.getSearchName()), value);
				String revalue="";
				if(row==-1){
					
					 revalue ="";
					
				}else{
				List<String> line = sheet.sheetContent.get(row);
				Map<String, String> map = sheet.getAttribute(line);

				String key = note.getExcelName();
				 revalue = map.get(key);
				}
				DeviceKV KV = new DeviceKV();
				KV.setName(note.getQianDuan());
				
				KV.setValue(revalue);
				a.add(KV);
				if(note.getQianDuan().endsWith("上游节点")||note.getQianDuan().endsWith("下游节点")){
					ab.add(KV);
				}
			} 
			if (note.getSpesial() ==4) {
				SheetContent sheet = excel.getSheetByName(excel,
						note.getExcelSheet());
				int row = sheet.getExcelDataIndex(sheet,
						sheet.getTitleByName(note.getSearchName()), value);
				String revalue="";
				if(row==-1){
					
					 revalue ="离心压缩机";
					
				}else{
				List<String> line = sheet.sheetContent.get(row);
				Map<String, String> map = sheet.getAttribute(line);

				String key = note.getExcelName();
				 revalue = map.get(key);
				}
				DeviceKV KV = new DeviceKV();
				KV.setName(note.getQianDuan());
				if(revalue.equals("CentCompressor")){
					revalue="离心压缩机";
				}else{
					revalue="往复式压缩机";
				}
				KV.setValue(revalue);
				a.add(KV);				
			} 
			if (note.getSpesial() ==1) {
				
					SheetContent sheet = excel.getSheetByName(excel,
							note.getExcelSheet());
					int row = sheet.getExcelDataIndex(sheet,
							sheet.getTitleByName(note.getSearchName()), value);
					DeviceKV KV = new DeviceKV();
					KV.setName(note.getQianDuan());
					if(row!=-1){						
						
							List<String> line = sheet.sheetContent.get(row);
							Map<String, String> map = sheet.getAttribute(line);
							String revalue = map.get(note.getExcelName());
							KV.setValue(revalue);
						
						a.add(KV);
					}else{
						
						sheet = excel.getSheetByName(excel,
								"往复式压缩机数据");
						 row = sheet.getExcelDataIndex(sheet,
								sheet.getTitleByName(note.getSearchName()), value);
							List<String> line = sheet.sheetContent.get(row);
							Map<String, String> map = sheet.getAttribute(line);
							String revalue = map.get(note.getExcelName());
							KV.setValue(revalue);
												
						a.add(KV);	
					}
					
				
				
			}
			if (note.getSpesial() ==2||note.getSpesial() ==3) {
				
				SheetContent sheet = excel.getSheetByName(excel,
						note.getExcelSheet());
				int row = sheet.getExcelDataIndex(sheet,
						sheet.getTitleByName(note.getSearchName()), ab.get(note.getSpesial()-2).getValue());
				DeviceKV KV = new DeviceKV();
				KV.setName(note.getQianDuan());
				if(row!=-1){						
					
						List<String> line = sheet.sheetContent.get(row);
						Map<String, String> map = sheet.getAttribute(line);
						String control = map.get("控制模式");
						if(control.equalsIgnoreCase("Flow")){
							if(note.getExcelName().indexOf("节点流量")!=-1){
								String revalue = map.get(note.getExcelName());
								KV.setValue(revalue);
								a.add(KV);
							}
						}else{
							if(note.getExcelName().indexOf("节点压力")!=-1){
								String revalue = map.get(note.getExcelName());
								KV.setValue(revalue);
								a.add(KV);
							}
						}
						
					
					
				}
				
			
			
		}
			
		}

		return a;
	}
	public void updateData(String name ,String proper,String newValue) {
		List<DeviceKV> ab=new ArrayList<DeviceKV>();
		List<DeviceKV> a = new ArrayList<DeviceKV>();
		for (int i = 0; i < temp.size(); i++) {
			Note note = temp.get(i);
			if(note.getQianDuan().equals(proper)){
				if (note.getSpesial() ==0) {
					SheetContent sheet = excel.getSheetByName(excel,
							note.getExcelSheet());
					int row = sheet.getExcelDataIndex(sheet,
							sheet.getTitleByName(note.getSearchName()), name);
					
					if(row!=-1){						
						sheet.editCell(row, sheet.getTitleByName(note.getExcelName()), newValue);
				}
				
				
				
			}			
			if (note.getSpesial() ==1) {
				    
					SheetContent sheet = excel.getSheetByName(excel,
							type);
					int row = sheet.getExcelDataIndex(sheet,
							sheet.getTitleByName(note.getSearchName()), name);
					if(row!=-1){						
						sheet.editCell(row, sheet.getTitleByName(note.getExcelName()), newValue);
				}
				
				
			}
			if (note.getSpesial() ==2||note.getSpesial() ==3) {
				SheetContent sheet = excel.getSheetByName(excel,
						"管段连接");
				int row = sheet.getExcelDataIndex(sheet,
						sheet.getTitleByName("设备名称"), name);
				String nametemp="";
				if(note.getSpesial()==2){
					 nametemp=sheet.getExcelData(sheet, row, sheet.getTitleByName("上游节点"));
				}
				if(note.getSpesial()==3){
					 nametemp=sheet.getExcelData(sheet, row, sheet.getTitleByName("下游节点"));
				}
				
				sheet = excel.getSheetByName(excel,
						note.getExcelSheet());
				row = sheet.getExcelDataIndex(sheet,
						sheet.getTitleByName(note.getSearchName()), nametemp);
				if(row!=-1){						
					sheet.editCell(row, sheet.getTitleByName(note.getExcelName()), newValue);
			     }
					
					
				}
			if (note.getSpesial() ==4) {
			    
				newValue=newValue+"数据";
				if(!type.equals(newValue)){
					SheetContent sheet = excel.getSheetByName(excel,
							type);
					SheetContent sheet2 = excel.getSheetByName(excel,
							newValue);
					SheetContent sheet3 = excel.getSheetByName(excel,
							note.ExcelSheet);
					int row = sheet.getExcelDataIndex(sheet,
							sheet.getTitleByName("名称"), name);
					
					if(row!=-1){						
						List<String> line = sheet.sheetContent.get(row);
						Map<String, String> map = sheet.getAttribute(line);
						
						//sheet.editCell(row, sheet.getTitleByName(note.getExcelName()), newValue);
						sheet2.addRow(map);
						sheet.removeRow(row);
						sheet.updateSheet();
					}
					 row = sheet3.getExcelDataIndex(sheet3,
							sheet3.getTitleByName(note.getSearchName()), name);
					
					if(row!=-1){						
						if(newValue.equals("离心压缩机数据")){
							newValue="CentCompressor";
						}else{
							newValue="ReciCompressor";
						}
						sheet3.editCell(row, sheet3.getTitleByName(note.getExcelName()), newValue);
						
					}
				}
				
			
			
		}
			
			
		}
			
		}

	}
}

class Note {
	String QianDuan;
	String ExcelSheet;
	String ExcelName;
	String SearchName;
	String Type;

	public String getSearchName() {
		return SearchName;
	}

	public void setSearchName(String searchName) {
		SearchName = searchName;
	}

	int spesial;

	public Note(String qianDuan, String excelSheet, String excelName,
			String type, String searchName, int spesial) {
		super();
		QianDuan = qianDuan;
		ExcelSheet = excelSheet;
		ExcelName = excelName;
		Type = type;
		SearchName = searchName;
		this.spesial = spesial;
	}

	public String getQianDuan() {
		return QianDuan;
	}

	public void setQianDuan(String qianDuan) {
		QianDuan = qianDuan;
	}

	public String getExcelSheet() {
		return ExcelSheet;
	}

	public void setExcelSheet(String excelSheet) {
		ExcelSheet = excelSheet;
	}

	public String getExcelName() {
		return ExcelName;
	}

	public void setExcelName(String excelName) {
		ExcelName = excelName;
	}

	public String getType() {
		return Type;
	}

	public void setType(String type) {
		Type = type;
	}

	public int getSpesial() {
		return spesial;
	}

	public void setSpesial(int spesial) {
		this.spesial = spesial;
	}

}