package cn.edu.cup.file;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.naming.ldap.StartTlsResponse;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;

import cn.edu.cup.map.business.Graphi;
import cn.edu.cup.map.business.Line;
import cn.edu.cup.map.business.Point;
import cn.edu.cup.tools.Tools;

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
	public int getTitleByName(String name){
		return this.sheetTitle.get(name);
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
			
			boolean flag=false;
			if(row!=null){
			for (int tIdex = row.getFirstCellNum();tIdex < row.getLastCellNum(); tIdex++) {
				if(rIndex==10&&this.Name.equals("节点参数")){
					//System.out.println("sus");
				}
				Cell temp = row.getCell(tIdex);
				String str=null;
				if(temp==null){
					
				}else{
					str=temp.toString();
				}
				if(str!=null&&!str.equals("")){
					flag=true;
				}
				
			}
			}
			if (row != null&&flag) {
				int firstCellIndex = sheet.getRow(firstRowIndex).getFirstCellNum();
				int lastCellIndex = sheet.getRow(firstRowIndex).getLastCellNum();
				valueTemp=new ArrayList<String>();
				
				
				
				for (int cIndex = firstCellIndex; cIndex < lastCellIndex; cIndex++) {
					Cell cell = row.getCell(cIndex);
					String value = "";
					if (cell != null) {
						value = cell.toString();
						if(rIndex==0&&value.equals(""))
						{
						
						}else{
							value=Tools.checkContent(value);
							valueTemp.add(value);
						}
						//System.out.print(value + "\t");
						if(rIndex==0&&!value.equals("")){
							if(this.sheetID==1){
							//	System.out.println("catch");
							}
							value=Tools.checkContent(value);
							this.sheetTitle.put(value, cIndex+1);
							
							colModel.add(new ColModel(value));
						}
					}else{
						value = "";
						if(rIndex>0)
						{
							value=Tools.checkContent(value);
							valueTemp.add(value);
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
		return sheetContent.size();
		
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
	public Map<String,Point> getPoints() {
		Map<String,Point> points=new HashMap<String, Point>();
		if(getName().indexOf("数据")!=-1||getName().indexOf("位置")!=-1){
			for(int i=1;i<this.sheetContent.size();i++){
				Point e=new Point();
				List<String> lineStr=this.sheetContent.get(i);
				if(this.sheetTitle.get("名称")==null){
					return points;
				}
				e.setName(lineStr.get(this.sheetTitle.get("名称")));
				e.setType(this.Name);
				e.setAttribute(getAttribute(lineStr));
				if(getAttrLike(lineStr,"X")==null){
					return points;
				}
				e.setGeodeticCoordinatesX(getAttrLike(lineStr,"X"));
				e.setGeodeticCoordinatesY(getAttrLike(lineStr,"Y"));
				e.getLatLonFromGeo();
				points.put(e.getName(),e);
			}
		}
		return points;
	}
	public Map<String,Point> getSimulationPoints(FileExcel f) {
		Map<String,Point> points=new HashMap<String, Point>();
		if(getName().indexOf("节点数据")!=-1){
			for(int i=1;i<this.sheetContent.size();i++){
				Point e=new Point();
				List<String> lineStr=this.sheetContent.get(i);
				if(this.sheetTitle.get("名称")==null){
					return points;
				}
				e.setName(lineStr.get(this.sheetTitle.get("名称")));
				e.setType(lineStr.get(this.sheetTitle.get("隶属关系")));
				e.setAttribute(getAttribute(lineStr));
				
				SheetContent a=f.getSheetByName(f,e.getType()+"数据");
				//int row=getExcelDataIndex(this, a.getTitleByName("名称"), lineStr.get(this.sheetTitle.get("气井、气源或分输点名称")));
				String X=lineStr.get(this.sheetTitle.get("X坐标(m)"));
				String Y=lineStr.get(this.sheetTitle.get("Y坐标(m)"));
				//String Z=lineStr.get(this.sheetTitle.get("高程(m)"));
				if(X==null||X.equalsIgnoreCase("")){
					X="0";
				}
				if(Y==null||Y.equalsIgnoreCase("")){
					Y="0";
				}
				//e.addAttr("高程(m)", z);
				e.setGeodeticCoordinatesX(Double.valueOf(X));
				e.setGeodeticCoordinatesY(Double.valueOf(Y));
				e.getLatLonFromGeo();
				points.put(e.getName(),e);
			}
		}
		if(getName().indexOf("管段连接")!=-1){
			for(int i=1;i<this.sheetContent.size();i++){
				Point e=new Point();
				List<String> lineStr=this.sheetContent.get(i);
				
				if(this.sheetTitle.get("名称")==null){
					return points;
				}
				Object it=this.sheetTitle.get("管段类型");
				String t;
				if(it==null){
					t="Pipe";
				}else{
					t=lineStr.get(this.sheetTitle.get("管段类型"));
				}
				if(t.equalsIgnoreCase("Pipe")){
					e.setType("管道");
					e.setName(lineStr.get(this.sheetTitle.get("名称")));

				}else{				
				if(t.equalsIgnoreCase("CentCompressor")){
					e.setName(lineStr.get(this.sheetTitle.get("设备名称")));
					e.setType("离心压缩机");
				}
				if(t.equalsIgnoreCase("ReciCompressor")){
					e.setName(lineStr.get(this.sheetTitle.get("设备名称")));
					e.setType("往复式压缩机");
				}
				if(t.equalsIgnoreCase("Filter")){
					e.setName(lineStr.get(this.sheetTitle.get("设备名称")));
					e.setType("过滤器");
				}
				if(t.equalsIgnoreCase("Valve")){
					e.setName(lineStr.get(this.sheetTitle.get("设备名称")));
					e.setType("阀");
				}
				SheetContent a=f.getSheetByName(f,e.getType()+"数据");
				int row=getExcelDataIndex(a, a.getTitleByName("名称"), lineStr.get(this.sheetTitle.get("设备名称")));
				//int col=a.getTitleByName("X坐标(m)");
				double x=0;
				//col=a.getTitleByName("Y坐标(m)");
				double y=0;
				
				Map attr1=a.getAttribute(a.sheetContent.get(row));
				e.addAttr(attr1);
				
				
				e.setGeodeticCoordinatesX(x);
				e.setGeodeticCoordinatesY(y);
				e.getLatLonFromGeo();
				}
				
				e.addAttr(getAttribute(lineStr));
				
				
				points.put(e.getName(),e);
			}
		}
		return points;
	}
	public List<Line> getSimulationLines() {
		List<Line> temp=new ArrayList<Line>();
		if(getName().indexOf("管段连接")!=-1){			 
			for(int i=1;i<this.sheetContent.size();i++){
				
				List<String> lineStr=this.sheetContent.get(i);
				Line e1=new Line();
				Line e2=new Line();
				String midlle;
				
				if(sheetTitle.get("管段类型")!=null&&lineStr.get(sheetTitle.get("管段类型")).equalsIgnoreCase("Pipe")){
					
					
					 midlle=lineStr.get(this.sheetTitle.get("名称"));
									
				}else{
					if(sheetTitle.get("管段类型")!=null){
						
						 midlle=lineStr.get(this.sheetTitle.get("设备名称"));
						
										
					}else{
						 midlle=lineStr.get(this.sheetTitle.get("名称"));
					}
				}
				
				e1.setStart(lineStr.get(this.sheetTitle.get("上游节点")));
				e1.setEnd(midlle);
				//e1.setLength(lineStr.get(this.sheetTitle.get("")));
				e1.setType("连接");
				e2.setStart(midlle);
				e2.setEnd(lineStr.get(this.sheetTitle.get("下游节点")));
				//e2.setLength(lineStr.get(this.sheetTitle.get("")));
				e2.setType("连接");
				//e.setAttribute(getAttribute(lineStr));
				temp.add(e1);
				temp.add(e2);
				
			}
			
		}

		return temp;
	}
	public  int getExcelDataIndex(SheetContent sheet, int col, String value) {
		List<List<String>> t1=sheet.sheetContent;
		for(int i=1;i<t1.size();i++){
			List<String> t2=t1.get(i);
			if(t2.get(col)!=null&&t2.get(col).equalsIgnoreCase(value)){
				return i;
			}
		}
		return -1;
	}
	private String getExcelData(SheetContent sheet, int i,int j) {
		List<List<String>> t1=sheet.sheetContent;
		return t1.get(i).get(j);
		
	}
	private Double getAttrLike(List<String> lineStr, String search) {
		String titleS;
		String value;
		int index;
		Map<String,String> t=new HashMap<String,String>();
		 for(Iterator<String> iter=sheetTitle.keySet().iterator();iter.hasNext();){
			 titleS=iter.next();
			 index=sheetTitle.get(titleS);
			 if(titleS.indexOf(search)!=-1){
				 if(lineStr.get(index).equals("")){
					 return null;
				 }
				return  Double.valueOf(lineStr.get(index));
			 }
			
			
		 }
		 return null;
	
	}
	public Map<String,String> getAttribute(List<String> lineStr){
	
		String titleS;
		String value;
		int index;
		Map<String,String> t=new HashMap<String,String>();
		 for(Iterator<String> iter=sheetTitle.keySet().iterator();iter.hasNext();){
			 titleS=iter.next();
			 index=sheetTitle.get(titleS);
			 if(index==0){
				 continue;
			 }
			 if(index>=lineStr.size()){
				 value="";
			 }else{
			 value=lineStr.get(index);
			 }
			 t.put(titleS, value);
		 }
		return t;
	}
	public List<Line> getLines() {
		List<Line> temp=new ArrayList<Line>();
		if(getName().indexOf("连接")!=-1){			 
			for(int i=1;i<this.sheetContent.size();i++){
				Line e=new Line();
				List<String> lineStr=this.sheetContent.get(i);
				if(lineStr.get(this.sheetTitle.get("管段顶点1"))==null||lineStr.get(this.sheetTitle.get("管段顶点1")).equals("")){
					continue;
				}
				e.setStart(lineStr.get(this.sheetTitle.get("管段顶点1")));
				e.setEnd(lineStr.get(this.sheetTitle.get("管段顶点2")));
				e.setLength(lineStr.get(this.sheetTitle.get("管段长度（km）")));
				e.setType(this.Name);
				e.setAttribute(getAttribute(lineStr));
				temp.add(e);
			}
			
		}
		/*if(getName().indexOf("管道")!=-1){			 
			for(int i=1;i<this.sheetContent.size();i++){
				Line e=new Line();
				List<String> lineStr=this.sheetContent.get(i);
				
				e.setStart(lineStr.get(this.sheetTitle.get("上游节点")));
				e.setEnd(lineStr.get(this.sheetTitle.get("下游节点")));
				e.setLength(lineStr.get(this.sheetTitle.get("管长（km）")));
				e.setType(this.Name);
				e.setAttribute(getAttribute(lineStr));
				temp.add(e);
			}
			
		}*/
		if(getName().indexOf("管段连接")!=-1){			 
			for(int i=1;i<this.sheetContent.size();i++){
				Line e=new Line();
				List<String> lineStr=this.sheetContent.get(i);
				String type=lineStr.get(this.sheetTitle.get("类型"));
				if(!type.equalsIgnoreCase("pipe")){
					continue;
				}
				e.setStart(lineStr.get(this.sheetTitle.get("上游节点")));
				e.setEnd(lineStr.get(this.sheetTitle.get("下游节点")));
				e.setLength(lineStr.get(this.sheetTitle.get("管长（km）")));
				e.setType(this.Name);
				e.setAttribute(getAttribute(lineStr));
				temp.add(e);
			}
			
		}
		return temp;
	}
	public Graphi getObstacle() {
		Graphi a=new Graphi();
		List<Line> lines=new ArrayList<Line>();
		Map<String,Point> points=new HashMap<String,Point>();
		String lastName="";
		Point lastPoint=null;
		Point startPoint=null;
		String name="";
		for(int i=1;i<this.sheetContent.size();i++){
			List<String> lineStr=this.sheetContent.get(i);
			Point e=new Point();
			Line line=new Line();
			e.setGeodeticCoordinatesX(getAttrLike(lineStr,"X"));
			e.setGeodeticCoordinatesY(getAttrLike(lineStr,"Y"));
			e.getLatLonFromGeo();
			String name1=lineStr.get(this.sheetTitle.get("名称"));
	
			if(name1==null||name1.equals("")){
				
			}else{
				name=name1;
			}
			e.setName(Tools.getUUID());
			e.setType(name);
			points.put(e.getName(),e);
			if(startPoint==null){
				startPoint=e;
			}
			if(lastName.equals(name)){
				
				line.setStart(lastPoint.getName());
				line.setEnd(e.getName());
				lines.add(line);
			}else{
				if(startPoint!=e){
				line.setStart(lastPoint.getName());
				line.setEnd(startPoint.getName());
				startPoint=e;
				lines.add(line);
				}
				lastName=name;
				
			}
			lastPoint=e;
		}
		Line line=new Line();
		line.setStart(lastPoint.getName());
		line.setEnd(startPoint.getName());		
		lines.add(line);
		a.setLines(lines);
		a.setPoints(points);
		return a;
	}
	public Map<String, List<Point>> getObstacleMap() {
		
		Map<String, List<Point>> pointsMap=new HashMap<String,List<Point>>();
		String lastName="";
		Point lastPoint=null;
		Point startPoint=null;
		String name="";
		List<Point> a=new ArrayList<>();
		for(int i=1;i<this.sheetContent.size();i++){
			List<String> lineStr=this.sheetContent.get(i);
			Point e=new Point();
			Line line=new Line();
			e.setGeodeticCoordinatesX(getAttrLike(lineStr,"X"));
			e.setGeodeticCoordinatesY(getAttrLike(lineStr,"Y"));
			e.getLatLonFromGeo();
			String name1=lineStr.get(this.sheetTitle.get("名称"));
	
			if(name1==null||name1.equals("")){
				
			}else{
				name=name1;
			}
			e.setName(Tools.getUUID());
			e.setType(name);
		
			if(startPoint==null){
				startPoint=e;
			}
			if(lastName.equals(name)){
				a.add(e);
				
			}else{
				if(startPoint!=e){
				
				pointsMap.put(e.getType(), a);
				a=new ArrayList<Point>();
				a.add(e);
				startPoint=e;
				}
				lastName=name;
				
			}
			lastPoint=e;
		}
		pointsMap.put(lastPoint.getType(), a);
		return pointsMap;
	}

	public void addObstacle(List<Map<String, String>> poly, String obsName) {
		Integer index=Double.valueOf(this.sheetContent.get(this.sheetContent.size()-1).get(1)).intValue();
		for(int i=0;i<poly.size();i++){
			index++;
			Map<String,String> p=poly.get(i);
			p.put("高程（m）", "0");
			p.put("序号", String.valueOf(index));
			
			if(i==0){
				p.put("名称", obsName);
				p.put("顶点数量", String.valueOf(poly.size()));
			}else{
				p.put("名称", "");
				p.put("顶点数量","");
			}
			
			addRow(p);
		}
		
	}
}
