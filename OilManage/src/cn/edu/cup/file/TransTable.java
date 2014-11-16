package cn.edu.cup.file;

import java.util.ArrayList;
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
	static ArrayList<Note> FA = new ArrayList<Note>();
	static ArrayList<Note> GLQ = new ArrayList<Note>();
	static ArrayList<Note> JQZYZ = new ArrayList<Note>();
	static {

		JQZYZ.add(new Note("名称", "管段连接", "名称", "集气增压站数据", "设备名称", 0));
		JQZYZ.add(new Note("上游节点", "管段连接", "上游节点", "集气增压站数据", "设备名称", 0));
		JQZYZ.add(new Note("下游节点", "管段连接", "下游节点", "集气增压站数据", "设备名称", 0));
		JQZYZ.add(new Note("X坐标(m)", "离心压缩机数据", "X坐标(m", "集气增压站数据", "名称", 1));
		JQZYZ.add(new Note("Y坐标(m)", "离心压缩机数据", "Y坐标(m)", "集气增压站数据", "名称", 1));
		JQZYZ.add(new Note("高程(m)", "离心压缩机数据", "高程(m)", "集气增压站数据", "名称", 1));
		JQZYZ.add(new Note("压缩机名称", "管段连接", "设备名称", "集气增压站数据", "设备名称", 0));
		JQZYZ.add(new Note("压缩机类型", "离心压缩机数据", "设备位置", "集气增压站数据", "名称", 1));
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

		FA.add(new Note("名称", "管段连接", "名称", "阀数据", "设备名称", 0));
		FA.add(new Note("上游节点", "管段连接", "上游节点", "阀数据", "设备名称", 0));
		FA.add(new Note("下游节点", "管段连接", "下游节点", "阀数据", "设备名称", 0));
		FA.add(new Note("X坐标(m)", "阀数据", "X坐标(m", "阀数据", "名称", 0));
		FA.add(new Note("Y坐标(m)", "阀数据", "Y坐标(m)", "阀数据", "名称", 0));
		FA.add(new Note("高程(m)", "阀数据", "高程(m)", "阀数据", "名称", 0));
		FA.add(new Note("气体方程", "管段连接", "气体方程", "阀数据", "设备名称", 0));
		FA.add(new Note("管长(km)", "管段连接", "管长(km)", "阀数据", "设备名称", 0));
		FA.add(new Note("管内径(m)", "管段连接", "管内径(m)", "阀数据", "设备名称", 0));
		FA.add(new Note("绝对粗糙度(m)", "管段连接", "绝对粗糙度(m)", "阀数据", "设备名称", 0));

		GLQ.add(new Note("名称", "管段连接", "名称", "过滤器数据", "设备名称", 0));
		GLQ.add(new Note("上游节点", "管段连接", "上游节点", "过滤器数据", "设备名称", 0));
		GLQ.add(new Note("下游节点", "管段连接", "下游节点", "过滤器数据", "设备名称", 0));
		GLQ.add(new Note("X坐标(m)", "过滤器数据", "X坐标(m", "过滤器数据", "名称", 0));
		GLQ.add(new Note("Y坐标(m)", "过滤器数据", "Y坐标(m)", "过滤器数据", "名称", 0));
		GLQ.add(new Note("高程(m)", "过滤器数据", "高程(m)", "过滤器数据", "名称", 0));
		GLQ.add(new Note("管长(km)", "管段连接", "管长(km)", "过滤器数据", "设备名称", 0));
		GLQ.add(new Note("管内径(m)", "管段连接", "管内径(m)", "过滤器数据", "设备名称", 0));
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
		excel = excel1;
	}
	
	public List<DeviceKV> createData(String value) {
		List<DeviceKV> a = new ArrayList<DeviceKV>();
		for (int i = 0; i < temp.size(); i++) {
			Note note = temp.get(i);
			if (note.getSpesial() != 1) {
				SheetContent sheet = excel.getSheetByName(excel,
						note.getExcelSheet());
				int row = sheet.getExcelDataIndex(sheet,
						sheet.getTitleByName(note.getSearchName()), value);
				if(row==-1){
					DeviceKV KV = new DeviceKV();
					KV.setName(note.getQianDuan());
					KV.setValue("");
					a.add(KV);
					continue;
				}
				List<String> line = sheet.sheetContent.get(row);
				Map<String, String> map = sheet.getAttribute(line);

				String key = note.getExcelName();
				String revalue = map.get(key);

				DeviceKV KV = new DeviceKV();
				KV.setName(note.getQianDuan());
				KV.setValue(revalue);
				a.add(KV);
			} else {
				
					SheetContent sheet = excel.getSheetByName(excel,
							note.getExcelSheet());
					int row = sheet.getExcelDataIndex(sheet,
							sheet.getTitleByName(note.getSearchName()), value);
					DeviceKV KV = new DeviceKV();
					KV.setName(note.getQianDuan());
					if(row!=-1){						
						if(note.getQianDuan().equals("压缩机类型"))
						{
							KV.setValue("离心压缩机");}
						else
						{
							List<String> line = sheet.sheetContent.get(row);
							Map<String, String> map = sheet.getAttribute(line);
							String revalue = map.get(note.getExcelName());
							KV.setValue(revalue);
						}
						a.add(KV);
					}else{
						if(note.getQianDuan().equals("压缩机类型"))
						{
							KV.setValue("往复式压缩机");}
						else
						{ sheet = excel.getSheetByName(excel,
								"往复式压缩机数据");
						 row = sheet.getExcelDataIndex(sheet,
								sheet.getTitleByName(note.getSearchName()), value);
							List<String> line = sheet.sheetContent.get(row);
							Map<String, String> map = sheet.getAttribute(line);
							String revalue = map.get(note.getExcelName());
							KV.setValue(revalue);
						}						
						a.add(KV);	
					}
					
				
				
			}
		}

		return a;
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